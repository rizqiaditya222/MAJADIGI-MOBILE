import 'package:flutter/material.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';
import 'package:majadigi/core/widgets/index.dart';
import 'package:majadigi/core/widgets/labeled_header.dart';
import 'package:android_intent_plus/android_intent.dart';

class NomorDaruratPage extends StatefulWidget {
  const NomorDaruratPage({super.key});

  @override
  State<NomorDaruratPage> createState() => _NomorDaruratPageState();
}

class _NomorDaruratPageState extends State<NomorDaruratPage>
    with SingleTickerProviderStateMixin {
  final TextEditingController searchController =
  TextEditingController();

  Future<void> _makePhoneCall(String phoneNumber) async {
    final cleanNumber =
    phoneNumber.replaceAll(RegExp(r'[^0-9+]'), '');

    try {
      final intent = AndroidIntent(
        action: 'android.intent.action.DIAL',
        data: 'tel:$cleanNumber',
      );

      await intent.launch();
    } catch (e) {
      debugPrint('CALL ERROR: $e');

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Gagal membuka aplikasi telepon: $e',
          ),
        ),
      );
    }
  }

  late TabController _tabController;

  String selectedProvince = 'Jawa Timur';

  final List<Map<String, String>> emergencyNumbers = [
    {
      'title': 'Ambulans / Keadaan Darurat',
      'number': '112',
    },
    {
      'title': 'Polda Jatim',
      'number': '(031) 8280748',
    },
    {
      'title': 'Call Center',
      'number': '1500979',
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark100,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          /// HEADER
          LabeledHeader(
            title: 'Nomor Darurat',
            description:
            'Temukan nomor kontak darurat Kabupaten/Kota di Jatim',
            backgroundImage:
            'lib/assets/images/nomor_background.png',
            searchController: searchController,
            onBackPressed: () {
              Navigator.pop(context);
            },
            onBookmarkPressed: () {},
            showSearch: false,
          ),

          /// TAB BAR
          CustomTabBar(
            tabController: _tabController,
            tabs: const [
              'Layanan',
              'Tentang',
            ],
          ),

          /// CONTENT
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildLayananTab(),
                const NomorDaruratTentangTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLayananTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildProvinceDropdown(),

        const SizedBox(height: 16),

        ...emergencyNumbers.map(
              (item) => Padding(
            padding:
            const EdgeInsets.only(bottom: 16),
            child: _buildEmergencyCard(
              title: item['title']!,
              number: item['number']!,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProvinceDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 18,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFFE7E7E7),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              selectedProvince,
              style: AppTextStyles.medium(
                AppTextStyles.body1,
              ),
            ),
          ),
          const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Color(0xFF888888),
          ),
        ],
      ),
    );
  }

  Widget _buildEmergencyCard({
    required String title,
    required String number,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFF0F0F0),
        ),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: SizedBox(
              width: double.infinity,
              height: 32,
              child: Image.asset(
                'lib/assets/images/nomor_decoration.png',
                fit: BoxFit.cover,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(
              20,
              18,
              20,
              18,
            ),
            child: Column(
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bold(
                    AppTextStyles.h3,
                  ),
                ),

                const SizedBox(height: 12),

                Text(
                  number,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.medium(
                    AppTextStyles.h2,
                  ).copyWith(
                    color: const Color(0xFFFF0054),
                  ),
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      _makePhoneCall(number);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                      const Color(0xFFFF0054),
                      elevation: 0,
                      shape:
                      RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(
                          12,
                        ),
                      ),
                    ),
                    child: Text(
                      'CALL',
                      style: AppTextStyles.bold(
                        AppTextStyles.body3,
                      ).copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NomorDaruratTentangTab
    extends StatelessWidget {
  const NomorDaruratTentangTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TentangTab(
      accordionItems: [
        AccordionItemData(
          title: 'Operasional',
          content: OperasionalContent(
            linkUrl: 'https://siskaperbapo.jatimprov.go.id/',
            alamat:
            'Jl. Siwalankerto Utara II/42 Surabaya',
            jamOperasional: {
              'Senin': '24 Jam',
              'Selasa': '24 Jam',
              'Rabu': '24 Jam',
              'Kamis': '24 Jam',
              'Jumat': '24 Jam',
              'Sabtu': '24 Jam',
              'Minggu': '24 Jam',
            },
            // mediaSosial: [
            //   {'icon': Icons.camera_alt_outlined, 'label': 'Instagram'},
            //   {'icon': Icons.facebook_outlined, 'label': 'Facebook'},
            //   {'icon': Icons.language, 'label': 'Website'},
            // ],
          ),
        ),
        AccordionItemData(
          title: 'Ketentuan Umum',
          content: KetentuanUmumContent(
            manfaatTitle: 'Manfaat Layanan',
            manfaatDescription:
            'Layanan nomor darurat memberikan akses cepat dan mudah untuk mencari pertolongan saat seseorang mengalami atau mengetahui situasi darurat seperti kebakaran, banjir, kecelakaan lalu lintas, kriminalitas, dan lainnya. Dengan begitu, layanan ini diharapkan mampu mempercepat penanganan keadaan darurat dan meminimalisir dampak buruk yang muncul akibat situasi darurat. Layanan nomor darurat beroperasi 24 jam sehari, dan 7 hari seminggu. Sehingga masyarakat bisa mengaksesnya kapanpun dan dari manapun.',
            // manfaatItems: [
            //   'Akses informasi harga bahan pokok secara harian dan transparan.',
            //   'Pemantauan ketersediaan bahan pokok dengan mudah, kapan saja.',
            //   'Mendukung pengendalian inflasi dan menjaga stabilitas harga bahan pokok.',
            // ],
            prosedurTitle: 'Sistem, Mekanisme, dan Prosedur',
            prosedurItems: [
              'Kontak darurat biasanya lebih pendek atau sedikit dengan tujuan agar mudah diingat. Pastikan Anda menyimpan daftar kontak darurat di ponsel Anda atau tempat yang mudah dijangkau. Terakhir, pastikan Anda memberikan informasi secara jelas mengenai kejadian dan lokasinya agar petugas bisa mengeksekusinya lebih cepat.',
            ],
          ),
        ),
        AccordionItemData(
          title: 'Tentang Layanan',
          content: TentangLayananContent(
            title: 'Tentang Nomor Darurat',
            paragraphs: [
              'Nomor darurat merupakan layanan cepat tanggap dari pemerintah atau instansi terkait untuk memberikan bantuan kepada masyarakat. Nomor ini dapat dihubungi saat warga menghadapi situasi mendesak, berbahaya, atau yang mengancam nyawa—seperti kecelakaan, kebakaran, bencana alam, gangguan keamanan, hingga kondisi medis gawat darurat.',
              'Sejak 2015, pemerintah Indonesia menerapkan Program Layanan Call Center 112 di berbagai daerah di Indonesia. Nomor darurat sengaja dibuat singkat agar mudah diingat dan bisa diakses dengan cepat. Selain Call Center 112, masing-masing wilayah di Indonesia juga memiliki nomor darurat khusus yang bisa mempercepat penanganan. Di Jawa Timur misalnya, tiap instansi menyediakan nomor darurat khusus yang bisa diakses 24 jam dan bebas pulsa.',
            'Agar berjalan efektif, warga dihimbau tidak melakukan panggilan iseng. Informasi yang jelas dan tepat saat melapor akan membantu petugas memberikan respon cepat dan tepat sasaran.'
            ],
          ),
        ),
      ],
    );
  }
}