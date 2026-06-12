import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:majadigi/core/router/app_router.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';
import 'package:majadigi/core/widgets/labeled_header.dart';
import 'package:majadigi/core/widgets/service_card.dart';
import 'package:majadigi/core/widgets/custom_tab_bar.dart';
import 'widgets/klinik_hoaks_tentang_tab.dart';

class KlinikHoaksPage extends StatefulWidget {
  const KlinikHoaksPage({super.key});

  @override
  State<KlinikHoaksPage> createState() => _KlinikHoaksPageState();
}

class _KlinikHoaksPageState extends State<KlinikHoaksPage>
    with SingleTickerProviderStateMixin {
  final TextEditingController searchController =
  TextEditingController();
  late TabController _tabController;

  final List<Map<String, String>> rekapHoaks = [
    {
      'jumlah': '431',
      'title': 'Berita Hoaks',
      'desc':
      'Konten rekayasa atau palsu untuk provokasi dan menyesatkan opini publik. Konten rekayasa atau palsu untuk provokasi dan menyesatkan opini publik.',
    },
    {
      'jumlah': '28',
      'title': 'Disinformasi',
      'desc':
      'Informasi salah yang sengaja disebarkan untuk menyesatkan pembaca.',
    },
    {
      'jumlah': '65',
      'title': 'Misinformasi',
      'desc':
      'Informasi tidak akurat yang tersebar tanpa niat menyesatkan.',
    },
  ];

  final List<Map<String, String>> layananList = [
    {
      'title': 'Laporan Hoaks',
      'description':
      'Kirim informasi yang kamu temukan, kami bantu klarifikasi 24 jam',
      'image':
      'lib/assets/images/laporan_hoaks.png',
    },
    {
      'title': 'Lacak Tiket Laporan',
      'description':
      'Pantau status permohonan klarifikasi yang telah diajukan secara real time',
      'image':
      'lib/assets/images/lacak_laporan.png',
    },
  ];

  final List<Map<String, String>> laporanTerkini = [
    {
      'image':
      'lib/assets/images/hoaks_sample.png',
      'title':
      'Donald Trump Singgung Sunni dan Syiah di Indonesia terkait Dukungan ke Iran Konten rekayasa atau palsu untuk provokasi dan menyesatkan opini publik. Konten rekayasa atau palsu untuk provokasi dan menyesatkan opini publik.',
      'date': '7 April 2025',
    },
    {
      'image':
      'lib/assets/images/hoaks_sample.png',
      'title':
      'Donald Trump Singgung Sunni dan Syiah di Indonesia terkait Dukungan ke Iran',
      'date': '3 Januari 2025',
    },
    {
      'image':
      'lib/assets/images/hoaks_sample.png',
      'title':
      'Donald Trump Singgung Sunni dan Syiah di Indonesia terkait Dukungan ke Iran',
      'date': '12 Februari 2025',
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
          LabeledHeader(
            title: 'Klinik Hoaks',
            description:
            'Platform layanan publik untuk membantu masyarakat memverifikasi kebenaran informasi yang beredar',
            backgroundImage:
            'lib/assets/images/hoaks_background.png',
            searchController: searchController,
            onBackPressed: () {
              Navigator.pop(context);
            },
            onBookmarkPressed: () {},
          ),

          /// TAB BAR
          CustomTabBar(
            tabController: _tabController,
            tabs: const ['Layanan', 'Tentang'],
          ),

          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildLayananTab(),
                const KlinikHoaksTentangTab(),
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
      borderRadius:
      const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          /// ==========================
          /// REKAP HOAKS
          /// ==========================
          Text(
            'Rekaps Hoaks',
            style:
            AppTextStyles.semiBold(
              AppTextStyles.h4,
            ),
          ),

          const SizedBox(height: 12),

          SizedBox(
            height: 155,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: rekapHoaks.length,
              itemBuilder: (context, index) {
                final item = rekapHoaks[index];

                return Container(
                  width: 170,
                  margin: const EdgeInsets.only(
                    right: 12,
                  ),
                  padding: const EdgeInsets.all(
                    16,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      16,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['jumlah']!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(
                            0xffD87A2E,
                          ),
                        ),
                      ),

                      const SizedBox(height: 2),

                      Text(
                        item['title']!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Color(
                            0xffD87A2E,
                          ),
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      Expanded(
                        child: Text(
                          item['desc']!,
                          textAlign: TextAlign.justify,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 24),

          /// ==========================
          /// PROGRAM LAYANAN
          /// ==========================
          Text(
            'Program Layanan',
            style:
            AppTextStyles.semiBold(
              AppTextStyles.h4,
            ),
          ),

          const SizedBox(height: 16),

          ...layananList.map(
                (layanan) => Padding(
              padding:
              const EdgeInsets.only(
                bottom: 20,
              ),
              child: ServiceCard(
                title: layanan['title']!,
                description: layanan['description']!,
                image: layanan['image']!,
                onPressed: () {
                  if (layanan['title'] == 'Laporan Hoaks') {
                    context.push(Routes.laporanHoaks);
                  }
                  else {
                    context.push(Routes.laporanHoaksLacak);
                  }
                },
              ),
            ),
          ),

          const SizedBox(height: 10),

          /// ==========================
          /// LAPORAN TERKINI HEADER
          /// ==========================
          Row(
            mainAxisAlignment:
            MainAxisAlignment
                .spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    'lib/assets/images/agenda_icon.png',
                    width: 18,
                  ),
                  const SizedBox(
                      width: 10),
                  Text(
                    'Laporan Terkini',
                    style:
                    AppTextStyles
                        .semiBold(
                      AppTextStyles
                          .h4,
                    ),
                  ),
                ],
              ),

              GestureDetector(
                onTap: () {
                  context.push(
                    Routes.listLaporanHoaks,
                  );
                },
                child: Text(
                  'Lihat Semua',
                  style:
                  AppTextStyles
                      .medium(
                    AppTextStyles
                        .body2,
                  ).copyWith(
                    color:
                    AppColors
                        .blue300,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          /// ==========================
          /// LAPORAN TERKINI LIST
          /// ==========================
          SizedBox(
            height: 230,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: laporanTerkini.length,
              itemBuilder: (context, index) {
                final item = laporanTerkini[index];

                return Container(
                  width: 230,
                  margin: const EdgeInsets.only(
                    right: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      16,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius:
                        const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                        child: Image.asset(
                          item['image']!,
                          height: 110,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['date']!,
                              style: const TextStyle(
                                fontSize: 11,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              item['title']!,
                              maxLines: 3,
                              overflow:
                              TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight:
                                FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
