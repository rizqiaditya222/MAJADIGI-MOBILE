import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:majadigi/core/router/app_router.dart';

import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';
import 'package:majadigi/core/widgets/auth_header_widget.dart';

class RiwayatSkrining extends StatefulWidget {
  const RiwayatSkrining({super.key});

  @override
  State<RiwayatSkrining> createState() =>
      _RiwayatSkriningState();
}

class _RiwayatSkriningState
    extends State<RiwayatSkrining> {
  final List<Map<String, dynamic>> skriningItems = [
    {
      'date': '15 Mei 2025',
      'time': '14.30',
      'risk': 'Risiko Rendah',
      'facility': null,
      'color': const Color(0xFF27AE60),
      'image':
      'lib/assets/images/etibi_background.png',
    },
    {
      'date': '15 Mei 2025',
      'time': '14.30',
      'risk': 'Risiko Sedang',
      'facility': null,
      'color': const Color(0xFFFFA91A),
      'image':
      'lib/assets/images/etibi_background.png',
    },
    {
      'date': '15 Mei 2025',
      'time': '14.30',
      'risk': 'Risiko Tinggi',
      'facility': 'PUSKESMAS ARJOWINANGUN',
      'color': const Color(0xFFFF0054),
      'image':
      'lib/assets/images/etibi_background.png',
    },
    {
      'date': '15 Mei 2025',
      'time': '14.30',
      'risk': 'Risiko Tinggi',
      'facility': 'PUSKESMAS ARJOWINANGUN',
      'color': const Color(0xFFFF0054),
      'image':
      'lib/assets/images/etibi_background.png',
    },
    {
      'date': '15 Mei 2025',
      'time': '14.30',
      'risk': 'Risiko Rendah',
      'facility': null,
      'color': const Color(0xFF27AE60),
      'image':
      'lib/assets/images/etibi_background.png',
    },
    {
      'date': '15 Mei 2025',
      'time': '14.30',
      'risk': 'Risiko Sedang',
      'facility': null,
      'color': const Color(0xFFFFA91A),
      'image':
      'lib/assets/images/etibi_background.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark100,
      body: Column(
        children: [
          AuthHeaderWidget(
            imagePath:
            'lib/assets/images/etibi_background.png',
            showTitle: true,
            title: 'Riwayat Skrining',
            onBackPressed: () {
              context.pop();
            },
          ),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 24,
              ),
              itemCount: skriningItems.length,
              itemBuilder: (context, index) {
                final item = skriningItems[index];

                return Padding(
                  padding:
                  const EdgeInsets.only(bottom: 12),
                  child: GestureDetector(
                    onTap: () {
                      context.push(Routes.detailSkriningEtibi);
                    },
                    child: Container(
                      padding:
                      const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.circular(24),
                        border: Border.all(
                          color:
                          const Color(0xFFEAEAEA),
                        ),
                      ),
                      child: Row(
                        children: [
                          /// IMAGE
                          Container(
                            width: 64,
                            height: 64,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                              (item['color'] as Color)
                                  .withOpacity(
                                0.15,
                              ),
                            ),
                            child: Padding(
                              padding:
                              const EdgeInsets.all(
                                8,
                              ),
                              child: Image.asset(
                                item['image'],
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),

                          const SizedBox(width: 16),

                          /// CONTENT
                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      item['date'],
                                      style:
                                      AppTextStyles
                                          .medium(
                                        AppTextStyles
                                            .body3,
                                      ).copyWith(
                                        color:
                                        AppColors
                                            .dark300,
                                      ),
                                    ),

                                    const Padding(
                                      padding:
                                      EdgeInsets
                                          .symmetric(
                                        horizontal:
                                        8,
                                      ),
                                      child: Text(
                                        '•',
                                        style:
                                        TextStyle(
                                          color: Color(
                                            0xFFBDBDBD,
                                          ),
                                        ),
                                      ),
                                    ),

                                    Text(
                                      item['time'],
                                      style:
                                      AppTextStyles
                                          .medium(
                                        AppTextStyles
                                            .body3,
                                      ).copyWith(
                                        color:
                                        AppColors
                                            .dark300,
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(
                                  height: 4,
                                ),

                                Text(
                                  item['risk'],
                                  style:
                                  AppTextStyles
                                      .bold(
                                    AppTextStyles.h3,
                                  ).copyWith(
                                    color:
                                    item['color'],
                                  ),
                                ),

                                if (item['facility'] !=
                                    null) ...[
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    item['facility'],
                                    style:
                                    AppTextStyles
                                        .medium(
                                      AppTextStyles
                                          .body3,
                                    ).copyWith(
                                      color:
                                      const Color(
                                        0xFF9A9A9A,
                                      ),
                                      letterSpacing:
                                      0.2,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),

                          const Icon(
                            Icons
                                .chevron_right_rounded,
                            size: 32,
                            color:
                            Color(0xFF9A9A9A),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}