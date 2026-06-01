import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';
import 'package:majadigi/core/widgets/auth_header_widget.dart';

class DetailRoutePage extends StatelessWidget {
  const DetailRoutePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> halteList = [
      'Halte Terminal Porong',
      'Halte Gedang',
      'Halte Tanggulangin',
      'Halte Keramean',
      'Halte Terminal Larangan',
      'Halte Waru',
      'Halte Purabaya',
      'Halte Joyoboyo',
      'Halte Rajawali',
      'Halte Terminal Gresik',
    ];

    return Scaffold(
      backgroundColor: AppColors.dark100,
      body: Column(
        children: [
          /// HEADER
          AuthHeaderWidget(
            imagePath:
            'lib/assets/images/transjatim_background.png',
            onBackPressed: () {
              context.pop();
            },
            showTitle: true,
            title: 'Detail Rute',
          ),

          /// CONTENT
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  /// MAP
                  ClipRRect(
                    borderRadius:
                    BorderRadius.circular(24),
                    child: Image.asset(
                      'lib/assets/images/wisata_sample.png',
                      width: double.infinity,
                      height: 320,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(height: 16),

                  /// ROUTE CARD
                  /// ROUTE CARD
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: const Color(0xFFE5E7EB),
                      ),
                    ),
                    child: Column(
                      children: [
                        /// TOP INFO
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFF27AE60),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                'JTM1',
                                style: AppTextStyles.bold(
                                  AppTextStyles.body3,
                                ).copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),

                            const SizedBox(width: 10),

                            const Icon(
                              Icons.access_time_filled,
                              color: Color(0xFFFF2D55),
                              size: 16,
                            ),

                            const SizedBox(width: 4),

                            Text(
                              '05:00 - 21:00',
                              style: AppTextStyles.semiBold(
                                AppTextStyles.body3,
                              ).copyWith(
                                color: const Color(0xFFFF2D55),
                              ),
                            ),

                            const Spacer(),

                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: const Color(0xFF27AE60),
                                ),
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons
                                        .payments_outlined,
                                    color: Color(
                                      0xFF27AE60,
                                    ),
                                    size: 20,
                                  ),

                                  const SizedBox(width: 8),

                                  Text(
                                    '20.000',
                                    style:
                                    AppTextStyles.bold(
                                      AppTextStyles.body2,
                                    ).copyWith(
                                      color: const Color(
                                        0xFF27AE60,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 14),

                        /// ROUTE
                        SizedBox(
                          height: 110,
                          child: Stack(
                            alignment: Alignment.centerRight,
                            children: [
                              Row(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  /// LINE
                                  Padding(
                                    padding:
                                    const EdgeInsets.only(
                                      top: 10,
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 10,
                                          height: 10,
                                          decoration:
                                          BoxDecoration(
                                            color: Colors.white,
                                            shape:
                                            BoxShape.circle,
                                            border: Border.all(
                                              color:
                                              AppColors
                                                  .blue300,
                                              width: 2,
                                            ),
                                          ),
                                        ),

                                        Container(
                                          width: 2,
                                          height: 38,
                                          decoration:
                                          BoxDecoration(
                                            border: Border(
                                              left: BorderSide(
                                                color:
                                                AppColors
                                                    .blue200,
                                                width: 2,
                                              ),
                                            ),
                                          ),
                                        ),

                                        Container(
                                          width: 10,
                                          height: 10,
                                          decoration:
                                          BoxDecoration(
                                            color: Colors.white,
                                            shape:
                                            BoxShape.circle,
                                            border: Border.all(
                                              color:
                                              AppColors
                                                  .blue300,
                                              width: 2,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(width: 12),

                                  /// DESTINATION
                                  Expanded(
                                    child: Column(
                                      mainAxisSize:
                                      MainAxisSize.min,
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          padding:
                                          const EdgeInsets
                                              .symmetric(
                                            horizontal: 14,
                                            vertical: 10,
                                          ),
                                          decoration:
                                          BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                            BorderRadius
                                                .circular(
                                              10,
                                            ),
                                            border: Border.all(
                                              color:
                                              const Color(
                                                0xFFD9D9D9,
                                              ),
                                            ),
                                          ),
                                          child: Text(
                                            'Sidoarjo via Surabaya',
                                            maxLines: 1,
                                            overflow:
                                            TextOverflow
                                                .ellipsis,
                                            style:
                                            AppTextStyles
                                                .medium(
                                              AppTextStyles
                                                  .body2,
                                            ),
                                          ),
                                        ),

                                        const SizedBox(
                                          height: 14,
                                        ),

                                        Container(
                                          width: double.infinity,
                                          padding:
                                          const EdgeInsets
                                              .symmetric(
                                            horizontal: 14,
                                            vertical: 10,
                                          ),
                                          decoration:
                                          BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                            BorderRadius
                                                .circular(
                                              10,
                                            ),
                                            border: Border.all(
                                              color:
                                              const Color(
                                                0xFFD9D9D9,
                                              ),
                                            ),
                                          ),
                                          child: Text(
                                            'Gresik',
                                            maxLines: 1,
                                            overflow:
                                            TextOverflow
                                                .ellipsis,
                                            style:
                                            AppTextStyles
                                                .medium(
                                              AppTextStyles
                                                  .body2,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(width: 30),
                                ],
                              ),

                              /// ARROW BUTTON
                              Positioned(
                                right: 0,
                                child: Container(
                                  width: 46,
                                  height: 46,
                                  decoration:
                                  const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:
                                    AppColors.blue300,
                                  ),
                                  child: const Icon(
                                    Icons.arrow_forward_rounded,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  /// HALTE LIST
                  Container(
                    width: double.infinity,
                    height: 220,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.circular(24),
                      border: Border.all(
                        color: AppColors.dark150,
                      ),
                    ),
                    child: Scrollbar(
                      thumbVisibility: true,
                      child: ListView.separated(
                        itemCount: halteList.length,
                        separatorBuilder:
                            (_, __) =>
                        const SizedBox(
                          height: 12,
                        ),
                        itemBuilder: (context, index) {
                          return Row(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: 10,
                                    height: 10,
                                    decoration:
                                    const BoxDecoration(
                                      color: Color(
                                        0xFF27AE60,
                                      ),
                                      shape:
                                      BoxShape.circle,
                                    ),
                                  ),

                                  if (index !=
                                      halteList.length -
                                          1)
                                    Container(
                                      width: 2,
                                      height: 24,
                                      color:
                                      const Color(
                                        0xFF27AE60,
                                      ),
                                    ),
                                ],
                              ),

                              const SizedBox(width: 12),

                              Expanded(
                                child: Text(
                                  halteList[index],
                                  style:
                                  AppTextStyles
                                      .medium(
                                    AppTextStyles
                                        .body2,
                                  ).copyWith(
                                    color: AppColors
                                        .dark500,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
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