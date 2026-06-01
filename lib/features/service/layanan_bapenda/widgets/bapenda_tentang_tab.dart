import 'package:flutter/material.dart';
import 'package:majadigi/core/widgets/index.dart';

class BapendaTentangTab extends StatelessWidget {
  const BapendaTentangTab({super.key});

  @override
  Widget build(BuildContext context) {
    return TentangTab(
      accordionItems: [
        AccordionItemData(
          title: 'Operasional',
          content: OperasionalContent(
            linkUrl: 'https://bapenda.jatimprov.go.id/',
            alamat:
                'Jl. Tunjungan No.1, Surabaya, Jawa Timur 60187, Indonesia',
            jamOperasional: {
              'Senin': '08:00 - 16:00',
              'Selasa': '08:00 - 16:00',
              'Rabu': '08:00 - 16:00',
              'Kamis': '08:00 - 16:00',
              'Jumat': '08:00 - 15:30',
              'Sabtu': 'Tutup',
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
            manfaatTitle: 'Manfaat Layanan Bapenda',
            manfaatDescription:
                'Bapenda Jatim menyediakan informasi dan layanan pajak kendaraan bermotor serta nilai jual kendaraan bermotor yang akurat dan terpercaya dari sumber resmi pemerintah.',
            manfaatItems: [
              'Informasi pajak kendaraan bermotor yang akurat dan update',
              'Data nilai jual kendaraan bermotor terkini',
              'Akses mudah melalui aplikasi dan website resmi',
              'Layanan konsultasi pajak dari tim profesional',
              'Transaksi aman dan terpercaya',
              'Dukungan pelanggan responsif',
              'Integrasi dengan sistem administrasi pemerintah',
            ],
            prosedurTitle: 'Cara Mengakses Layanan',
            prosedurItems: [
              'Buka aplikasi atau website Bapenda Jatim',
              'Pilih layanan yang ingin diakses (PKB atau NJKB)',
              'Masukkan data kendaraan (nomor polisi/plat nomor)',
              'Sistem akan menampilkan informasi yang relevan',
              'Simpan atau cetak hasil informasi sesuai kebutuhan',
              'Hubungi customer service jika ada pertanyaan',
            ],
          ),
        ),
        AccordionItemData(
          title: 'Tentang Layanan',
          content: TentangLayananContent(
            title: 'Tentang Bapenda Jatim',
            paragraphs: [
              'Bapenda (Badan Pendapatan) Provinsi Jawa Timur adalah lembaga pemerintah yang bertanggung jawab atas pengelolaan pendapatan asli daerah. Salah satu fokus utama kami adalah administrasi Pajak Kendaraan Bermotor (PKB) dan informasi Nilai Jual Kendaraan Bermotor (NJKB).',
              'Layanan Bapenda dirancang untuk memberikan kemudahan kepada masyarakat dalam mengakses informasi pajak kendaraan bermotor secara cepat, akurat, dan transparan. Kami berkomitmen untuk memberikan pelayanan terbaik dengan teknologi terkini.',
              'Dengan sistem digital yang terintegrasi, Bapenda Jatim memastikan setiap data yang diberikan akurat dan sesuai dengan data resmi dari pemerintah. Kami terus berinovasi untuk meningkatkan kualitas layanan kepada masyarakat Jawa Timur.',
              'Percayakan kebutuhan informasi pajak dan nilai jual kendaraan Anda kepada Bapenda Jatim. Kami siap melayani Anda dengan sepenuh hati dan profesionalisme tinggi.',
            ],
          ),
        ),
      ],
    );
  }
}

