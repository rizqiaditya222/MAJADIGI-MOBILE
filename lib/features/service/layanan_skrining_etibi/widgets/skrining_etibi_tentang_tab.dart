import 'package:flutter/material.dart';
import 'package:majadigi/core/widgets/index.dart';

class SkriningEtibiTentangTab extends StatelessWidget {
  const SkriningEtibiTentangTab({super.key});

  @override
  Widget build(BuildContext context) {
    return TentangTab(
      accordionItems: [
        AccordionItemData(
          title: 'Operasional',
          content: OperasionalContent(
            linkUrl: 'https://www.dinkes.jatimprov.go.id/',
            alamat:
                'Jl. Gayungsari Dalam No.2-4, Surabaya, Jawa Timur 60235, Indonesia',
            jamOperasional: {
              'Senin': '08:00 - 16:00',
              'Selasa': '08:00 - 16:00',
              'Rabu': '08:00 - 16:00',
              'Kamis': '08:00 - 16:00',
              'Jumat': '08:00 - 16:00',
              'Sabtu': '09:00 - 12:00',
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
            manfaatTitle: 'Manfaat Program Skrining E-TIBI',
            manfaatDescription:
                'Program Skrining E-TIBI adalah inisiatif Dinas Kesehatan Provinsi Jawa Timur untuk deteksi dini penyakit Tuberkulosis (TBC) menggunakan teknologi digital.',
            manfaatItems: [
              'Deteksi dini penyakit Tuberkulosis melalui teknologi E-TIBI',
              'Akses mudah melalui aplikasi mobile yang user-friendly',
              'Layanan skrining gratis untuk semua masyarakat',
              'Hasil skrining tersimpan dalam database kesehatan nasional',
              'Tindak lanjut penanganan dari tenaga medis profesional',
              'Edukasi kesehatan tentang pencegahan TBC',
              'Monitoring kesehatan secara berkala dan terukur',
            ],
            prosedurTitle: 'Prosedur Skrining',
            prosedurItems: [
              'Buka aplikasi E-TIBI dan buat akun pengguna',
              'Lengkapi data pribadi dan riwayat kesehatan',
              'Ikuti serangkaian pertanyaan skrining dengan jujur dan akurat',
              'Tunggu hasil analisis dari sistem yang terintegrasi',
              'Berkonsultasi dengan tenaga medis sesuai hasil skrining',
              'Ikuti tindak lanjut penanganan yang direkomendasikan',
            ],
          ),
        ),
        AccordionItemData(
          title: 'Tentang Layanan',
          content: TentangLayananContent(
            title: 'Tentang Program E-TIBI',
            paragraphs: [
              'Program E-TIBI (Electronic Tuberculosis Information) adalah sistem informasi kesehatan elektronik yang dikembangkan oleh Dinas Kesehatan Provinsi Jawa Timur untuk meningkatkan deteksi dini dan pengendalian penyakit Tuberkulosis di tingkat masyarakat.',
              'Dengan memanfaatkan teknologi digital dan kecerdasan buatan, program ini memungkinkan masyarakat melakukan skrining mandiri kapan saja dan di mana saja. Data hasil skrining terintegrasi dengan sistem kesehatan nasional untuk memastikan tindak lanjut penanganan yang optimal.',
              'Tuberkulosis adalah penyakit menular yang serius namun dapat dicegah dan diobati. Deteksi dini menjadi kunci penting dalam pengobatan dan mencegah penyebaran penyakit ini ke masyarakat luas.',
              'Kami mengajak seluruh masyarakat Jawa Timur untuk ikut berpartisipasi dalam program E-TIBI demi terciptanya masyarakat yang lebih sehat dan bebas dari penyakit Tuberkulosis.',
            ],
          ),
        ),
      ],
    );
  }
}

