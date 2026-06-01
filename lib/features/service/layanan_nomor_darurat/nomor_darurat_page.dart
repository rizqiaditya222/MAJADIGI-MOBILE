import 'package:flutter/material.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';
import 'package:majadigi/core/widgets/index.dart';
import 'package:majadigi/core/widgets/labeled_header.dart';

class NomorDaruratPage extends StatefulWidget {
  const NomorDaruratPage({super.key});

  @override
  State<NomorDaruratPage> createState() => _NomorDaruratPageState();
}

class _NomorDaruratPageState extends State<NomorDaruratPage>
    with SingleTickerProviderStateMixin {
  final TextEditingController searchController =
  TextEditingController();

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
                    onPressed: () {},
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
          title: 'Tentang Layanan',
          content: TentangLayananContent(
            title: 'Nomor Darurat Jawa Timur',
            paragraphs: [
              'Layanan Nomor Darurat Jawa Timur menyediakan daftar nomor penting yang dapat dihubungi masyarakat dalam kondisi darurat.',
              'Melalui layanan ini masyarakat dapat dengan mudah mengakses nomor ambulans, kepolisian, call center pemerintah, dan layanan penting lainnya.',
              'Pastikan menggunakan layanan ini secara bijak dan hanya untuk kebutuhan yang benar-benar mendesak.',
            ],
          ),
        ),
      ],
    );
  }
}