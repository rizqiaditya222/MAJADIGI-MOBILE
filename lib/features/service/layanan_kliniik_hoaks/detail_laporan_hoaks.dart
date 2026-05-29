import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';
import 'package:majadigi/core/widgets/auth_header_widget.dart';

class DetailLaporanHoaks extends StatefulWidget {
  const DetailLaporanHoaks({super.key});

  @override
  State<DetailLaporanHoaks> createState() =>
      _DetailLaporanHoaksState();
}

class _DetailLaporanHoaksState
    extends State<DetailLaporanHoaks> {
  final Map<String, dynamic> beritaDetail = {
    'title':
    'Donald Trump Singgung Sunni dan Syiah di Indonesia terkait Dukungan ke Iran',

    'date': '17 April 2026',

    'image':
    'lib/assets/images/hoaks_background.png',

    'content':
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Arcu amet tempor, in massa, habitasse habitasse fermentum sed faucibus. Augue arcu, ac proin accumsan urna morbi diam nunc, tincidunt. Ac turpis amet vitae dui aliquam vitae nunc. Non enim, lorem duis maecenas odio.\n\n'
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Arcu amet tempor, in massa, habitasse habitasse fermentum sed faucibus. Augue arcu, ac proin accumsan urna morbi diam nunc, tincidunt. Ac turpis amet vitae dui aliquam vitae nunc. Non enim, lorem duis maecenas odio.\n\n'
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Arcu amet tempor, in massa, habitasse habitasse fermentum sed faucibus. Augue arcu, ac proin accumsan urna morbi diam nunc, tincidunt. Ac turpis amet vitae dui aliquam vitae nunc. Non enim, lorem duis maecenas odio.',

    'source':
    'https://majadigi.jatimprov.go.id/',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark100,
      body: Column(
        children: [
          /// HEADER
          AuthHeaderWidget(
            imagePath:
            'lib/assets/images/hoaks_background.png',
            showTitle: true,
            title: 'Laporan Terkini',
            onBackPressed: () {
              context.pop();
            },
          ),

          /// CONTENT
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(
                18,
                20,
                18,
                32,
              ),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  /// JUDUL
                  Text(
                    beritaDetail['title']
                    as String,
                    style:
                    AppTextStyles.semiBold(
                      AppTextStyles.h3,
                    ).copyWith(
                      color:
                      AppColors.dark500,
                      height: 1.3,
                    ),
                  ),

                  const SizedBox(height: 12),

                  /// TANGGAL + STATUS
                  Row(
                    children: [
                      const Icon(
                        Icons
                            .calendar_today_rounded,
                        size: 14,
                        color:
                        Color(0xFF27AE60),
                      ),

                      const SizedBox(width: 6),

                      Text(
                        beritaDetail['date']
                        as String,
                        style:
                        AppTextStyles
                            .medium(
                          AppTextStyles
                              .body2,
                        ).copyWith(
                          color:
                          AppColors
                              .dark300,
                        ),
                      ),

                      const SizedBox(width: 6),

                      Text(
                        'HOAKS',
                        style:
                        AppTextStyles
                            .semiBold(
                          AppTextStyles
                              .body2,
                        ).copyWith(
                          color:
                          const Color(
                            0xFFE60000,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// POSTER HOAKS
                  ClipRRect(
                    borderRadius:
                    BorderRadius.circular(
                      16,
                    ),
                    child: Image.asset(
                      beritaDetail['image']
                      as String,
                      width:
                      double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(height: 24),

                  /// ISI ARTIKEL
                  Text(
                    beritaDetail['content']
                    as String,
                    textAlign:
                    TextAlign.justify,
                    style:
                    AppTextStyles.regular(
                      AppTextStyles.body2,
                    ).copyWith(
                      color:
                      AppColors.dark500,
                      height: 1.8,
                    ),
                  ),

                  const SizedBox(height: 32),

                  /// LINK RUJUKAN
                  Text(
                    'Link Rujukkan',
                    style:
                    AppTextStyles.semiBold(
                      AppTextStyles.h3,
                    ).copyWith(
                      color:
                      AppColors.dark500,
                    ),
                  ),

                  const SizedBox(height: 8),

                  SelectableText(
                    beritaDetail['source']
                    as String,
                    style:
                    AppTextStyles.medium(
                      AppTextStyles.body2,
                    ).copyWith(
                      color:
                      AppColors.dark400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}