import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:majadigi/core/router/app_router.dart';

import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';
import 'package:majadigi/core/widgets/auth_header_widget.dart';

class BeritaPage extends StatefulWidget {
  const BeritaPage({super.key});

  @override
  State<BeritaPage> createState() => _BeritaPageState();
}

class _BeritaPageState extends State<BeritaPage> {
  final List<Map<String, dynamic>> beritaItems = [
    {
      'title': 'Gunung Raung Erupsi, Puluhan Pendaki Putar Balik',
      'date': 'Kamis, 01 Januari 2026',
      'image': 'lib/assets/images/wisata_sample.png',
      'isLatest': true,
    },
    {
      'title': 'Gunung Raung Erupsi, Puluhan Pendaki Putar Balik',
      'date': 'Kamis, 01 Januari 2026',
      'image': 'lib/assets/images/wisata_sample.png',
      'isLatest': false,
    },
    {
      'title': 'Gunung Raung Erupsi, Puluhan Pendaki Putar Balik',
      'date': 'Kamis, 01 Januari 2026',
      'image': 'lib/assets/images/wisata_sample.png',
      'isLatest': false,
    },
    {
      'title': 'Gunung Raung Erupsi, Puluhan Pendaki Putar Balik',
      'date': 'Kamis, 01 Januari 2026',
      'image': 'lib/assets/images/wisata_sample.png',
      'isLatest': false,
    },
    {
      'title': 'Gunung Raung Erupsi, Puluhan Pendaki Putar Balik',
      'date': 'Kamis, 01 Januari 2026',
      'image': 'lib/assets/images/wisata_sample.png',
      'isLatest': false,
    },
    {
      'title': 'Gunung Raung Erupsi, Puluhan Pendaki Putar Balik',
      'date': 'Kamis, 01 Januari 2026',
      'image': 'lib/assets/images/wisata_sample.png',
      'isLatest': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final latestNews = beritaItems.firstWhere(
      (item) => item['isLatest'] == true,
    );

    final otherNews = beritaItems
        .where((item) => item['isLatest'] == false)
        .toList();

    return Scaffold(
      backgroundColor: AppColors.dark100,

      body: Column(
        children: [
          /// HEADER
          AuthHeaderWidget(
            imagePath: 'lib/assets/images/wayang_image.png',

            showTitle: true,
            title: 'Berita Jawa Timur',

            onBackPressed: () {
              context.pop();
            },
          ),

          /// CONTENT
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(left: 24, right:24, top: 24, bottom: 0),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// FEATURED NEWS
                  GestureDetector(
                    onTap: () {},

                    child: Container(
                      width: double.infinity,
                      height: 290,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),

                      child: Stack(
                        children: [
                          /// IMAGE
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              latestNews['image'] as String,
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),

                          /// OVERLAY
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.black.withOpacity(0.05),
                                  Colors.black.withOpacity(0.65),
                                ],
                              ),
                            ),
                          ),

                          /// CONTENT
                          Padding(
                            padding: const EdgeInsets.all(18),

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                /// BADGE
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 6,
                                  ),

                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFF005C),

                                    borderRadius: BorderRadius.circular(12),
                                  ),

                                  child: Text(
                                    'Terbaru',

                                    style: AppTextStyles.semiBold(
                                      AppTextStyles.body3,
                                    ).copyWith(color: Colors.white),
                                  ),
                                ),

                                const Spacer(),

                                /// TITLE
                                Text(
                                  latestNews['title'] as String,

                                  style: AppTextStyles.regular(
                                    AppTextStyles.h3,
                                  ).copyWith(color: Colors.white, height: 1.2),
                                ),

                                const SizedBox(height: 4),

                                /// DATE
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.calendar_today_rounded,
                                      size: 14,
                                      color: Colors.white,
                                    ),

                                    const SizedBox(width: 8),

                                    Text(
                                      latestNews['date'] as String,

                                      style: AppTextStyles.medium(
                                        AppTextStyles.body1,
                                      ).copyWith(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  /// GRID NEWS
                  GridView.builder(
                    shrinkWrap: true,

                    physics: const NeverScrollableScrollPhysics(),

                    itemCount: otherNews.length,

                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 1,
                        ),

                    itemBuilder: (context, index) {
                      final item = otherNews[index];

                      return GestureDetector(
                        onTap: () {
                          context.push(Routes.beritaDetail);
                        },

                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              /// IMAGE
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                ),

                                child: Image.asset(
                                  item['image'] as String,

                                  width: double.infinity,

                                  height: 64,

                                  fit: BoxFit.cover,
                                ),
                              ),

                              /// CONTENT
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 12,
                                  ),

                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,

                                    children: [
                                      /// TITLE
                                      Expanded(
                                        child: Text(
                                          item['title'] as String,

                                          maxLines: 3,

                                          overflow: TextOverflow.ellipsis,

                                          style:
                                              AppTextStyles.medium(
                                                AppTextStyles.body2,
                                              ).copyWith(
                                                color: AppColors.dark500,
                                                height: 1.3,
                                              ),
                                        ),
                                      ),

                                      const SizedBox(height: 4),

                                      /// DATE
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.calendar_today_rounded,
                                            size: 10,
                                            color: Color(0xFF27AE60),
                                          ),

                                          const SizedBox(width: 4),

                                          Expanded(
                                            child: Text(
                                              item['date'] as String,

                                              maxLines: 1,

                                              overflow: TextOverflow.ellipsis,

                                              style:
                                                  AppTextStyles.medium(
                                                    AppTextStyles.body3,
                                                  ).copyWith(
                                                    color: AppColors.dark300,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
