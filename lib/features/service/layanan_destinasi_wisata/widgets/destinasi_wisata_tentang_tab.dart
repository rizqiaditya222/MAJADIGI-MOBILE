import 'package:flutter/material.dart';
import 'package:majadigi/core/widgets/index.dart';

class DestinasiWisataTentangTab extends StatelessWidget {
  const DestinasiWisataTentangTab({super.key});

  @override
  Widget build(BuildContext context) {
    return TentangTab(
      accordionItems: [
        AccordionItemData(
          title: 'Operasional',
          content: OperasionalContent(
            linkUrl: 'https://sidita.jatimprov.go.id/',
            alamat:
                'Jl. Tunjungan No.1, Surabaya, Jawa Timur 60187, Indonesia',
            jamOperasional: {
              'Senin': '08:00 - 17:00',
              'Selasa': '08:00 - 17:00',
              'Rabu': '08:00 - 17:00',
              'Kamis': '08:00 - 17:00',
              'Jumat': '08:00 - 17:00',
              'Sabtu': '08:00 - 14:00',
              'Minggu': 'Tutup',
            },
            mediaSosial: [
              {'icon': Icons.camera_alt_outlined, 'label': 'Instagram'},
              {'icon': Icons.facebook_outlined, 'label': 'Facebook'},
              {'icon': Icons.language, 'label': 'Website'},
            ],
          ),
        ),
        AccordionItemData(
          title: 'Ketentuan Umum',
          content: KetentuanUmumContent(
            manfaatTitle: 'Manfaat SIDITA',
            manfaatDescription:
                'SIDITA (Sistem Informasi Destinasi Wisata) adalah platform promosi dan informasi destinasi wisata yang tersebar di seluruh wilayah Jawa Timur untuk meningkatkan kunjungan wisatawan.',
            manfaatItems: [
              'Informasi destinasi wisata terlengkap se-Jawa Timur',
              'Panduan lengkap rute, jam buka, dan harga tiket',
              'Ulasan dan rating dari pengunjung yang terpercaya',
              'Rekomendasi wisata berdasarkan preferensi Anda',
              'Paket wisata yang kompetitif dan menarik',
              'Kemudahan pemesanan tiket online',
              'Fitur offline untuk akses informasi tanpa internet',
            ],
            prosedurTitle: 'Cara Menggunakan SIDITA',
            prosedurItems: [
              'Download aplikasi SIDITA atau akses website',
              'Cari destinasi wisata yang ingin Anda kunjungi',
              'Lihat informasi lengkap tentang lokasi, jam buka, dan harga',
              'Baca ulasan dan rating dari pengunjung lain',
              'Gunakan fitur peta untuk navigasi ke lokasi',
              'Pesan tiket atau paket wisata jika tersedia',
              'Bagikan pengalaman Anda melalui ulasan dan foto',
            ],
          ),
        ),
        AccordionItemData(
          title: 'Tentang Layanan',
          content: TentangLayananContent(
            title: 'Tentang SIDITA',
            paragraphs: [
              'SIDITA adalah inisiatif Pemerintah Provinsi Jawa Timur untuk mempromosikan potensi wisata yang luar biasa di seluruh wilayah. Jawa Timur memiliki destinasi wisata yang beragam, mulai dari alam, budaya, hingga rekreasi modern.',
              'Platform SIDITA dirancang untuk memudahkan wisatawan dalam menemukan, merencanakan, dan menikmati pengalaman wisata yang tak terlupakan. Dengan informasi yang akurat dan lengkap, kami membantu Anda menemukan destinasi impian Anda.',
              'Dari keindahan Gunung Bromo, pesona Kawah Ijen, hingga pantai-pantai eksotis di Jember, SIDITA menyediakan semua informasi yang Anda butuhkan untuk petualangan sempurna di Jawa Timur.',
              'Bergabunglah dengan ribuan wisatawan yang telah menemukan pengalaman wisata terbaik mereka melalui SIDITA. Mari jelajahi keindahan Jawa Timur bersama kami!',
            ],
          ),
        ),
      ],
    );
  }
}

