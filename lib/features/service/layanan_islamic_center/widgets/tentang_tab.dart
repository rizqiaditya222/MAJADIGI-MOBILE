import 'package:flutter/material.dart';
import 'package:majadigi/core/widgets/tentang_tab.dart';
import 'package:majadigi/core/widgets/content/index.dart';

class IslamicCenterTentangTab extends StatelessWidget {
  const IslamicCenterTentangTab({super.key});

  @override
  Widget build(BuildContext context) {
    return TentangTab(
      accordionItems: [
        AccordionItemData(
          title: 'Operasional',
          content: OperasionalContent(
            linkUrl: 'https://rsuddahahusada.jatimprov.go.id/',
            alamat: 'Jl. Veteran No.48, Mojoroto, Kec. Mojoroto, Kota Kediri 64112',
            jamOperasional: {
              'Senin': '07:00 - 21:00',
              'Selasa': '07:00 - 21:00',
              'Rabu': '07:00 - 21:00',
              'Kamis': '07:00 - 21:00',
              'Jumat': '07:00 - 21:00',
            },
            mediaSosial: [
              {'icon': Icons.camera_alt_outlined, 'label': 'Instagram'},
              {'icon': Icons.facebook_outlined, 'label': 'Facebook'},
              {'icon': Icons.play_circle_outline, 'label': 'Youtube'},
            ],
          ),
        ),
        AccordionItemData(
          title: 'Ketentuan Umum',
          content: KetentuanUmumContent(
            manfaatTitle: 'Manfaat',
            manfaatDescription: 'RSUD Daha Husada mempunyai tugas melaksanakan sebagian tugas Dinas Kesehatan di bidang promotif, preventif, kuratif, rehabilitatif, penelitian pengembangan, dan melaksanakan UKM Strata II di wilayah kerjanya.',
            manfaatItems: [
              'Penyusunan rencana dan program RSUD Daha Husada',
              'Pelaksanaan ketatausahaan',
              'Pengawasan dan pengendalian operasional rumah sakit',
              'Pelayanan medis',
              'Penyelenggaraan pelayanan penunjang medis dan non medis',
              'Pelaksanaan pelayanan kesehatan umum masyarakat',
              'Penyelenggaraan pelayanan dan asuhan keperawatan',
            ],
            prosedurTitle: 'Pendaftaran online di poli RSUD Daha Husada',
            prosedurItems: [
              'Bagi pasien BPJS Kesehatan, pendaftaran menggunakan aplikasi Mobile JKN',
              'Untuk pasien umum dan asuransi lain, bisa daftar melalui WhatsApp.',
              'Pengguna akan diarahkan ke pesan WhatsApp admin RSUD Daha Husada',
            ],
          ),
        ),
        AccordionItemData(
          title: 'Tentang Layanan',
          content: TentangLayananContent(
            title: 'Tentang RSUD Daha Husada',
            paragraphs: [
              'Rumah Sakit Umum Daerah Daha Husada merupakan Unit Pelaksana Teknis Dinas Kesehatan Provinsi Jawa Timur yang telah berstatus sebagai Badan Layanan Umum Daerah (BLUD). Berdiri sejak tahun 1956, RSUD Daha Husada awalnya merupakan rumah sakit khusus kusta.',
              'Berdasarkan Peraturan Gubernur Jawa Timur No. 17 Tahun 2022, Rumah Sakit Kusta Kediri berubah nomenklatur menjadi Rumah Sakit Umum Daerah Daha Husada Kediri dengan klasifikasi kelas D.',
              'Pelayanan prima menjadi nilai utama yang mendasari seluruh aktivitas pelayanan di RSUD Daha Husada. Kami percaya bahwa pelayanan berkualitas tidak hanya menyembuhkan, tetapi juga membangun kepercayaan dan kepuasan masyarakat secara berkelanjutan.',
            ],
          ),
        ),
      ],
    );
  }
}
