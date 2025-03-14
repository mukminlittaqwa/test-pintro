<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class StudentController extends Controller
{
    public function generatePdf()
    {
        // Data statis tanpa database
        $student = [
            'name' => 'John Doe',
            'nis' => '123456789',
            'class' => '10-A',
            'photo' => public_path('images/default-photo.jpg') // Foto default
        ];

        // Load view dan kirim data
        $pdf = PDF::loadView('students.pdf', compact('student'));

        // Menampilkan PDF langsung di browser tanpa download
        return $pdf->stream('kartu_siswa.pdf');
    }
}
