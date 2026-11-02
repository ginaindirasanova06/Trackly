-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: trackly_db
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `berkas_rm`
--

DROP TABLE IF EXISTS `berkas_rm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `berkas_rm` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `no_rm` varchar(20) NOT NULL,
  `nama_pasien` varchar(100) NOT NULL,
  `tahun_buka` int(4) NOT NULL,
  `lokasi_rak` varchar(30) NOT NULL,
  `kode_qr` varchar(36) NOT NULL,
  `status` enum('tersedia','dipinjam') NOT NULL DEFAULT 'tersedia',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `no_rm` (`no_rm`),
  UNIQUE KEY `kode_qr` (`kode_qr`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `berkas_rm`
--

LOCK TABLES `berkas_rm` WRITE;
/*!40000 ALTER TABLE `berkas_rm` DISABLE KEYS */;
INSERT INTO `berkas_rm` VALUES (6,'00-12-34','Ahmad Subarjo',2021,'Rak A-01','trc-5d1c4455-644d-4562-a916-5d5dbfb4','tersedia','2026-10-21 18:56:48','2026-10-22 13:44:38'),(7,'00-45-67','Siti Aminah',2022,'Rak A-02','trc-b2c3d4e5-f6a7-8901-2222-33334444','tersedia','2026-10-21 18:56:48','2026-10-21 18:56:48'),(8,'00-78-90','Bambang Pamungkas',2020,'Rak B-01','trc-c3d4e5f6-a7b8-9012-3333-44445555','tersedia','2026-10-21 18:56:48','2026-10-21 18:56:48'),(9,'00-23-45','Dewi Sartika',2023,'Rak B-03','trc-d4e5f6a7-b8c9-0123-4444-55556666','dipinjam','2026-10-21 18:56:48','2026-10-22 15:01:19'),(10,'00-34-56','Eko Prasetyo',2024,'Rak C-02','trc-e5f6a7b8-c9d0-1234-5555-66667777','dipinjam','2026-10-21 18:56:48','2026-10-22 11:04:48'),(11,'00-99-99','Pasien Uji Fase 2',2025,'Rak Z-99','trc-10b701a9-382e-4738-a54c-f1696df0','tersedia','2026-10-21 19:10:21','2026-10-21 19:10:21'),(12,'99-25-50','Pasien Uji 99-25-50',2025,'Rak Z-99','trc-8a3b6661-0d90-405e-b69e-eb4a241e','tersedia','2026-10-21 19:14:34','2026-10-21 19:14:34'),(13,'99-66-10','Pasien Integrasi Satu',2023,'Rak C-01','trc-c41dc699-df17-4718-9622-fe753012','tersedia','2026-10-21 20:15:46','2026-10-21 20:15:49'),(14,'99-21-32','Pasien Integrasi Dua',2024,'Rak C-02','trc-8d0f563e-1575-4124-bf46-1f99a276','tersedia','2026-10-21 20:15:46','2026-10-21 20:15:46'),(17,'00-23-78','Gina Indira',2026,'Rak A-25','trc-e516d114-7784-49ed-b751-2c97105b','tersedia','2026-10-22 10:53:16','2026-10-22 11:49:44'),(18,'00-12-55','Nabila',2026,'Rak A-30','trc-fd4188d4-6ab7-497a-850c-9e394e95','dipinjam','2026-10-22 15:08:31','2026-10-22 15:15:56'),(19,'00-22-98','Gina Indira Sanova',2024,'Rak A-80','trc-929a2707-6365-4dbb-8c7c-abcb5d23','tersedia','2026-10-22 18:12:21','2026-10-23 12:59:21');
/*!40000 ALTER TABLE `berkas_rm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_aktivitas`
--

DROP TABLE IF EXISTS `log_aktivitas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_aktivitas` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT NULL,
  `aksi` varchar(50) NOT NULL,
  `keterangan` text NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `log_aktivitas_user_id_foreign` (`user_id`),
  CONSTRAINT `log_aktivitas_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_aktivitas`
--

LOCK TABLES `log_aktivitas` WRITE;
/*!40000 ALTER TABLE `log_aktivitas` DISABLE KEYS */;
INSERT INTO `log_aktivitas` VALUES (27,5,'otp_dikirim','OTP login dikirim ke admin@trackly.local','::1','2026-10-21 18:59:29'),(28,5,'login_sukses','Pengguna admin (admin) berhasil login melalui verifikasi OTP','::1','2026-10-21 18:59:38'),(29,5,'otp_dikirim','OTP login dikirim ke admin@trackly.local','::1','2026-10-21 19:10:18'),(30,5,'login_sukses','Pengguna admin (admin) berhasil login melalui verifikasi OTP','::1','2026-10-21 19:10:19'),(31,5,'tambah_unit','Menambahkan master unit baru: Poli Mata (P-MTA)','::1','2026-10-21 19:10:20'),(32,5,'tambah_berkas','Registrasi berkas rekam medis baru: No. RM 00-99-99 a/n Pasien Uji Fase 2','::1','2026-10-21 19:10:21'),(33,5,'tambah_pengguna','Membuat akun pengguna baru: Staf Uji Coba (staf_uji) dengan peran petugas_rm','::1','2026-10-21 19:10:23'),(34,5,'ubah_pengaturan','Memperbarui parameter pengaturan sistem (Durasi pinjam: 3 hari, Instansi: RSUD Trackly Medika Sejahtera)','::1','2026-10-21 19:10:24'),(35,5,'logout','Pengguna keluar dari aplikasi','::1','2026-10-21 19:10:25'),(36,7,'otp_dikirim','OTP login dikirim ke petugas.unit@trackly.local','::1','2026-10-21 19:10:26'),(37,7,'login_sukses','Pengguna petugas_unit (petugas_unit) berhasil login melalui verifikasi OTP','::1','2026-10-21 19:10:27'),(38,5,'otp_dikirim','OTP login dikirim ke admin@trackly.local','::1','2026-10-21 19:12:16'),(39,5,'login_sukses','Pengguna admin (admin) berhasil login melalui verifikasi OTP','::1','2026-10-21 19:12:17'),(40,5,'tambah_pengguna','Membuat akun pengguna baru: Staf Uji Coba 1792584740 (staf_1792584740) dengan peran petugas_rm','::1','2026-10-21 19:12:20'),(41,5,'admin_reset_sandi','Admin mereset kata sandi pengguna admin. Sandi sementara dibuat.','::1','2026-10-21 19:12:21'),(42,5,'ubah_pengaturan','Memperbarui parameter pengaturan sistem (Durasi pinjam: 3 hari, Instansi: RSUD Trackly Medika Sejahtera)','::1','2026-10-21 19:12:22'),(43,5,'logout','Pengguna keluar dari aplikasi','::1','2026-10-21 19:12:23'),(44,7,'otp_dikirim','OTP login dikirim ke petugas.unit@trackly.local','::1','2026-10-21 19:12:25'),(45,7,'login_sukses','Pengguna petugas_unit (petugas_unit) berhasil login melalui verifikasi OTP','::1','2026-10-21 19:12:25'),(46,5,'login_gagal','Percobaan login gagal untuk user admin (gagal ke-1)','::1','2026-10-21 19:12:55'),(47,7,'otp_dikirim','OTP login dikirim ke petugas.unit@trackly.local','::1','2026-10-21 19:13:02'),(48,7,'login_sukses','Pengguna petugas_unit (petugas_unit) berhasil login melalui verifikasi OTP','::1','2026-10-21 19:13:03'),(49,5,'otp_dikirim','OTP login dikirim ke admin@trackly.local','::1','2026-10-21 19:14:32'),(50,5,'login_sukses','Pengguna admin (admin) berhasil login melalui verifikasi OTP','::1','2026-10-21 19:14:33'),(51,5,'tambah_unit','Menambahkan master unit baru: Unit Test U253 (U253)','::1','2026-10-21 19:14:33'),(52,5,'tambah_berkas','Registrasi berkas rekam medis baru: No. RM 99-25-50 a/n Pasien Uji 99-25-50','::1','2026-10-21 19:14:34'),(53,5,'tambah_pengguna','Membuat akun pengguna baru: Staf Uji Coba 1792584875 (staf_1792584875) dengan peran petugas_rm','::1','2026-10-21 19:14:36'),(54,5,'admin_reset_sandi','Admin mereset kata sandi pengguna staf_1792584875. Sandi sementara dibuat.','::1','2026-10-21 19:14:37'),(55,5,'ubah_pengaturan','Memperbarui parameter pengaturan sistem (Durasi pinjam: 3 hari, Instansi: RSUD Trackly Medika Sejahtera)','::1','2026-10-21 19:14:37'),(56,5,'logout','Pengguna keluar dari aplikasi','::1','2026-10-21 19:14:38'),(57,7,'otp_dikirim','OTP login dikirim ke petugas.unit@trackly.local','::1','2026-10-21 19:14:40'),(58,7,'login_sukses','Pengguna petugas_unit (petugas_unit) berhasil login melalui verifikasi OTP','::1','2026-10-21 19:14:40'),(59,5,'login_gagal','Percobaan login gagal untuk user admin (gagal ke-1)','::1','2026-10-21 19:46:07'),(60,5,'login_gagal','Percobaan login gagal untuk user admin (gagal ke-2)','::1','2026-10-21 19:46:42'),(61,5,'login_gagal','Percobaan login gagal untuk user admin (gagal ke-3)','::1','2026-10-21 19:48:17'),(62,5,'otp_dikirim','OTP login dikirim ke admin@trackly.local','::1','2026-10-21 19:49:26'),(63,5,'login_sukses','Pengguna admin (admin) berhasil login melalui verifikasi OTP','::1','2026-10-21 19:49:27'),(64,5,'regenerate_qr','Membuat ulang QR Code berkas No. RM 00-12-34 — kode lama tidak berlaku.','::1','2026-10-21 19:49:30'),(65,5,'otp_dikirim','OTP login dikirim ke admin@trackly.local','::1','2026-10-21 19:51:00'),(66,5,'login_sukses','Pengguna admin (admin) berhasil login melalui verifikasi OTP','::1','2026-10-21 19:51:00'),(67,5,'otp_dikirim','OTP login dikirim ke admin@trackly.local','::1','2026-10-21 19:53:52'),(68,5,'login_sukses','Pengguna admin (admin) berhasil login melalui verifikasi OTP','::1','2026-10-21 19:53:53'),(69,5,'pinjam_berkas','Mencatat peminjaman berkas No. RM 00-12-34 oleh Dr. Budi Santoso (Unit: Poli Penyakit Dalam, Tujuan: Pelayanan pasien)','::1','2026-10-21 19:53:54'),(70,5,'otp_dikirim','OTP login dikirim ke admin@trackly.local','::1','2026-10-21 19:54:29'),(71,5,'login_sukses','Pengguna admin (admin) berhasil login melalui verifikasi OTP','::1','2026-10-21 19:54:30'),(72,5,'kembali_berkas','Mencatat pengembalian berkas No. RM 00-12-34 a/n Ahmad Subarjo, kondisi: Lengkap','::1','2026-10-21 19:54:31'),(73,5,'otp_dikirim','OTP login dikirim ke admin@trackly.local','::1','2026-10-21 20:09:58'),(74,5,'login_sukses','Pengguna admin (admin) berhasil login melalui verifikasi OTP','::1','2026-10-21 20:09:59'),(75,5,'laporan_export_excel','Mengekspor laporan peminjaman ke format Excel/CSV (2026-09-21 s/d 2026-10-21)','::1','2026-10-21 20:10:00'),(76,5,'laporan_export_pdf','Membuka/Mencetak laporan PDF peminjaman (2026-09-21 s/d 2026-10-21)','::1','2026-10-21 20:10:00'),(77,5,'belum_kembali_export_excel','Mengekspor daftar berkas belum kembali ke Excel/CSV','::1','2026-10-21 20:10:00'),(78,5,'otp_dikirim','OTP login dikirim ke admin@trackly.local','::1','2026-10-21 20:15:44'),(79,5,'login_sukses','Pengguna admin (admin) berhasil login melalui verifikasi OTP','::1','2026-10-21 20:15:45'),(80,5,'impor_berkas','Mengimpor berkas rekam medis massal dari CSV: 2 berhasil, 0 dilewati.','::1','2026-10-21 20:15:46'),(81,5,'pinjam_berkas','Mencatat peminjaman berkas No. RM 99-66-10 oleh Dr. Ratna Indah (Unit: Poli Penyakit Dalam, Tujuan: Pelayanan pasien)','::1','2026-10-21 20:15:47'),(82,5,'perpanjang_peminjaman','Memperpanjang peminjaman berkas No. RM 99-66-10 s/d 2026-10-26. Alasan: Pasien memerlukan pemeriksaan lanjutan di poli spesialis','::1','2026-10-21 20:15:48'),(83,5,'kembali_berkas','Mencatat pengembalian berkas No. RM 99-66-10 a/n Pasien Integrasi Satu, kondisi: Lengkap','::1','2026-10-21 20:15:49'),(84,5,'laporan_export_excel','Mengekspor laporan peminjaman ke format Excel/CSV (2026-09-21 s/d 2026-10-21)','::1','2026-10-21 20:15:49'),(85,5,'laporan_export_pdf','Membuka/Mencetak laporan PDF peminjaman (2026-09-21 s/d 2026-10-21)','::1','2026-10-21 20:15:50'),(86,5,'belum_kembali_export_excel','Mengekspor daftar berkas belum kembali ke Excel/CSV','::1','2026-10-21 20:15:50'),(87,5,'otp_dikirim','OTP login dikirim ke admin@trackly.local','::1','2026-10-21 20:16:20'),(88,5,'login_sukses','Pengguna admin (admin) berhasil login melalui verifikasi OTP','::1','2026-10-21 20:16:20'),(89,5,'impor_berkas','Mengimpor berkas rekam medis massal dari CSV: 2 berhasil, 0 dilewati.','::1','2026-10-21 20:16:21'),(90,5,'pinjam_berkas','Mencatat peminjaman berkas No. RM 99-68-95 oleh Dr. Ratna Indah (Unit: Poli Penyakit Dalam, Tujuan: Pelayanan pasien)','::1','2026-10-21 20:16:22'),(91,5,'perpanjang_peminjaman','Memperpanjang peminjaman berkas No. RM 99-68-95 s/d 2026-10-26. Alasan: Pasien memerlukan pemeriksaan lanjutan di poli spesialis','::1','2026-10-21 20:16:23'),(92,5,'kembali_berkas','Mencatat pengembalian berkas No. RM 99-68-95 a/n Pasien Integrasi Satu, kondisi: Lengkap','::1','2026-10-21 20:16:24'),(93,5,'laporan_export_excel','Mengekspor laporan peminjaman ke format Excel/CSV (2026-09-21 s/d 2026-10-21)','::1','2026-10-21 20:16:25'),(94,5,'laporan_export_pdf','Membuka/Mencetak laporan PDF peminjaman (2026-09-21 s/d 2026-10-21)','::1','2026-10-21 20:16:25'),(95,5,'belum_kembali_export_excel','Mengekspor daftar berkas belum kembali ke Excel/CSV','::1','2026-10-21 20:16:25'),(96,5,'logout','Pengguna keluar dari aplikasi','::1','2026-10-21 20:27:33'),(97,8,'otp_dikirim','OTP login dikirim ke kepala.rm@trackly.local','::1','2026-10-21 20:44:12'),(98,8,'login_sukses','Pengguna kepala (kepala) berhasil login melalui verifikasi OTP','::1','2026-10-21 20:44:21'),(99,5,'login_gagal','Percobaan login gagal untuk user admin (gagal ke-1)','::1','2026-10-21 21:15:53'),(100,5,'login_gagal','Percobaan login gagal untuk user admin (gagal ke-2)','::1','2026-10-21 21:17:25'),(101,5,'login_gagal','Percobaan login gagal untuk user admin (gagal ke-3)','::1','2026-10-21 21:18:09'),(102,5,'login_gagal','Percobaan login gagal untuk user admin (gagal ke-4)','::1','2026-10-21 21:19:32'),(103,5,'login_gagal','Percobaan login gagal untuk user admin (gagal ke-5)','::1','2026-10-21 21:20:05'),(104,5,'login_gagal','Percobaan login gagal untuk user admin (gagal ke-1)','::1','2026-10-21 21:23:20'),(105,5,'login_gagal','Percobaan login gagal untuk user admin (gagal ke-2)','::1','2026-10-21 21:24:19'),(106,5,'otp_dikirim','OTP login dikirim ke admin@trackly.local','::1','2026-10-21 21:25:33'),(107,5,'login_sukses','Pengguna admin (admin) berhasil login melalui verifikasi OTP','::1','2026-10-21 21:25:34'),(108,8,'logout','Pengguna keluar dari aplikasi','::1','2026-10-21 21:30:04'),(109,5,'otp_dikirim','OTP login dikirim ke admin@trackly.local','::1','2026-10-22 10:45:13'),(110,5,'login_sukses','Pengguna admin (admin) berhasil login melalui verifikasi OTP','::1','2026-10-22 10:45:14'),(111,5,'otp_dikirim','OTP login dikirim ke admin@trackly.local','::1','2026-10-22 10:48:20'),(112,5,'login_sukses','Pengguna admin (admin) berhasil login melalui verifikasi OTP','::1','2026-10-22 10:48:21'),(113,5,'otp_dikirim','OTP login dikirim ke admin@trackly.local','::1','2026-10-22 10:49:58'),(114,5,'login_sukses','Pengguna admin (admin) berhasil login melalui verifikasi OTP','::1','2026-10-22 10:50:08'),(115,5,'tambah_berkas','Registrasi berkas rekam medis baru: No. RM 1234567 a/n Gina Indira','::1','2026-10-22 10:53:16'),(116,5,'pinjam_berkas','Mencatat peminjaman berkas No. RM 00-34-56 oleh dr.Andi (Unit: Instalasi Gawat Darurat (IGD), Tujuan: Pelayanan pasien)','::1','2026-10-22 11:04:48'),(117,5,'pinjam_berkas','Mencatat peminjaman berkas No. RM 00-12-34 oleh dr.Andi (Unit: Poli Gigi & Mulut, Tujuan: Kontrol/Poli)','::1','2026-10-22 11:08:57'),(118,5,'kembali_berkas','Mencatat pengembalian berkas No. RM 00-12-34 a/n Ahmad Subarjo, kondisi: Lengkap','::1','2026-10-22 11:09:38'),(119,5,'otp_dikirim','OTP login dikirim ke admin@trackly.local','::1','2026-10-22 11:47:28'),(120,5,'login_sukses','Pengguna admin (admin) berhasil login melalui verifikasi OTP','::1','2026-10-22 11:47:29'),(121,5,'ubah_berkas','Memperbarui data berkas No. RM 00-23-78 a/n Gina Indira','::1','2026-10-22 11:49:44'),(122,5,'otp_dikirim','OTP login dikirim ke admin@trackly.local','::1','2026-10-22 12:06:54'),(123,5,'login_sukses','Pengguna admin (admin) berhasil login melalui verifikasi OTP','::1','2026-10-22 12:06:54'),(124,5,'otp_dikirim','OTP login dikirim ke admin@trackly.local','::1','2026-10-22 12:40:58'),(125,5,'login_gagal','Percobaan login gagal untuk user admin (gagal ke-1)','::1','2026-10-22 12:41:31'),(126,5,'otp_dikirim','OTP login dikirim ke admin@trackly.local','::1','2026-10-22 12:42:03'),(127,5,'login_sukses','Pengguna admin (admin) berhasil login melalui verifikasi OTP','::1','2026-10-22 12:42:04'),(128,5,'otp_dikirim','OTP login dikirim ke admin@trackly.local','::1','2026-10-22 12:42:59'),(129,5,'login_sukses','Pengguna admin (admin) berhasil login melalui verifikasi OTP','::1','2026-10-22 12:42:59'),(130,5,'login_gagal','Percobaan login gagal untuk user admin (gagal ke-1)','::1','2026-10-22 12:44:39'),(131,5,'otp_dikirim','OTP login dikirim ke admin@trackly.local','::1','2026-10-22 12:44:59'),(132,5,'login_sukses','Pengguna admin (admin) berhasil login melalui verifikasi OTP','::1','2026-10-22 12:45:07'),(133,5,'otp_dikirim','OTP login dikirim ke admin@trackly.local','::1','2026-10-22 13:26:35'),(134,5,'login_sukses','Pengguna admin (admin) berhasil login melalui verifikasi OTP','::1','2026-10-22 13:26:36'),(135,5,'regenerate_qr','Membuat ulang QR Code berkas No. RM 00-12-34 — kode lama tidak berlaku.','::1','2026-10-22 13:44:38'),(136,5,'login_gagal','Percobaan login gagal untuk user admin (gagal ke-1)','::1','2026-10-22 13:57:06'),(137,5,'otp_dikirim','OTP login dikirim ke admin@trackly.local','::1','2026-10-22 13:57:44'),(138,5,'otp_dikirim','OTP login dikirim ke admin@trackly.local','::1','2026-10-22 13:58:16'),(139,5,'otp_dikirim','OTP login dikirim ke admin@trackly.local','::1','2026-10-22 13:59:30'),(140,5,'login_sukses','Pengguna admin (admin) berhasil login melalui verifikasi OTP','::1','2026-10-22 13:59:31'),(141,5,'pinjam_berkas','Mencatat peminjaman berkas No. RM 00-23-45 oleh dr.Andi (Unit: Rawat Inap Mawar, Tujuan: Audit/Akreditasi)','::1','2026-10-22 15:01:19'),(142,5,'tambah_berkas','Registrasi berkas rekam medis baru: No. RM 00-12-55 a/n Nabila','::1','2026-10-22 15:08:31'),(143,5,'pinjam_berkas','Mencatat peminjaman berkas No. RM 00-12-55 oleh dr.Gina (Unit: Instalasi Gawat Darurat (IGD), Tujuan: Klaim/Asuransi)','::1','2026-10-22 15:10:55'),(144,5,'kembali_berkas','Mencatat pengembalian berkas No. RM 00-12-55 a/n Nabila, kondisi: Lengkap','::1','2026-10-22 15:12:17'),(145,5,'laporan_export_pdf','Membuka/Mencetak laporan PDF peminjaman (2026-09-22 s/d 2026-10-22)','::1','2026-10-22 15:12:30'),(146,5,'laporan_export_excel','Mengekspor laporan peminjaman ke format Excel/CSV (2026-09-22 s/d 2026-10-22)','::1','2026-10-22 15:12:55'),(147,5,'logout','Pengguna keluar dari aplikasi','::1','2026-10-22 15:13:16'),(148,7,'login_gagal','Percobaan login gagal untuk user petugas_unit (gagal ke-1)','::1','2026-10-22 15:13:32'),(149,7,'otp_dikirim','OTP login dikirim ke petugas.unit@trackly.local','::1','2026-10-22 15:13:42'),(150,7,'login_sukses','Pengguna petugas_unit (petugas_unit) berhasil login melalui verifikasi OTP','::1','2026-10-22 15:13:51'),(151,7,'logout','Pengguna keluar dari aplikasi','::1','2026-10-22 15:14:34'),(152,5,'otp_dikirim','OTP login dikirim ke admin@trackly.local','::1','2026-10-22 15:14:43'),(153,5,'login_sukses','Pengguna admin (admin) berhasil login melalui verifikasi OTP','::1','2026-10-22 15:14:51'),(154,5,'pinjam_berkas','Mencatat peminjaman berkas No. RM 00-12-55 oleh Ns.Rina (Unit: Poli Anak, Tujuan: Kontrol/Poli)','::1','2026-10-22 15:15:56'),(155,5,'logout','Pengguna keluar dari aplikasi','::1','2026-10-22 15:16:01'),(156,7,'otp_dikirim','OTP login dikirim ke petugas.unit@trackly.local','::1','2026-10-22 15:16:05'),(157,7,'login_sukses','Pengguna petugas_unit (petugas_unit) berhasil login melalui verifikasi OTP','::1','2026-10-22 15:16:13'),(158,7,'logout','Pengguna keluar dari aplikasi','::1','2026-10-22 15:16:29'),(159,6,'otp_dikirim','OTP login dikirim ke petugas.rm@trackly.local','::1','2026-10-22 15:16:46'),(160,6,'login_sukses','Pengguna petugas_rm (petugas_rm) berhasil login melalui verifikasi OTP','::1','2026-10-22 15:16:53'),(161,6,'logout','Pengguna keluar dari aplikasi','::1','2026-10-22 15:18:19'),(162,8,'otp_dikirim','OTP login dikirim ke kepala.rm@trackly.local','::1','2026-10-22 15:18:32'),(163,8,'login_sukses','Pengguna kepala (kepala) berhasil login melalui verifikasi OTP','::1','2026-10-22 15:18:39'),(164,8,'logout','Pengguna keluar dari aplikasi','::1','2026-10-22 15:19:01'),(165,6,'otp_dikirim','OTP login dikirim ke petugas.rm@trackly.local','::1','2026-10-22 15:19:08'),(166,5,'otp_dikirim','OTP login dikirim ke admin@trackly.local','::1','2026-10-22 15:19:31'),(167,5,'login_sukses','Pengguna admin (admin) berhasil login melalui verifikasi OTP','::1','2026-10-22 15:19:39'),(168,5,'tambah_pengguna','Membuat akun pengguna baru: Nabila Islami (nabila_rm) dengan peran petugas_rm','::1','2026-10-22 15:21:56'),(169,5,'logout','Pengguna keluar dari aplikasi','::1','2026-10-22 15:21:59'),(170,12,'otp_dikirim','OTP login dikirim ke nabila090905@gmail.com','::1','2026-10-22 15:22:07'),(171,12,'login_sukses','Pengguna nabila_rm (petugas_rm) berhasil login melalui verifikasi OTP','::1','2026-10-22 15:22:32'),(172,12,'otp_dikirim','OTP login dikirim ke nabila090905@gmail.com','::1','2026-10-22 15:24:55'),(173,12,'login_gagal','Percobaan login gagal untuk user nabila_rm (gagal ke-1)','::1','2026-10-22 15:25:11'),(174,12,'login_gagal','Percobaan login gagal untuk user nabila_rm (gagal ke-2)','::1','2026-10-22 15:25:38'),(175,12,'otp_dikirim','OTP login dibuat untuk nabila090905@gmail.com (email sent: no/local_mode)','::1','2026-10-22 15:43:10'),(176,12,'login_sukses','Pengguna nabila_rm (petugas_rm) berhasil login melalui verifikasi OTP','::1','2026-10-22 15:43:11'),(177,12,'otp_dikirim','OTP login dibuat untuk nabila090905@gmail.com (email sent: no/local_mode)','::1','2026-10-22 15:43:40'),(178,12,'login_sukses','Pengguna nabila_rm (petugas_rm) berhasil login melalui verifikasi OTP','::1','2026-10-22 15:43:41'),(179,12,'logout','Pengguna keluar dari aplikasi','::1','2026-10-22 15:45:40'),(180,12,'otp_dikirim','OTP login dibuat untuk nabila090905@gmail.com (email sent: no/local_mode)','::1','2026-10-22 15:45:51'),(181,12,'login_sukses','Pengguna nabila_rm (petugas_rm) berhasil login melalui verifikasi OTP','::1','2026-10-22 15:46:06'),(182,12,'logout','Pengguna keluar dari aplikasi','::1','2026-10-22 15:46:21'),(183,6,'login_gagal','Percobaan login gagal untuk user petugas_rm (gagal ke-1)','::1','2026-10-22 18:08:49'),(184,6,'otp_dikirim','OTP login dibuat untuk petugas.rm@trackly.local (email sent: no/local_mode)','::1','2026-10-22 18:09:04'),(185,6,'login_sukses','Pengguna petugas_rm (petugas_rm) berhasil login melalui verifikasi OTP','::1','2026-10-22 18:09:29'),(186,6,'tambah_berkas','Registrasi berkas rekam medis baru: No. RM 00-22-98 a/n Gina Indira Sanova','::1','2026-10-22 18:12:21'),(187,5,'otp_dikirim','OTP login dibuat untuk admin@trackly.local (email sent: no/local_mode)','::1','2026-10-23 11:15:04'),(188,5,'otp_dikirim','OTP login dibuat untuk admin@trackly.local (email sent: no/local_mode)','::1','2026-10-23 11:15:04'),(189,5,'login_sukses','Pengguna admin (admin) berhasil login melalui verifikasi OTP','::1','2026-10-23 11:15:12'),(190,5,'logout','Pengguna keluar dari aplikasi','::1','2026-10-23 11:42:33'),(191,6,'otp_dikirim','OTP login dibuat untuk petugas.rm@trackly.local (email sent: no/local_mode)','::1','2026-10-23 11:42:59'),(192,6,'login_sukses','Pengguna petugas_rm (petugas_rm) berhasil login melalui verifikasi OTP','::1','2026-10-23 11:43:05'),(193,6,'pinjam_berkas','Mencatat peminjaman berkas No. RM 00-22-98 oleh Ns.Rina (Unit: Poli Anak, Tujuan: Kontrol/Poli)','::1','2026-10-23 12:56:23'),(194,6,'kembali_berkas','Mencatat pengembalian berkas No. RM 00-22-98 a/n Gina Indira Sanova, kondisi: Lengkap','::1','2026-10-23 12:59:21'),(195,6,'logout','Pengguna keluar dari aplikasi','::1','2026-10-23 13:00:47'),(196,7,'otp_dikirim','OTP login dibuat untuk petugas.unit@trackly.local (email sent: no/local_mode)','::1','2026-10-23 13:01:32'),(197,7,'login_sukses','Pengguna petugas_unit (petugas_unit) berhasil login melalui verifikasi OTP','::1','2026-10-23 13:01:37'),(198,7,'logout','Pengguna keluar dari aplikasi','::1','2026-10-23 13:02:58'),(199,6,'otp_dikirim','OTP login dibuat untuk petugas.rm@trackly.local (email sent: no/local_mode)','::1','2026-10-23 13:03:24'),(200,6,'login_sukses','Pengguna petugas_rm (petugas_rm) berhasil login melalui verifikasi OTP','::1','2026-10-23 13:03:29'),(201,6,'logout','Pengguna keluar dari aplikasi','::1','2026-10-23 13:03:53'),(202,5,'otp_dikirim','OTP login dibuat untuk admin@trackly.local (email sent: no/local_mode)','::1','2026-10-23 13:04:01'),(203,5,'login_sukses','Pengguna admin (admin) berhasil login melalui verifikasi OTP','::1','2026-10-23 13:04:14'),(204,7,'otp_dikirim','OTP login dibuat untuk petugas.unit@trackly.local (email sent: no/local_mode)','172.20.10.7','2026-10-23 13:17:50'),(205,7,'login_sukses','Pengguna petugas_unit (petugas_unit) berhasil login melalui verifikasi OTP','172.20.10.7','2026-10-23 13:18:25'),(206,7,'logout','Pengguna keluar dari aplikasi','172.20.10.7','2026-10-23 13:19:13'),(207,5,'otp_dikirim','OTP login dibuat untuk admin@trackly.local (email sent: no/local_mode)','172.20.10.7','2026-10-23 13:19:42'),(208,5,'login_sukses','Pengguna admin (admin) berhasil login melalui verifikasi OTP','172.20.10.7','2026-10-23 13:19:58'),(209,5,'tambah_pengguna','Membuat akun pengguna baru: Gina Indira. STr.RMIK (gina_rm) dengan peran petugas_rm','172.20.10.7','2026-10-23 13:23:52'),(210,5,'tambah_unit','Menambahkan master unit baru: Poli kebidanan dan kandungan (P-OBGYN)','172.20.10.7','2026-10-23 13:27:04'),(211,5,'logout','Pengguna keluar dari aplikasi','172.20.10.7','2026-10-23 13:28:39'),(212,8,'otp_dikirim','OTP login dibuat untuk kepala.rm@trackly.local (email sent: no/local_mode)','172.20.10.7','2026-10-23 13:29:14'),(213,8,'login_sukses','Pengguna kepala (kepala) berhasil login melalui verifikasi OTP','172.20.10.7','2026-10-23 13:29:28'),(214,8,'laporan_export_pdf','Membuka/Mencetak laporan PDF peminjaman (2026-09-23 s/d 2026-10-23)','172.20.10.7','2026-10-23 13:31:23'),(215,8,'logout','Pengguna keluar dari aplikasi','172.20.10.7','2026-10-23 13:32:42'),(216,13,'otp_dikirim','OTP login dibuat untuk ginaindirasanova06@gmail.com (email sent: no/local_mode)','172.20.10.7','2026-10-23 13:33:01'),(217,13,'login_sukses','Pengguna gina_rm (petugas_rm) berhasil login melalui verifikasi OTP','172.20.10.7','2026-10-23 13:33:06'),(218,13,'laporan_export_pdf','Membuka/Mencetak laporan PDF peminjaman (2026-09-23 s/d 2026-10-23)','172.20.10.7','2026-10-23 13:33:12'),(219,5,'otp_dikirim','OTP login dibuat untuk admin@trackly.local (email sent: no/local_mode)','::1','2026-11-02 14:30:01'),(220,5,'login_sukses','Pengguna admin (admin) berhasil login melalui verifikasi OTP','::1','2026-11-02 14:30:09');
/*!40000 ALTER TABLE `log_aktivitas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2026-10-21-000001','App\\Database\\Migrations\\CreateTracklyTables','default','App',1792582688,1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `otp_codes`
--

