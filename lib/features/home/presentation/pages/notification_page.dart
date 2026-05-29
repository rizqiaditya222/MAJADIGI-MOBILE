import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';
import 'package:majadigi/core/widgets/auth_header_widget.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() =>
      _NotificationPageState();
}

class _NotificationPageState
    extends State<NotificationPage> {

  final List<Map<String, dynamic>> agendaItems = [
    {
      'title': 'Bahana Bersahaja',
      'date':
      'Kamis, 01 Januari 2026 | 00:00 - 12:00',
      'location': 'Kabupaten Madiun',
      'image':
      'lib/assets/images/jatim_icon.png',
    },
    {
      'title': 'Festival Budaya Nusantara',
      'date':
      'Jumat, 02 Januari 2026 | 09:00 - 15:00',
      'location': 'Kota Surabaya',
      'image':
      'lib/assets/images/jatim_icon.png',
    },
    {
      'title': 'Jatim UMKM Expo 2026',
      'date':
      'Sabtu, 03 Januari 2026 | 08:00 - 18:00',
      'location': 'Kabupaten Malang',
      'image':
      'lib/assets/images/jatim_icon.png',
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
            'lib/assets/images/wayang_image.png',

            showTitle: true,
            title: 'Notifikasi',

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
                        onTap: () {},

                        child: Container(
                          width: double.infinity,

                          padding:
                          const EdgeInsets.all(
                            20,
                          ),

                          decoration: BoxDecoration(
                            color: Colors.white,

                            borderRadius:
                            BorderRadius.circular(
                              20,
                            ),

                            border: Border.all(
                              color: const Color(
                                0xFFEAEAEA,
                              ),
                            ),
                          ),

                          child: Row(
                            children: [

                              /// IMAGE
                              Image.asset(
                                item['image']
                                as String,
                                width: 42,
                                height: 42,
                                fit: BoxFit.contain,
                              ),

                              const SizedBox(
                                width: 12,
                              ),

                              /// CONTENT
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start,

                                  children: [

                                    /// DATE
                                    Row(
                                      children: [

                                        const Icon(
                                          Icons
                                              .calendar_today_rounded,
                                          size: 12,
                                          color:
                                          Color(
                                            0xFF27AE60,
                                          ),
                                        ),

                                        const SizedBox(
                                          width: 4,
                                        ),

                                        Expanded(
                                          child: Text(
                                            item['date']
                                            as String,

                                            maxLines:
                                            1,

                                            overflow:
                                            TextOverflow
                                                .ellipsis,

                                            style:
                                            AppTextStyles.medium(
                                              AppTextStyles
                                                  .body3,
                                            ).copyWith(
                                              color:
                                              AppColors
                                                  .dark300,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    const SizedBox(
                                      height: 6,
                                    ),

                                    /// TITLE
                                    Text(
                                      item['title']
                                      as String,

                                      style:
                                      AppTextStyles
                                          .medium(
                                        AppTextStyles
                                            .h3,
                                      ).copyWith(
                                        color:
                                        AppColors
                                            .dark500,
                                      ),
                                    ),

                                    const SizedBox(
                                      height: 6,
                                    ),

                                    /// LOCATION
                                    Text(
                                      item['location']
                                      as String,

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
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
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