## Fitur Utama

- **Pengajuan Cuti, Izin, dan Sakit**: Pengguna dapat mengajukan cuti, izin, dan sakit melalui aplikasi. Surat dokter untuk pengajuan sakit dapat diupload ke Cloudinary dan dapat diakses langsung dari aplikasi. Untuk tampilan lebih jelas, surat dokter akan dialihkan ke web.

- **Approval dan Notifikasi**: Setelah pengajuan, cuti, izin, dan sakit perlu melalui proses approval. Pengguna akan menerima pesan notifikasi mengenai status pengajuan mereka.

- **Absensi Berbasis QR Code**:
  - QR code untuk absensi di-generate secara otomatis.
  - QR code untuk check-in atau check-out hanya dapat digunakan oleh pengguna dengan `userId` yang sama dengan yang login saat itu.
  - QR code dilengkapi dengan `secretKey` untuk memastikan setiap kode hanya bisa digunakan sekali. QR code harus di-generate ulang untuk penggunaan berikutnya.

## Teknologi yang Digunakan

- **Flutter**: Framework untuk membangun aplikasi mobile dengan antarmuka pengguna yang responsif.
- **Firebase**: Platform backend untuk database dan autentikasi.
- **Cloudinary**: Layanan untuk penyimpanan dan pengelolaan gambar.
- **Hyper UI**: Template reusable widgets Flutter untuk mempercepat pengembangan aplikasi.

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/Ripaldiansyah/absensi-with-firebase.git

   ```
2. Navigate to the project folder:
   ```bash
   cd absensi-with-firebase

   ```
3. Open with vscode:
   ```bash
   code .
   ```
4. Clean before use:

   ```bash
   Flutter clean

   ```

5. Instal Dependency:
   ```bash
   dart pub get
   ```

## 🛠 Skills

- Java
- Spring Boot
- Dart
- Flutter
- Firebase
- MySQL
- PostgreSQL
- SQLite
- JavaScript

## 🔗 Links

[![linkedin](https://img.shields.io/badge/linkedin-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/ripaldiansyah/)
