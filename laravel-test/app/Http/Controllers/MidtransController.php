<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Midtrans\Config;
use Midtrans\Snap;
use Midtrans\Transaction;

class MidtransController extends Controller
{
    public function createTransaction(Request $request)
    {
        Config::$serverKey = config('midtrans.server_key');
        Config::$isProduction = config('midtrans.is_production');
        Config::$isSanitized = config('midtrans.is_sanitized');
        Config::$is3ds = config('midtrans.is_3ds');

        $orderId = 'ORDER-' . uniqid();

        $params = [
            'transaction_details' => [
                'order_id' => $orderId,
                'gross_amount' => $request->amount,
            ],
            'customer_details' => [
                'first_name' => $request->name,
                'email' => $request->email,
                'phone' => $request->phone,
            ],
        ];

        try {
            $snapToken = Snap::getSnapToken($params);

            return response()->json([
                'order_id'       => $orderId,
                'amount'         => $request->amount,
                'customer'       => $params['customer_details'],
                'payment_url'    => "https://app.sandbox.midtrans.com/snap/v2/vtweb/$snapToken",
                'snap_token'     => $snapToken,
                'status'         => 'pending'
            ]);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }

    public function handleNotification(Request $request)
    {
        $serverKey = config('midtrans.server_key');
        $notif = json_decode($request->getContent(), true);

        if (!$notif || !isset($notif['transaction_status'])) {
            return response()->json(['message' => 'Invalid request'], 400);
        }

        $expectedSignature = hash("sha512", $notif['order_id'] . $notif['status_code'] . $notif['gross_amount'] . $serverKey);
        if ($expectedSignature !== $notif['signature_key']) {
            return response()->json(['message' => 'Invalid signature'], 403);
        }

        $transaction_status = $notif['transaction_status'];
        $order_id = $notif['order_id'];
        $gross_amount = $notif['gross_amount'];
        $payment_type = $notif['payment_type'];

        if ($transaction_status == 'capture' || $transaction_status == 'settlement') {
            return response()->json([
                'message'       => 'Payment successful',
                'order_id'      => $order_id,
                'gross_amount'  => $gross_amount,
                'status'        => 'success',
                'payment_type'  => $payment_type
            ]);
        } elseif ($transaction_status == 'pending') {
            return response()->json([
                'message'       => 'Payment pending',
                'order_id'      => $order_id,
                'gross_amount'  => $gross_amount,
                'status'        => 'pending'
            ]);
        } elseif (in_array($transaction_status, ['deny', 'expire', 'cancel'])) {
            return response()->json([
                'message'       => 'Payment failed',
                'order_id'      => $order_id,
                'gross_amount'  => $gross_amount,
                'status'        => 'failed'
            ]);
        }

        return response()->json(['message' => 'Notification received']);
    }
}
