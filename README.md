# Pintro Fullstack Test

Ini adalah proyek ujian fullstack developer untuk Pintro. Proyek ini mencakup tiga teknologi utama:

- **Laravel** sebagai backend
- **Next.js** sebagai frontend
- **Flutter** untuk aplikasi mobile

## 📂 Struktur Folder

```
project-root/
│-- backend/    # Laravel
│-- frontend/   # Next.js
│-- mobile/     # Flutter
```

## 🚀 Teknologi yang Digunakan

- **Backend**: Laravel 8
- **Frontend**: Next.js 15 dengan TypeScript
- **Mobile**: Flutter
- **Database**: Tidak digunakan (tanpa database, hanya REST API)
- **Payment Gateway**: Midtrans (integrasi API untuk transaksi)

## 🛠️ Cara Menjalankan Proyek

### 1. Clone Repository
```bash
git clone https://github.com/mukminlittaqwa/test-pintro.git
cd test-pintro
```

### 2. Jalankan Backend (Laravel)
```bash
cd backend
composer install
cp .env.example .env
php artisan key:generate
php artisan serve
```

### 3. Jalankan Frontend (Next.js)
```bash
cd frontend
npm install
npm run dev
```

### 4. Jalankan Mobile (Flutter)
```bash
cd mobile
flutter pub get
flutter run
```

## 🔔 Webhook & Midtrans API
- Backend Laravel mengelola webhook untuk menerima notifikasi dari Midtrans.
- Endpoint yang digunakan: `/api/midtrans/notification`
- Untuk menguji webhook, gunakan `curl` atau Postman dengan request JSON sesuai dengan dokumentasi Midtrans.

## 📌 Catatan Penting
- **Jangan lupa** menambahkan `.gitignore` untuk menghindari push `node_modules`, `vendor`, dan `build` files.
- Pastikan **Midtrans Server Key** dikonfigurasi dengan benar di `.env` backend Laravel.

## 📄 Lisensi
Proyek ini dibuat untuk keperluan ujian Pintro dan tidak untuk distribusi komersial.

---

🔥 Selamat mengerjakan! Jika ada pertanyaan, silakan buka issue atau pull request. 🚀
