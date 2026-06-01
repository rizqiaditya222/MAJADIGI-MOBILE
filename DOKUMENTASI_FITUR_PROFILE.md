# Dokumentasi Fitur Data Diri dan Ubah Kata Sandi

## Daftar Fitur yang Dibuat

### 1. **Data Diri Page** (`data_diri_page.dart`)
Halaman yang menampilkan informasi personal user dengan latar belakang wayang image.

**Route:** `/data_diri`
**Nama Route:** `dataDiri`

**Fitur:**
- Menampilkan AuthHeader dengan background wayang_image.png
- Menampilkan 5 item data diri:
  - Nama Lengkap
  - Email
  - NIK
  - Alamat
  - No. HP
- Setiap item dapat ditekan untuk menuju halaman ubah data
- Tombol "Ubah Kata Sandi" di bagian bawah

**Navigasi:**
```dart
context.pushNamed(Routes.dataDiri);
```

---

### 2. **Ubah Data Page** (`ubah_data_page.dart`)
Halaman untuk mengubah setiap field data diri.

**Routes:**
- `/ubah_nama_lengkap` (ubahNamaLengkap)
- `/ubah_email` (ubahEmail)
- `/ubah_nik` (ubahNik)
- `/ubah_alamat` (ubahAlamat)
- `/ubah_no_hp` (ubahNoHp)

**Fitur:**
- Validasi input berdasarkan tipe field
- AppBar dengan judul dinamis
- Input field dengan hint text yang sesuai
- Tombol "Simpan Perubahan" dengan loading indicator
- Tombol "Batal" untuk kembali
- Snackbar untuk feedback pengguna

**Navigasi dari Data Diri:**
```dart
context.pushNamed(
  Routes.ubahNamaLengkap,
  extra: namaLengkap,
);
```

---

### 3. **Ubah Kata Sandi Page** (`ubah_kata_sandi_page.dart`)
Halaman untuk mengubah password dengan validasi keamanan.

**Route:** `/ubah_kata_sandi`
**Nama Route:** `ubahKataSandi`

**Fitur:**
- 3 input field:
  - Kata Sandi Lama
  - Kata Sandi Baru (minimal 6 karakter)
  - Konfirmasi Kata Sandi
- Visibility toggle untuk setiap password field
- Validasi:
  - Tidak boleh kosong
  - Minimum 6 karakter untuk password baru
  - Konfirmasi harus cocok dengan password baru
  - Password baru tidak boleh sama dengan password lama
- Tombol "Ubah Kata Sandi" dengan loading indicator
- Tombol "Batal" untuk kembali
- Snackbar untuk feedback

**Navigasi dari Data Diri:**
```dart
context.pushNamed(Routes.ubahKataSandi);
```

---

## Routes Constants

Semua routes telah ditambahkan ke `Routes` class di `app_router.dart`:

```dart
static const dataDiri = '/data_diri';
static const ubahNamaLengkap = '/ubah_nama_lengkap';
static const ubahEmail = '/ubah_email';
static const ubahNik = '/ubah_nik';
static const ubahAlamat = '/ubah_alamat';
static const ubahNoHp = '/ubah_no_hp';
static const ubahKataSandi = '/ubah_kata_sandi';
```

---

## GoRoute Configuration

Semua GoRoute telah dikonfigurasi dengan:
- Fade transition animation
- Extra parameter untuk data awal (ubah data pages)
- Named routes untuk navigasi yang mudah
- Custom page builder untuk smooth transition

---

## Styling & Theme

Semua halaman menggunakan:
- `AppColors` untuk konsistensi warna
- `AppTextStyles` untuk konsistensi typography
- `AppTheme` untuk tema aplikasi
- Blue sebagai warna utama (AppColors.blue500 untuk AppBar)
- Green untuk success message
- Red untuk error message

---

## Cara Menggunakan

### Akses Data Diri Page dari mana saja:
```dart
context.pushNamed(Routes.dataDiri);
```

### Akses langsung ke halaman ubah data tertentu:
```dart
context.pushNamed(
  Routes.ubahEmail,
  extra: 'user@example.com',
);
```

### Akses halaman ubah kata sandi:
```dart
context.pushNamed(Routes.ubahKataSandi);
```

---

## File yang Dibuat/Dimodifikasi

### File Baru:
1. `lib/features/home/presentation/pages/profile/data_diri_page.dart`
2. `lib/features/home/presentation/pages/profile/ubah_data_page.dart`
3. `lib/features/home/presentation/pages/profile/ubah_kata_sandi_page.dart`

### File Dimodifikasi:
1. `lib/core/router/app_router.dart` - Ditambahkan imports, routes constants, dan GoRoute definitions

---

## Notes

- Data ditampilkan dengan dummy/sample data. Untuk implementasi nyata, integrasi dengan API/database
- Validasi dilakukan di frontend. Pastikan juga validasi di backend
- Loading simulation menggunakan `Future.delayed()`. Ganti dengan actual API calls
- SnackBar feedback dapat disesuaikan dengan UX guidelines Anda


