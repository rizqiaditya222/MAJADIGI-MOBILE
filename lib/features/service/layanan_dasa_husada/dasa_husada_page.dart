import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';
import 'package:majadigi/core/widgets/index.dart';
import 'package:majadigi/core/widgets/labeled_header.dart';

import '../../../core/router/app_router.dart';

class DasaHusadaPage extends StatefulWidget {
  const DasaHusadaPage({super.key});

  @override
  State<DasaHusadaPage> createState() => _DasaHusadaPageState();
}

class _DasaHusadaPageState extends State<DasaHusadaPage>
    with SingleTickerProviderStateMixin {
  final TextEditingController searchController = TextEditingController();
  late TabController _tabController;

  final List<Map<String, String>> layananList = [
    {
      'title': 'Jadwal Operasi',
      'description': 'Info jadwal tindakan operasi RSUD Daha Husada',
      'image': 'lib/assets/images/jadwal_operasi.png',
    },
    {
      'title': 'Ketersediaan Kamar',
      'description': 'Informasi jumlah kamar rawat inap yang tersedia',
      'image': 'lib/assets/images/ketersediaan_kamar.png',
    },
    {
      'title': 'Info Antrian Pasien',
      'description': 'Informasi jadwal praktik dokter spesialis dan umum',
      'image': 'lib/assets/images/antrian_pasien.png',
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
            title: 'RSUD Daha Husada',
            description:
                'Info ketersediaan kamar rawat RSUD Daha Husada Batu',
            backgroundImage: 'lib/assets/images/background_wisata.png',
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
            tabs: const ['Layanan', 'Tentang'],
          ),

          /// TAB CONTENT
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildLayananTab(),
                const DasaHusadaTentangTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// TAB 1: LAYANAN
  Widget _buildLayananTab() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        itemCount: layananList.length,
        itemBuilder: (context, index) {
          final layanan = layananList[index];

          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// IMAGE
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                    child: Image.asset(
                      layanan['image']!,
                      width: double.infinity,
                      height: 160,
                      fit: BoxFit.cover,
                    ),
                  ),

                  /// CONTENT
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 24,
                    ),
                    child: Column(
                      children: [
                        /// TITLE
                        Text(
                          layanan['title']!,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.semiBold(
                            AppTextStyles.h2,
                          ).copyWith(
                            color: AppColors.black,
                          ),
                        ),

                        const SizedBox(height: 4),

                        /// DESCRIPTION
                        Text(
                          layanan['description']!,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.regular(
                            AppTextStyles.body2,
                          ).copyWith(
                            color: AppColors.dark300,
                          ),
                        ),

                        const SizedBox(height: 24),

                        /// BUTTON
                        PrimaryButton(label: 'CEK', onPressed: () {
                          if (index == 0) {
                            context.push(Routes.operasiDasaHusada);
                          } else if (index == 1) {
                            context.push(Routes.kamarDasaHusada);
                          } else if (index == 2) {
                            context.push(Routes.antrianDasaHusada);
                          }
                        })
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

/// TAB 2: TENTANG - COMPONENT LOKAL
class DasaHusadaTentangTab extends StatelessWidget {
  const DasaHusadaTentangTab({super.key});

  @override
  Widget build(BuildContext context) {
    return TentangTab(
      accordionItems: [
        AccordionItemData(
          title: 'Operasional',
          content: OperasionalContent(
            linkUrl: 'https://rsud.badung.go.id/',
            alamat:
                'Jl. Raya Sesetan, Sesetan, Denpasar, Bali 80223, Indonesia',
            jamOperasional: {
              'Senin': '08:00 - 20:00',
              'Selasa': '08:00 - 20:00',
              'Rabu': '08:00 - 20:00',
              'Kamis': '08:00 - 20:00',
              'Jumat': '08:00 - 20:00',
              'Sabtu': '08:00 - 17:00',
              'Minggu': '08:00 - 17:00',
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
                'RSUD Daha Husada adalah rumah sakit milik pemerintah daerah yang memberikan pelayanan kesehatan berkualitas dengan standar internasional untuk masyarakat umum.',
            manfaatItems: [
              'Pelayanan medis 24 jam dengan dokter spesialis berpengalaman',
              'Fasilitas perawatan intensif dan operasi modern',
              'Layanan farmasi lengkap dengan harga terjangkau',
              'Program kesehatan preventif dan edukasi masyarakat',
              'Sistem informasi kesehatan terintegrasi',
              'Kemitraan dengan berbagai asuransi kesehatan',
              'Tim medis dan paramedis profesional dan berkomitmen',
            ],
            prosedurTitle: 'Prosedur Pendaftaran',
            prosedurItems: [
              'Datang ke loket pendaftaran dengan membawa KTP atau identitas lainnya',
              'Isi formulir pendaftaran pasien dengan data yang lengkap dan benar',
              'Serahkan formulir kepada petugas untuk diproses',
              'Tunggu panggilan dan masuk ke ruang pemeriksaan dokter',
              'Lakukan pembayaran sesuai dengan jenis asuransi yang dimiliki',
            ],
          ),
        ),
        AccordionItemData(
          title: 'Tentang Layanan',
          content: TentangLayananContent(
            title: 'Tentang RSUD Daha Husada Batu',
            paragraphs: [
              'RSUD Daha Husada adalah Rumah Sakit Umum Daerah milik Pemerintah Kota Batu yang berkomitmen memberikan pelayanan kesehatan berkualitas, terjangkau, dan mudah diakses oleh seluruh masyarakat.',
              'Dengan fasilitas modern dan tenaga medis profesional, kami siap melayani segala kebutuhan kesehatan Anda mulai dari pemeriksaan umum hingga tindakan operasi yang kompleks.',
              'Visi kami adalah menjadi rumah sakit pilihan utama yang dipercaya masyarakat. Misi kami memberikan pelayanan kesehatan prima dengan teknologi terkini, sumber daya manusia yang kompeten, dan nilai-nilai kemanusiaan yang tinggi.',
              'Kami terus berinovasi dan meningkatkan kualitas pelayanan untuk memenuhi kebutuhan kesehatan masyarakat Kota Batu dan sekitarnya.',
            ],
          ),
        ),
      ],
    );
  }
}

