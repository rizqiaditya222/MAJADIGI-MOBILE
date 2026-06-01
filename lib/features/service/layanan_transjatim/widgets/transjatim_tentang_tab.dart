import 'package:flutter/material.dart';
import 'package:majadigi/core/widgets/index.dart';

class TransjatimTentangTab extends StatelessWidget {
  const TransjatimTentangTab({super.key});

  @override
  Widget build(BuildContext context) {
    return TentangTab(
      accordionItems: [
        AccordionItemData(
          title: 'Operasional',
          content: OperasionalContent(
            linkUrl: 'https://transjatim.jatimprov.go.id/',
            alamat:
                'Jl. Raya Darmo, Surabaya, Jawa Timur 60188, Indonesia',
            jamOperasional: {
              'Senin': '05:00 - 22:00',
              'Selasa': '05:00 - 22:00',
              'Rabu': '05:00 - 22:00',
              'Kamis': '05:00 - 22:00',
              'Jumat': '05:00 - 22:00',
              'Sabtu': '05:00 - 22:00',
              'Minggu': '05:00 - 22:00',
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
            manfaatTitle: 'Manfaat Layanan',
            manfaatDescription:
                'Trans Jatim adalah layanan transportasi publik yang mengutamakan kenyamanan dan keselamatan penumpang dengan armada kendaraan modern.',
            manfaatItems: [
              'Rute terintegrasi mencakup seluruh wilayah Jawa Timur',
              'Harga tiket terjangkau dan kompetitif',
              'Armada kendaraan modern dan terawat dengan baik',
              'Layanan pelanggan 24 jam siap membantu',
              'Program khusus untuk pelajar dan lansia',
              'Informasi real-time jadwal dan ketersediaan tiket',
            ],
            prosedurTitle: 'Cara Membeli Tiket',
            prosedurItems: [
              'Kunjungi aplikasi atau website Trans Jatim',
              'Pilih rute keberangkatan dan tujuan Anda',
              'Pilih tanggal dan jam keberangkatan yang tersedia',
              'Tentukan jumlah penumpang dan jenis tiket',
              'Selesaikan pembayaran melalui metode yang tersedia',
              'Simpan kode booking dan tiket digital Anda',
            ],
          ),
        ),
        AccordionItemData(
          title: 'Tentang Layanan',
          content: TentangLayananContent(
            title: 'Tentang Trans Jatim',
            paragraphs: [
              'Trans Jatim adalah Badan Usaha Milik Daerah (BUMD) yang mengelola transportasi publik di Jawa Timur. Didirikan untuk memberikan solusi transportasi yang aman, nyaman, dan terjangkau bagi seluruh masyarakat.',
              'Dengan jaringan rute yang luas, Trans Jatim melayani perjalanan dari kota besar hingga daerah-daerah terpencil di Jawa Timur. Komitmen kami adalah menyediakan layanan transportasi berkualitas dengan harga yang terjangkau untuk semua kalangan.',
              'Armada Trans Jatim terus diperbarui dengan menggunakan kendaraan ramah lingkungan dan berstandar internasional. Kami juga menerapkan protokol kesehatan dan keselamatan yang ketat untuk kenyamanan perjalanan Anda.',
              'Visi kami menjadi pilihan utama transportasi publik di Jawa Timur yang dipercaya dan dicintai masyarakat. Terima kasih telah menggunakan layanan Trans Jatim!',
            ],
          ),
        ),
      ],
    );
  }
}

