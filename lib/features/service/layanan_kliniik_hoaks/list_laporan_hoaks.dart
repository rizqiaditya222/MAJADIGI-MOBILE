import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:majadigi/core/router/app_router.dart';

import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';
import 'package:majadigi/core/widgets/auth_header_widget.dart';

class ListLaporanHoaks extends StatefulWidget {
  const ListLaporanHoaks({super.key});

  @override
  State<ListLaporanHoaks> createState() =>
      _ListLaporanHoaksState();
}

class _ListLaporanHoaksState
    extends State<ListLaporanHoaks> {

  final List<Map<String, dynamic>> agendaItems = [
    {
      'title':
      'Donald Trump Singgung Sunni dan Syiah di Indonesia terkait Dukungan ke Iran',
      'date': '17 April 2026',
      'image':
      'lib/assets/images/hoaks_background.png',
      'status': 'HOAKS',
    },
    {
      'title':
      'Donald Trump Singgung Sunni dan Syiah di Indonesia terkait Dukungan ke Iran',
      'date': '17 April 2026',
      'image':
      'lib/assets/images/hoaks_background.png',
      'status': 'HOAKS',
    },
    {
      'title':
      'Donald Trump Singgung Sunni dan Syiah di Indonesia terkait Dukungan ke Iran',
      'date': '17 April 2026',
      'image':
      'lib/assets/images/hoaks_background.png',
      'status': 'HOAKS',
    },    {
      'title':
      'Donald Trump Singgung Sunni dan Syiah di Indonesia terkait Dukungan ke Iran',
      'date': '17 April 2026',
      'image':
      'lib/assets/images/hoaks_background.png',
      'status': 'HOAKS',
    },    {
      'title':
      'Donald Trump Singgung Sunni dan Syiah di Indonesia terkait Dukungan ke Iran',
      'date': '17 April 2026',
      'image':
      'lib/assets/images/hoaks_background.png',
      'status': 'HOAKS',
    },
  ];

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
              padding:
              const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 24,
              ),

              child: Column(
                children: List.generate(
                  agendaItems.length,
                      (index) {
                    final item =
                    agendaItems[index];

                    return Padding(
                      padding:
                      const EdgeInsets.only(
                        bottom: 8,
                      ),

                      child: GestureDetector(
                        onTap: () {
                          context.push(Routes.detailLaporanHoaks);
                        },
                        child: Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(
                            bottom: 20,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                            BorderRadius.circular(24),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(
                                  0.04,
                                ),
                                blurRadius: 12,
                                offset: const Offset(
                                  0,
                                  4,
                                ),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              /// IMAGE
                              ClipRRect(
                                borderRadius:
                                const BorderRadius.only(
                                  topLeft: Radius.circular(24),
                                  topRight:
                                  Radius.circular(24),
                                ),
                                child: Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Image.asset(
                                      'lib/assets/images/hoaks_background.png',
                                      width: double.infinity,
                                      height: 140,
                                      fit: BoxFit.cover,
                                    ),

                                    Positioned(
                                      top: 12,
                                      child: Container(
                                        padding:
                                        const EdgeInsets.symmetric(
                                          horizontal: 18,
                                          vertical: 6,
                                        ),
                                        decoration:
                                        BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(
                                            20,
                                          ),
                                          gradient:
                                          const LinearGradient(
                                            colors: [
                                              Color(
                                                0xFFE60000,
                                              ),
                                              Color(
                                                0xFF8B0000,
                                              ),
                                            ],
                                          ),
                                        ),
                                        child: const Text(
                                          'HOAX',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight:
                                            FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Padding(
                                padding:
                                const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    /// DATE
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.calendar_today,
                                          size: 14,
                                          color:
                                          Color(0xFF27AE60),
                                        ),

                                        const SizedBox(
                                          width: 6,
                                        ),

                                        Text(
                                          '17 April 2026',
                                          style: AppTextStyles
                                              .medium(
                                            AppTextStyles.body2,
                                          ).copyWith(
                                            color:
                                            AppColors.dark300,
                                          ),
                                        ),

                                        const SizedBox(
                                          width: 4,
                                        ),

                                        Text(
                                          'HOAKS',
                                          style: AppTextStyles
                                              .semiBold(
                                            AppTextStyles.body2,
                                          ).copyWith(
                                            color:
                                            const Color(
                                              0xFFE60000,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    const SizedBox(
                                      height: 12,
                                    ),

                                    /// TITLE
                                    Text(
                                      'Donald Trump Singgung Sunni dan Syiah di Indonesia terkait Dukungan ke Iran',
                                      style: AppTextStyles
                                          .medium(
                                        AppTextStyles.h3,
                                      ).copyWith(
                                        color:
                                        AppColors.dark500,
                                        height: 1.4,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}