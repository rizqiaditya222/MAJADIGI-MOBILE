import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';

import 'package:majadigi/core/widgets/auth_header_widget.dart';

import '../../../../../core/widgets/primary_button.dart';

class AgendaDetailPage extends StatefulWidget {
  const AgendaDetailPage({super.key});

  @override
  State<AgendaDetailPage> createState() =>
      _AgendaDetailPageState();
}

class _AgendaDetailPageState
    extends State<AgendaDetailPage> {

  final Map<String, dynamic> agendaDetail = {
    'title': 'Surabaya Great Expo 2026',

    'category':
    'Dinas Pariwisata, Pemuda & Olahraga',

    'location': 'Surabaya',

    'date': 'Senin, 01 Juni 2026',

    'time': '00:00 - 23:00',

    'description':
    'ajang pameran yang menghadirkan berbagai produk unggulan dari sektor industri, UMKM, ekonomi kreatif, dan inovasi teknologi. Event ini menjadi wadah strategis bagi pelaku usaha untuk mempromosikan produk, memperluas jaringan bisnis, serta membuka peluang kerja sama dengan berbagai pihak. Selain pameran, kegiatan ini juga diramaikan dengan talkshow, seminar, dan hiburan yang bertujuan untuk meningkatkan daya saing pelaku usaha lokal menuju pasar nasional dan global. ',

    'logo':
    'lib/assets/images/jatim_expo.png',

    'map':
    'lib/assets/images/wisata_sample.png',
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
            'lib/assets/images/wayang_image.png',

            showTitle: true,
            title: 'Detail Acara',

            onBackPressed: () {
              context.pop();
            },
          ),

          /// CONTENT
          Expanded(
            child: SingleChildScrollView(
              padding:
              const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 20,
              ),

              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  /// LOGO CARD
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(
                          agendaDetail['logo'] as String,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// LOCATION
                  Row(
                    children: [

                      const Icon(
                        Icons
                            .location_on_rounded,
                        size: 14,
                        color:
                        AppColors.blue300,
                      ),

                      const SizedBox(width: 4),

                      Text(
                        agendaDetail['location']
                        as String,

                        style:
                        AppTextStyles
                            .semiBold(
                          AppTextStyles
                              .body2,
                        ).copyWith(
                          color:
                          AppColors
                              .blue300,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  /// TITLE
                  Text(
                    agendaDetail['title']
                    as String,

                    style:
                    AppTextStyles.bold(
                      AppTextStyles.h2,
                    ).copyWith(
                      color:
                      AppColors.dark500,
                    ),
                  ),

                  const SizedBox(height: 10),

                  /// CATEGORY
                  Container(
                    padding:
                    const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),

                    decoration: BoxDecoration(
                      color: AppColors.dark150,

                      borderRadius:
                      BorderRadius.circular(
                        24,
                      ),
                    ),

                    child: Text(
                      agendaDetail['category']
                      as String,

                      style:
                      AppTextStyles.medium(
                        AppTextStyles.body4,
                      ).copyWith(
                        color:
                        AppColors.black,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// DATE & TIME
                  Row(
                    children: [

                      /// DATE
                      Expanded(
                        child: Row(
                          children: [

                            const Icon(
                              Icons
                                  .calendar_today_rounded,
                              size: 14,
                              color: Color(
                                0xFF27AE60,
                              ),
                            ),

                            const SizedBox(
                              width: 8,
                            ),

                            Expanded(
                              child: Text(
                                agendaDetail['date']
                                as String,

                                style:
                                AppTextStyles
                                    .semiBold(
                                  AppTextStyles
                                      .body1,
                                ).copyWith(
                                  color:
                                  const Color(
                                    0xFF27AE60,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 12),

                      /// TIME
                      Container(
                        padding:
                        const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),

                        decoration: BoxDecoration(
                          color: const Color(
                            0xFFFFE7EF,
                          ),

                          borderRadius:
                          BorderRadius.circular(
                            24,
                          ),
                        ),

                        child: Text(
                          agendaDetail['time']
                          as String,

                          style:
                          AppTextStyles
                              .semiBold(
                            AppTextStyles
                                .body2,
                          ).copyWith(
                            color:
                            const Color(
                              0xFFFF4B7B,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// DESCRIPTION
                  Text(
                    agendaDetail['description']
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

                  const SizedBox(height: 24),

                  // /// MAP
                  // ClipRRect(
                  //   borderRadius:
                  //   BorderRadius.circular(
                  //     20,
                  //   ),
                  //
                  //   child: Image.asset(
                  //     agendaDetail['map']
                  //     as String,
                  //
                  //     width: double.infinity,
                  //     height: 220,
                  //     fit: BoxFit.cover,
                  //   ),
                  // ),
                  //
                  // const SizedBox(height: 28),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}