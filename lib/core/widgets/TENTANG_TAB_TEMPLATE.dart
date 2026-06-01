import 'package:flutter/material.dart';
import 'package:majadigi/core/widgets/index.dart';

/// FILE: lib/features/service/layanan_baru/widgets/tentang_tab.dart
///
/// TEMPLATE LENGKAP UNTUK MEMBUAT TENTANG TAB DI LAYANAN BARU
/// Copy dan sesuaikan dengan data spesifik layanan Anda

class LayananBaruTentangTab extends StatelessWidget {
  const LayananBaruTentangTab({super.key});

  @override
  Widget build(BuildContext context) {
    return TentangTab(
      accordionItems: [
        /// ACCORDION 1: OPERASIONAL
        AccordionItemData(
          title: 'Operasional',
          content: OperasionalContent(
            linkUrl: 'https://example.com/', // URL website layanan
            alamat: 'Jl. Contoh No.123, Kota XYZ', // Alamat lengkap
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
              {'icon': Icons.play_circle_outline, 'label': 'Youtube'},
              {'icon': Icons.language, 'label': 'Website'},
            ],
          ),
        ),

        /// ACCORDION 2: KETENTUAN UMUM
        AccordionItemData(
          title: 'Ketentuan Umum',
          content: KetentuanUmumContent(
            manfaatTitle: 'Manfaat Layanan',
            manfaatDescription:
                'Deskripsi singkat tentang manfaat layanan Anda di sini.',
            manfaatItems: [
              'Manfaat 1 dari layanan',
              'Manfaat 2 dari layanan',
              'Manfaat 3 dari layanan',
              'Manfaat 4 dari layanan',
            ],
            prosedurTitle: 'Prosedur / Cara Menggunakan',
            prosedurItems: [
              'Langkah 1 - Deskripsi langkah pertama',
              'Langkah 2 - Deskripsi langkah kedua',
              'Langkah 3 - Deskripsi langkah ketiga',
              'Langkah 4 - Deskripsi langkah keempat',
            ],
          ),
        ),

        /// ACCORDION 3: TENTANG LAYANAN
        AccordionItemData(
          title: 'Tentang Layanan',
          content: TentangLayananContent(
            title: 'Tentang [Nama Layanan]',
            paragraphs: [
              'Paragraf pertama: Berisi pengenalan tentang layanan Anda. Jelaskan apa itu, sejarah, dan visi/misi.',
              'Paragraf kedua: Jelaskan nilai-nilai, komitmen, dan keunggulan kompetitif layanan Anda.',
              'Paragraf ketiga: Tambahkan informasi tambahan atau pencapaian yang ingin Anda tonjolkan.',
              'Paragraf keempat: Penutup atau ajakan untuk menggunakan layanan Anda.',
            ],
          ),
        ),
      ],
    );
  }
}

/// ============================================================================
/// PARAMETER PENJELASAN
/// ============================================================================
///
/// OperasionalContent Parameters:
/// - linkUrl: String? = URL website/link informasi layanan
/// - alamat: String? = Alamat lengkap lokasi layanan
/// - jamOperasional: Map<String, String>? = Peta hari-waktu operasional
///   Format: {'Hari': 'Jam Buka - Jam Tutup'}
/// - mediaSosial: List<Map<String, dynamic>>? = Daftar media sosial
///   Format: [{'icon': IconData, 'label': 'Nama Sosial'}, ...]
///
/// KetentuanUmumContent Parameters:
/// - manfaatTitle: String? = Judul bagian manfaat (misal: "Manfaat Layanan")
/// - manfaatDescription: String? = Deskripsi singkat manfaat
/// - manfaatItems: List<String>? = Daftar poin-poin manfaat (otomatis bernomor)
/// - prosedurTitle: String? = Judul bagian prosedur (misal: "Cara Menggunakan")
/// - prosedurItems: List<String>? = Daftar poin-poin prosedur (otomatis bernomor)
///
/// TentangLayananContent Parameters:
/// - title: String? = Judul tentang layanan
/// - paragraphs: List<String>? = Daftar paragraf deskriptif (otomatis spasi)
///
/// ============================================================================
/// CONTOH IMPLEMENTASI DI PAGE
/// ============================================================================
///
/// File: lib/features/service/layanan_baru/layanan_baru_page.dart
///
/// ```dart
/// import 'package:flutter/material.dart';
/// import 'package:majadigi/core/widgets/index.dart';
/// import 'package:majadigi/core/widgets/labeled_header.dart';
/// import 'widgets/tentang_tab.dart'; // atau gunakan TentangTab langsung
///
/// class LayananBaruPage extends StatefulWidget {
///   @override
///   State<LayananBaruPage> createState() => _LayananBaruPageState();
/// }
///
/// class _LayananBaruPageState extends State<LayananBaruPage>
///     with SingleTickerProviderStateMixin {
///   late TabController _tabController;
///   final searchController = TextEditingController();
///
///   @override
///   void initState() {
///     super.initState();
///     _tabController = TabController(length: 2, vsync: this);
///   }
///
///   @override
///   void dispose() {
///     _tabController.dispose();
///     searchController.dispose();
///     super.dispose();
///   }
///
///   @override
///   Widget build(BuildContext context) {
///     return Scaffold(
///       body: Column(
///         children: [
///           /// HEADER
///           LabeledHeader(
///             title: 'Judul Layanan',
///             description: 'Deskripsi layanan',
///             backgroundImage: 'lib/assets/images/background.png',
///             searchController: searchController,
///             onBackPressed: () => Navigator.pop(context),
///             onBookmarkPressed: () {},
///             showSearch: false,
///           ),
///
///           /// TAB BAR
///           CustomTabBar(
///             tabController: _tabController,
///             tabs: const ['Layanan', 'Tentang'],
///           ),
///
///           /// TAB CONTENT
///           Expanded(
///             child: TabBarView(
///               controller: _tabController,
///               children: [
///                 _buildLayananTab(),
///                 const LayananBaruTentangTab(), // Gunakan component lokal
///               ],
///             ),
///           ),
///         ],
///       ),
///     );
///   }
///
///   Widget _buildLayananTab() {
///     return Center(child: Text('Konten Layanan'));
///   }
/// }
/// ```
///
/// ============================================================================
/// STRUKTUR FOLDER YANG DIREKOMENDASIKAN
/// ============================================================================
///
/// lib/features/service/layanan_baru/
/// ├── layanan_baru_page.dart          (Page utama dengan tab)
/// └── widgets/
///     └── tentang_tab.dart            (Wraper lokal untuk TentangTab)
///
/// Global Components (di lib/core/widgets):
/// ├── accordion_widget.dart           (Accordion base)
/// ├── custom_tab_bar.dart             (TabBar base)
/// ├── tentang_tab.dart                (TentangTab container)
/// └── content/
///     ├── operasional_content.dart    (Operasional content)
///     ├── ketentuan_umum_content.dart (Ketentuan content)
///     └── tentang_layanan_content.dart (Tentang content)
///
/// ============================================================================
/// QUICK COPY-PASTE
/// ============================================================================
///
/// 1. Buat file: lib/features/service/[nama_layanan]/widgets/tentang_tab.dart
/// 2. Copy kode di atas dan sesuaikan data
/// 3. Import di page: import 'widgets/tentang_tab.dart';
/// 4. Gunakan di TabBarView: const [NamaLayananTentangTab(),]
///
/// Done! 🎉

