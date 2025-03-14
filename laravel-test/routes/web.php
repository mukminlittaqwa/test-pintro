<?php

use Illuminate\Support\Facades\Route;
use Barryvdh\DomPDF\Facade\Pdf;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});


Route::get('/kartu-siswa', function () {
    $student = [
        'name'   => 'John Doe',
        'nis'    => '123456789',
        'photo'  => public_path('img/profile-placeholder.png'),
        'qrcode' => public_path('img/qrcode.png')
    ];

    $customPaper = [0, 0, 161.575, 256.118];

    $pdf = PDF::loadView('pdf', compact('student'))
        ->setPaper($customPaper, 'portrait');

    return $pdf->stream('kartu-siswa.pdf');
});
