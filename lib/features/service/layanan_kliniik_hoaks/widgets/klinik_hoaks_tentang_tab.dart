import 'package:flutter/material.dart';
import 'package:majadigi/core/widgets/index.dart';

class KlinikHoaksTentangTab extends StatelessWidget {
  const KlinikHoaksTentangTab({super.key});

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
              'Senin': '08:00 - 17:00',
              'Selasa': '08:00 - 17:00',
              'Rabu': '08:00 - 17:00',
              'Kamis': '08:00 - 17:00',
              'Jumat': '08:00 - 17:00',
              'Sabtu': '08:00 - 12:00',
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
            manfaatTitle: 'Manfaat Layanan Klinik Hoaks',
            manfaatDescription:
                'Klinik Hoaks adalah platform layanan publik yang membantu masyarakat memverifikasi kebenaran informasi yang beredar di media sosial dan media lainnya.',
            manfaatItems: [
              'Verifikasi informasi 24 jam oleh tim ahli bersertifikat',
              'Akses gratis untuk semua kalangan masyarakat',
              'Proses klarifikasi cepat dengan respons dalam 24 jam',
              'Database hoaks terlengkap se-Jawa Timur',
              'Edukasi literasi digital untuk pencegahan hoaks',
              'Tracking real-time status laporan hoaks Anda',
              'Sistem klarifikasi transparan dan akuntabel',
            ],
            prosedurTitle: 'Cara Melaporkan Hoaks',
            prosedurItems: [
              'Kunjungi platform Klinik Hoaks atau aplikasi mobile',
              'Pilih menu "Laporan Hoaks" untuk membuat laporan baru',
              'Tulis informasi yang dicurigai sebagai hoaks secara detail',
              'Sertakan link, screenshot, atau bukti pendukung lainnya',
              'Jelaskan alasan mengapa Anda yakin itu adalah hoaks',
              'Serahkan laporan dan tunggu verifikasi dari tim ahli',
              'Pantau status laporan Anda melalui kode tracking',
            ],
          ),
        ),
        AccordionItemData(
          title: 'Tentang Layanan',
          content: TentangLayananContent(
            title: 'Tentang Klinik Hoaks',
            paragraphs: [
              'Klinik Hoaks adalah inisiatif Dinas Kesehatan Provinsi Jawa Timur untuk melawan penyebaran informasi palsu (hoaks) yang dapat merugikan masyarakat. Platform ini menyediakan layanan gratis untuk memverifikasi kebenaran informasi yang beredar.',
              'Dengan meningkatnya penggunaan media sosial, hoaks dan disinformasi menjadi masalah serius yang dapat memicu kepanikan, konflik sosial, dan berdampak negatif terhadap kesehatan masyarakat. Klinik Hoaks hadir sebagai solusi nyata dalam memberantas informasi palsu.',
              'Tim verifikator Klinik Hoaks terdiri dari para ahli di bidang kesehatan, teknologi, dan komunikasi yang telah dilatih khusus untuk mengidentifikasi dan mengklarifikasi hoaks dengan akurat dan objektif.',
              'Mari bersama-sama ciptakan ekosistem informasi yang sehat dan terpercaya dengan aktif melaporkan hoaks dan menyebarkan informasi yang benar kepada masyarakat luas.',
            ],
          ),
        ),
      ],
    );
  }
}