DROP TABLE IF EXISTS `otp_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `otp_codes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `tujuan` enum('login','reset_sandi') NOT NULL,
  `kode_hash` varchar(255) NOT NULL,
  `kadaluarsa_pada` datetime NOT NULL,
  `percobaan` tinyint(4) NOT NULL DEFAULT 0,
  `jumlah_kirim` tinyint(4) NOT NULL DEFAULT 1,
  `digunakan_pada` datetime DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `token_reset` varchar(100) DEFAULT NULL,
  `token_kadaluarsa_pada` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_tujuan_kadaluarsa_pada` (`user_id`,`tujuan`,`kadaluarsa_pada`),
  CONSTRAINT `otp_codes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `otp_codes`
--

LOCK TABLES `otp_codes` WRITE;
/*!40000 ALTER TABLE `otp_codes` DISABLE KEYS */;
INSERT INTO `otp_codes` VALUES (8,5,'login','$2y$10$xRrur4o6YjuXbv3HNpGj.uNGtcxg/M4yAJCVbDfGfjXNkWXxp2iwG','2026-10-21 19:04:29',0,1,'2026-10-21 18:59:38','::1',NULL,NULL,'2026-10-21 18:59:29'),(9,5,'login','$2y$10$JRn/gUh3eGjoAOQnNV0UrOMIIRx/WZoSg7sqo7un9S.0aPFi2eWsq','2026-10-21 19:15:18',0,1,'2026-10-21 19:10:19','::1',NULL,NULL,'2026-10-21 19:10:18'),(10,7,'login','$2y$10$DVWC7GdQ.989Sgeqaivz9uN95HGTI/iDR/kVpTbUOkVadOwEduUNi','2026-10-21 19:15:26',0,1,'2026-10-21 19:10:27','::1',NULL,NULL,'2026-10-21 19:10:26'),(11,5,'login','$2y$10$BymJy2hkt4.D4xmajdP0N.WP11DbMinx6HdTf6rpMRIzcBbgqTYJq','2026-10-21 19:17:16',0,1,'2026-10-21 19:12:17','::1',NULL,NULL,'2026-10-21 19:12:16'),(12,7,'login','$2y$10$S6ejRE01TmxBrD7xTJUUyeR5.hLdIKPaTc4ZkqYBzBGJSUz8H.LGy','2026-10-21 19:17:25',0,1,'2026-10-21 19:12:25','::1',NULL,NULL,'2026-10-21 19:12:25'),(13,7,'login','$2y$10$6VVy/7omsORkWU2roTFku.jKpy5hAYNrz11pBtx3rD3KCdvq/Oti.','2026-10-21 19:18:02',0,1,'2026-10-21 19:13:03','::1',NULL,NULL,'2026-10-21 19:13:02'),(14,5,'login','$2y$10$qYawWcc.4uohX7M.F7a/UutH7z7..XF2b74Fzgv/Bfu.bra.iqmjK','2026-10-21 19:19:32',0,1,'2026-10-21 19:14:33','::1',NULL,NULL,'2026-10-21 19:14:32'),(15,7,'login','$2y$10$29uAG4HOFdQSg7aY9vl5T.sb.BIxfrZl9VfvgaRaXKSMztlfM749W','2026-10-21 19:19:40',0,1,'2026-10-21 19:14:40','::1',NULL,NULL,'2026-10-21 19:14:40'),(16,5,'login','$2y$10$NomznN8rZkhxXXE3owXsN.8rF2cBmCz1F.q3GBsy6XIMTmaeXYhvG','2026-10-21 19:54:26',0,1,'2026-10-21 19:49:27','::1',NULL,NULL,'2026-10-21 19:49:26'),(17,5,'login','$2y$10$AL7LjCh4hEKeiO09XaxMPOmbpTJTggPGVg39j449pKvW6As89xYNK','2026-10-21 19:56:00',0,1,'2026-10-21 19:51:00','::1',NULL,NULL,'2026-10-21 19:51:00'),(18,5,'login','$2y$10$sBvFnr4S7r/KzcZdGFPWauw7.5WixiUccB84Uyqb.HtcqNRXwcODi','2026-10-21 19:58:52',0,1,'2026-10-21 19:53:53','::1',NULL,NULL,'2026-10-21 19:53:52'),(19,5,'login','$2y$10$TvKoiS8.dYpD2nIZvfhWsucN6uMo1O8zQFcpdhU8ZZwc.BNH2qbMG','2026-10-21 19:59:29',0,1,'2026-10-21 19:54:30','::1',NULL,NULL,'2026-10-21 19:54:29'),(20,5,'login','$2y$10$kvZvN24BMGfeV76ARzRNvOqRf.V0L5WV.xpSRe6AyqSW6ASTpK3zq','2026-10-21 20:14:58',0,1,'2026-10-21 20:09:59','::1',NULL,NULL,'2026-10-21 20:09:58'),(21,5,'login','$2y$10$t3FkDMzgOniTUXreiszC8OagqDECa4CAxs/HbpGq.fKkrBvtDyG.W','2026-10-21 20:20:44',0,1,'2026-10-21 20:15:45','::1',NULL,NULL,'2026-10-21 20:15:44'),(22,5,'login','$2y$10$6.eq.7w4RcPndBdTIQ5Xmeu4RWZoAhB/6jgrGhL1wqpiABez0KGp2','2026-10-21 20:21:20',0,1,'2026-10-21 20:16:20','::1',NULL,NULL,'2026-10-21 20:16:20'),(23,8,'login','$2y$10$L1MkCG/XWKAugPUBkOYBxu3nUTSA5yAgQ7sA9doKxIkj/tXgeSOaS','2026-10-21 20:49:12',0,1,'2026-10-21 20:44:21','::1',NULL,NULL,'2026-10-21 20:44:12'),(24,5,'login','$2y$10$UeTPHc2J/5jylq5OoHhS0OAi49k0zMJrtDyR7hEYBUTAozD1dKdPO','2026-10-21 21:30:33',0,1,'2026-10-21 21:25:34','::1',NULL,NULL,'2026-10-21 21:25:33'),(25,5,'login','$2y$10$38GRzKj6G.MbXxWSxlZ7HOa.kUptm6GNCM2FyiZPoxO11BDdFxLQK','2026-10-22 10:50:13',0,1,'2026-10-22 10:45:14','::1',NULL,NULL,'2026-10-22 10:45:13'),(26,5,'login','$2y$10$luaqTc4zCq8UevfjmcUUYeb7LeJol8Aw8KvDK/HUBCa652VvgklF6','2026-10-22 10:53:20',0,1,'2026-10-22 10:48:21','::1',NULL,NULL,'2026-10-22 10:48:20'),(27,5,'login','$2y$10$QY13MCaRZFAaTXAfD6fe0e7l52HLrIhP3zEZGyUhMpucECBv6xWwq','2026-10-22 10:54:58',0,1,'2026-10-22 10:50:08','::1',NULL,NULL,'2026-10-22 10:49:58'),(28,5,'login','$2y$10$nT9n3iGGcdquhIR3/GQbXeV58d7wrExjkNVYJq2GkSXQqu4oJYkhK','2026-10-22 11:52:28',0,1,'2026-10-22 11:47:29','::1',NULL,NULL,'2026-10-22 11:47:28'),(29,5,'login','$2y$10$QtE1tKEAhN2k3Qm/aoMjTO9wf0vKzwDV2OxTYCmp2Q6alEoUPP.GC','2026-10-22 12:11:54',0,1,'2026-10-22 12:06:54','::1',NULL,NULL,'2026-10-22 12:06:54'),(30,5,'login','$2y$10$aYS5BgVkd1Mwye3J7oO8uOy0ykzxwpCFrOQGe2iEK1fjKpodjp/Tu','2026-10-22 12:42:03',0,1,NULL,'::1',NULL,NULL,'2026-10-22 12:40:58'),(31,5,'login','$2y$10$rkkiCa7x7WKBOHwV9Tp6dODZbwyukrwqnrXzaFrqIjygpOD/mul5S','2026-10-22 12:47:03',0,2,'2026-10-22 12:42:04','::1',NULL,NULL,'2026-10-22 12:42:03'),(32,5,'login','$2y$10$HIBb/GMjkH3GBAO7Yb2YLO.nBN06FhDYNi9QZ5Y07etR/u6VgAuFK','2026-10-22 12:47:59',0,1,'2026-10-22 12:42:59','::1',NULL,NULL,'2026-10-22 12:42:59'),(33,5,'login','$2y$10$ktcIRI0F2JbBQYqeEERXkO0lyKshhfiZX0AhLTtYEa35vggmn7k6W','2026-10-22 12:49:59',0,1,'2026-10-22 12:45:07','::1',NULL,NULL,'2026-10-22 12:44:59'),(34,5,'login','$2y$10$5vZKkECa4GHE7aWOFoOKp.yXvPKqd8joN1fN7Xi1rlMmyy3ysttu2','2026-10-22 13:31:35',0,1,'2026-10-22 13:26:36','::1',NULL,NULL,'2026-10-22 13:26:35'),(35,5,'login','$2y$10$9lz65AxyC0tWRFZqSlvaE.iLwvJoLNuXx.0DYQKqMpQ6xmyYeRZNG','2026-10-22 13:58:16',0,1,NULL,'::1',NULL,NULL,'2026-10-22 13:57:44'),(36,5,'login','$2y$10$QjMp67bM02yYuipgKniZ6ujBEvrDzPAH2XH8dsgR2E36oRKoybMZq','2026-10-22 13:59:30',0,2,NULL,'::1',NULL,NULL,'2026-10-22 13:58:16'),(37,5,'login','$2y$10$bwe.mxUUFvqdwzLwfDoGK.YA4AKi4cSDm3ooSsx6W2iV3STUEP/JW','2026-10-22 14:04:30',0,3,'2026-10-22 13:59:31','::1',NULL,NULL,'2026-10-22 13:59:30'),(38,7,'login','$2y$10$asn7U1T6ufYcnnXbf0RdyeeBXpHEsYQFoyylhsb/WmAUyy0oNIsee','2026-10-22 15:18:42',0,1,'2026-10-22 15:13:51','::1',NULL,NULL,'2026-10-22 15:13:42'),(39,5,'login','$2y$10$FZ5z5522X5sedyXSZyLKg.SIo9KdIYtPXg6WOGTPlu1SKGFiNF/CC','2026-10-22 15:19:43',0,1,'2026-10-22 15:14:51','::1',NULL,NULL,'2026-10-22 15:14:43'),(40,7,'login','$2y$10$/1KbNeppeaEna41V4V30tO/qE.1Z7bI1EWn6j0DkMCtrlleahbyH6','2026-10-22 15:21:05',0,1,'2026-10-22 15:16:13','::1',NULL,NULL,'2026-10-22 15:16:05'),(41,6,'login','$2y$10$aOKruuKHpsZBRKmI7.RrDO0GRjdjvJTEYtmiMcHsncE/cEsgyIByq','2026-10-22 15:21:46',0,1,'2026-10-22 15:16:53','::1',NULL,NULL,'2026-10-22 15:16:46'),(42,8,'login','$2y$10$mDngB7Xh2al/TRO1AiPKsOEzMSaVdpLSTKBgJUIqCtTkQgwr0KCA6','2026-10-22 15:23:32',0,1,'2026-10-22 15:18:39','::1',NULL,NULL,'2026-10-22 15:18:32'),(43,6,'login','$2y$10$zBPaPPvqTO1FC1aGxOszOuBI/OtLW7f9oUPc/5UxHAxad/41fTdQ2','2026-10-22 15:24:08',0,1,NULL,'::1',NULL,NULL,'2026-10-22 15:19:08'),(44,5,'login','$2y$10$SIXXXnbK9I.NitXlEPWs2uWSapN6OgWqVEA0tsUp/7Rje8VoO2oxa','2026-10-22 15:24:31',0,1,'2026-10-22 15:19:39','::1',NULL,NULL,'2026-10-22 15:19:31'),(45,12,'login','$2y$10$27qqbOq3r3HAWY6pX.JKW.3H2NEtNtR99vcoI8EEoIWmp6ISd9eLC','2026-10-22 15:27:07',0,1,'2026-10-22 15:22:32','::1',NULL,NULL,'2026-10-22 15:22:07'),(46,12,'login','$2y$10$6Dc8rtTRiOfjI2l4bo9WBueQ2fil40ZmwVZGd6Ocq0OBMVLIobAOa','2026-10-22 15:29:55',0,1,NULL,'::1',NULL,NULL,'2026-10-22 15:24:55'),(47,12,'login','$2y$10$p8eRnUByC7JTdKGiR1xya.PmKb6kbQ8RfAjJhNTlny79h2mH2insi','2026-10-22 15:48:10',0,1,'2026-10-22 15:43:11','::1',NULL,NULL,'2026-10-22 15:43:10'),(48,12,'login','$2y$10$MpejG.gWTnY7VEFSGbSN4uNpblkfvvdRqH4KyF5youaZg0Bor/C4G','2026-10-22 15:48:40',0,1,'2026-10-22 15:43:40','::1',NULL,NULL,'2026-10-22 15:43:40'),(49,12,'login','$2y$10$BotnoCDSsLqEyzTtMzcc9.9j2Dfwc/1SwNR1j2g/MMeSg0fI7AZDq','2026-10-22 15:50:51',0,1,'2026-10-22 15:46:06','::1',NULL,NULL,'2026-10-22 15:45:51'),(50,6,'login','$2y$10$gvf2UXbuYzJYH1gFX62x7.r5b6.RTcYWfx.n/25d.VQ8qwjBVaYPy','2026-10-22 18:14:04',0,1,'2026-10-22 18:09:29','::1',NULL,NULL,'2026-10-22 18:09:04'),(51,5,'login','$2y$10$YBZnwGAUjktOaRPWaU1Q9e6c45yvckM8cdryFinGoSp44iR2C5rta','2026-10-23 11:15:04',0,1,NULL,'::1',NULL,NULL,'2026-10-23 11:15:04'),(52,5,'login','$2y$10$6nhjNq83GMOxUvDpzmIbFuJ6/X8CnzMCGJGrsnMHaoJN8Slf04LQO','2026-10-23 11:20:04',0,2,'2026-10-23 11:15:12','::1',NULL,NULL,'2026-10-23 11:15:04'),(53,6,'login','$2y$10$3pLLQkqmS2CZDMwEqyB0LefYi.0hUqxHBQearB/9GzxGGQu0aUpz6','2026-10-23 11:47:59',0,1,'2026-10-23 11:43:05','::1',NULL,NULL,'2026-10-23 11:42:59'),(54,7,'login','$2y$10$nSzBsT8s2yUKGlQg8XS.0.wZyM90u7qoHmm9qgmXvJ7a6YD4h0roO','2026-10-23 13:06:32',0,1,'2026-10-23 13:01:37','::1',NULL,NULL,'2026-10-23 13:01:32'),(55,6,'login','$2y$10$98szo2At.CqdcB8HQLP8m.MSTWvBBHJAVbJiFZCUGijlFvh1yF6fi','2026-10-23 13:08:24',0,1,'2026-10-23 13:03:29','::1',NULL,NULL,'2026-10-23 13:03:24'),(56,5,'login','$2y$10$zl3gU1dKeUHQuPiomLBuKeYXqXdinvqsp2RZsR7VrRV28zRfjNWOe','2026-10-23 13:09:01',0,1,'2026-10-23 13:04:14','::1',NULL,NULL,'2026-10-23 13:04:01'),(57,7,'login','$2y$10$jcnfPy/qr16PCaMhSMF8V.pAeyBwy1uzFPxZ/nca.q6lRxIpwdVEe','2026-10-23 13:22:50',0,1,'2026-10-23 13:18:25','172.20.10.7',NULL,NULL,'2026-10-23 13:17:50'),(58,5,'login','$2y$10$o2Ni1Iga7oWVZBuN7ysVvu6eJKnwaKrbn6UmTf226gWWw19EIUWby','2026-10-23 13:24:42',0,1,'2026-10-23 13:19:58','172.20.10.7',NULL,NULL,'2026-10-23 13:19:42'),(59,8,'login','$2y$10$bEeXEga96.oAOloXhpNaBucmSkjGiKOSe/3r0U0WJZZeajRda//Lu','2026-10-23 13:34:14',0,1,'2026-10-23 13:29:28','172.20.10.7',NULL,NULL,'2026-10-23 13:29:14'),(60,13,'login','$2y$10$vzqrxESoUrn0RifzesMnZONFhIecP5FmuvmSU6ybR/PTohXHRxhwS','2026-10-23 13:38:01',0,1,'2026-10-23 13:33:06','172.20.10.7',NULL,NULL,'2026-10-23 13:33:01'),(61,5,'login','$2y$10$q4DxV4T3XmQoSB7bSzubnOsj0mVQ6xzxAfUihcsG5EcFwUo00gx7e','2026-11-02 14:35:01',0,1,'2026-11-02 14:30:09','::1',NULL,NULL,'2026-11-02 14:30:01');
/*!40000 ALTER TABLE `otp_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peminjaman`
--

DROP TABLE IF EXISTS `peminjaman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `peminjaman` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `berkas_id` int(11) unsigned NOT NULL,
  `unit_id` int(11) unsigned NOT NULL,
  `dicatat_oleh` int(11) unsigned NOT NULL,
  `nama_peminjam` varchar(100) NOT NULL,
  `tujuan` varchar(50) NOT NULL,
  `tgl_pinjam` datetime NOT NULL,
  `batas_kembali` date NOT NULL,
  `tgl_kembali` datetime DEFAULT NULL,
  `kondisi_kembali` enum('lengkap','tidak_lengkap') DEFAULT NULL,
  `catatan` varchar(255) DEFAULT NULL,
  `status` enum('dipinjam','dikembalikan','terlambat') NOT NULL DEFAULT 'dipinjam',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `peminjaman_unit_id_foreign` (`unit_id`),
  KEY `peminjaman_dicatat_oleh_foreign` (`dicatat_oleh`),
  KEY `berkas_id_status` (`berkas_id`,`status`),
  KEY `tgl_pinjam` (`tgl_pinjam`),
  KEY `batas_kembali` (`batas_kembali`),
  CONSTRAINT `peminjaman_berkas_id_foreign` FOREIGN KEY (`berkas_id`) REFERENCES `berkas_rm` (`id`),
  CONSTRAINT `peminjaman_dicatat_oleh_foreign` FOREIGN KEY (`dicatat_oleh`) REFERENCES `users` (`id`),
  CONSTRAINT `peminjaman_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peminjaman`
--

LOCK TABLES `peminjaman` WRITE;
/*!40000 ALTER TABLE `peminjaman` DISABLE KEYS */;
INSERT INTO `peminjaman` VALUES (1,6,10,5,'Dr. Budi Santoso','Pelayanan pasien','2026-10-21 19:53:54','2026-10-23','2026-10-21 19:54:31','lengkap','Berkas kembali dalam kondisi lengkap dan rapi','dikembalikan','2026-10-21 19:53:54','2026-10-21 19:54:31'),(2,13,10,5,'Dr. Ratna Indah','Pelayanan pasien','2026-10-21 20:15:47','2026-10-26','2026-10-21 20:15:48','lengkap','Pengembalian tepat waktu dalam kondisi fisik sangat baik','dikembalikan','2026-10-21 20:15:47','2026-10-21 20:15:48'),(4,10,14,5,'dr.Andi','Pelayanan pasien','2026-10-22 11:04:48','2026-11-01',NULL,NULL,NULL,'terlambat','2026-10-22 11:04:48','2026-11-02 14:30:09'),(5,6,13,5,'dr.Andi','Kontrol/Poli','2026-10-22 11:08:57','2026-10-24','2026-10-22 11:09:38','lengkap',NULL,'dikembalikan','2026-10-22 11:08:57','2026-10-22 11:09:38'),(6,9,16,5,'dr.Andi','Audit/Akreditasi','2026-10-22 15:01:19','2026-10-24',NULL,NULL,NULL,'terlambat','2026-10-22 15:01:19','2026-11-02 14:30:09'),(7,18,14,5,'dr.Gina','Klaim/Asuransi','2026-10-22 15:10:55','2026-10-24','2026-10-22 15:12:17','lengkap',NULL,'dikembalikan','2026-10-22 15:10:55','2026-10-22 15:12:17'),(8,18,11,5,'Ns.Rina','Kontrol/Poli','2026-10-22 15:15:56','2026-10-24',NULL,NULL,NULL,'terlambat','2026-10-22 15:15:56','2026-11-02 14:30:09'),(9,19,11,6,'Ns.Rina','Kontrol/Poli','2026-10-23 12:56:23','2026-10-26','2026-10-23 12:59:21','lengkap',NULL,'dikembalikan','2026-10-23 12:56:23','2026-10-23 12:59:21');
/*!40000 ALTER TABLE `peminjaman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `setting_key` varchar(50) NOT NULL,
  `setting_value` text NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `setting_key` (`setting_key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (6,'durasi_standar_hari','3','Durasi standar peminjaman berkas rekam medis dalam hari','2026-10-21 19:14:37'),(7,'nama_instansi','RSUD Trackly Medika Sejahtera','Nama fasilitas pelayanan kesehatan','2026-10-21 19:14:37'),(8,'maks_percobaan_otp','3','Batas maksimal kesalahan input kode OTP sebelum hangus','2026-10-21 19:14:37'),(9,'masa_berlaku_otp_menit','5','Masa berlaku kode OTP dalam menit','2026-10-21 19:14:37'),(10,'waktu_penguncian_menit','15','Durasi penguncian akun setelah 5 kali salah password dalam menit','2026-10-21 19:14:37');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `units` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kode_unit` varchar(10) NOT NULL,
  `nama_unit` varchar(100) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kode_unit` (`kode_unit`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `units`
--

LOCK TABLES `units` WRITE;
/*!40000 ALTER TABLE `units` DISABLE KEYS */;
INSERT INTO `units` VALUES (10,'P-PD','Poli Penyakit Dalam',1,'2026-10-21 18:56:48','2026-10-21 18:56:48'),(11,'P-ANK','Poli Anak',1,'2026-10-21 18:56:48','2026-10-21 18:56:48'),(12,'P-BDH','Poli Bedah',1,'2026-10-21 18:56:48','2026-10-21 18:56:48'),(13,'P-GGI','Poli Gigi & Mulut',1,'2026-10-21 18:56:48','2026-10-21 18:56:48'),(14,'IGD','Instalasi Gawat Darurat (IGD)',1,'2026-10-21 18:56:48','2026-10-21 18:56:48'),(15,'RI-MLT','Rawat Inap Melati',1,'2026-10-21 18:56:48','2026-10-21 18:56:48'),(16,'RI-MWR','Rawat Inap Mawar',1,'2026-10-21 18:56:48','2026-10-21 18:56:48'),(17,'VK','Ruang Bersalin / VK',1,'2026-10-21 18:56:48','2026-10-21 18:56:48'),(18,'ICU','Intensive Care Unit (ICU)',1,'2026-10-21 18:56:48','2026-10-21 18:56:48'),(19,'P-MTA','Poli Mata',1,'2026-10-21 19:10:20','2026-10-21 19:10:20'),(20,'U253','Unit Test U253',1,'2026-10-21 19:14:33','2026-10-21 19:14:33'),(21,'P-OBGYN','Poli kebidanan dan kandungan',1,'2026-10-23 13:27:04','2026-10-23 13:27:04');
/*!40000 ALTER TABLE `units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','petugas_rm','petugas_unit','kepala') NOT NULL DEFAULT 'petugas_rm',
  `unit_id` int(11) unsigned DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `failed_login_count` int(11) NOT NULL DEFAULT 0,
  `locked_until` datetime DEFAULT NULL,
  `must_change_password` tinyint(1) NOT NULL DEFAULT 0,
  `password_changed_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `users_unit_id_foreign` (`unit_id`),
  CONSTRAINT `users_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (5,'Administrator Trackly','admin','admin@trackly.local','$2y$10$CW2k1vjhB/LWhEs7jjn8XuRDmsMFPKqcuBz4n/gdK/ciX3KD5HLry','admin',NULL,1,0,NULL,0,'2026-10-21 19:12:21','2026-10-21 18:56:48','2026-11-02 14:30:01'),(6,'Ibu Sari (Petugas Filing)','petugas_rm','petugas.rm@trackly.local','$2y$10$sXUrEHf4m3GHR35v7fVeKuPF8q1iJSpi5r6LbFtqkt4zt/quVwlj.','petugas_rm',NULL,1,0,NULL,0,'2026-10-21 18:56:48','2026-10-21 18:56:48','2026-10-23 13:03:24'),(7,'Ns. Rina (Perawat Poli Anak)','petugas_unit','petugas.unit@trackly.local','$2y$10$sXUrEHf4m3GHR35v7fVeKuPF8q1iJSpi5r6LbFtqkt4zt/quVwlj.','petugas_unit',11,1,0,NULL,0,'2026-10-21 18:56:48','2026-10-21 18:56:48','2026-10-23 13:17:50'),(8,'Pak Hendra (Kepala Rekam Medis)','kepala','kepala.rm@trackly.local','$2y$10$sXUrEHf4m3GHR35v7fVeKuPF8q1iJSpi5r6LbFtqkt4zt/quVwlj.','kepala',NULL,1,0,NULL,0,'2026-10-21 18:56:48','2026-10-21 18:56:48','2026-10-23 13:29:14'),(9,'Staf Uji Coba','staf_uji','staf.uji@trackly.local','$2y$10$MUDikBFTrh9hOcBRQfJE4Ohtvp89xScp/MX9A65DRM4tOm1BjMX3e','petugas_rm',NULL,1,0,NULL,1,'2026-10-21 19:10:23','2026-10-21 19:10:23','2026-10-21 19:10:23'),(10,'Staf Uji Coba 1792584740','staf_1792584740','staf.1792584740@trackly.local','$2y$10$ktlSMjC4Uk7SWBb19CYVRu5poWgRbJo4JIuNJifRoPMxXZSRd/h9.','petugas_rm',NULL,1,0,NULL,1,'2026-10-21 19:12:20','2026-10-21 19:12:20','2026-10-21 19:12:20'),(11,'Staf Uji Coba 1792584875','staf_1792584875','staf.1792584875@trackly.local','$2y$10$2BBu5vRYFVMv.HhJ6BPbMOVT.XJBfqxInLix.ZYGkr5rI6XieVHUu','petugas_rm',NULL,1,0,NULL,1,'2026-10-21 19:14:37','2026-10-21 19:14:36','2026-10-21 19:14:37'),(12,'Nabila Islami','nabila_rm','nabila090905@gmail.com','$2y$10$vcdZ9qJQUJCyYoAfZcqLH.cDp8t/TaKhFLDnWKIiKKFN4YPA7yPgG','petugas_rm',NULL,1,0,NULL,0,'2026-10-22 15:21:56','2026-10-22 15:21:56','2026-10-22 15:45:51'),(13,'Gina Indira. STr.RMIK','gina_rm','ginaindirasanova06@gmail.com','$2y$10$rWvY3FnOeiICN/oGuG.lPOKLnDVeFpLG.N8ENNmmh4uKPfHyTLu2O','petugas_rm',NULL,1,0,NULL,0,'2026-10-23 13:23:52','2026-10-23 13:23:52','2026-10-23 13:33:01');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-02 19:31:19
