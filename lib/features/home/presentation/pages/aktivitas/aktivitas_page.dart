import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';
import 'package:majadigi/core/widgets/auth_header_widget.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() =>
      _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {

  int selectedTab = 0;

  final List<Map<String, dynamic>> agendaItems = [
    {
      'title': 'Islamic Center',
      'category': 'Keagamaan',
      'image': 'lib/assets/images/jatim_icon.png',
      'status': 'Selesai',
    },
    {
      'title': 'Islamic Center',
      'category': 'Keagamaan',
      'image': 'lib/assets/images/jatim_icon.png',
      'status': 'Batal',
    },
    {
      'title': 'Islamic Center',
      'category': 'Keagamaan',
      'image': 'lib/assets/images/jatim_icon.png',
      'status': 'Berjalan',
    },
    {
      'title': 'Islamic Center',
      'category': 'Keagamaan',
      'image': 'lib/assets/images/jatim_icon.png',
      'status': 'Menunggu',
    },
  ];

  LinearGradient getStatusGradient(String status) {
    switch (status) {

      case 'Selesai':
        return const LinearGradient(
          colors: [
            Color(0xFF25AC63),
            Color(0xFF1E864D),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        );

      case 'Batal':
        return const LinearGradient(
          colors: [
            Color(0xFFFF0048),
            Color(0xFFBF0036),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        );

      case 'Berjalan':
        return const LinearGradient(
          colors: [
            Color(0xFF0065FF),
            Color(0xFF0090FF),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        );

      case 'Menunggu':
        return const LinearGradient(
          colors: [
            Color(0xFFFFA920),
            Color(0xFFE36A00),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        );

      default:
        return const LinearGradient(
          colors: [
            Colors.grey,
            Colors.black54,
          ],
        );
    }
  }

  @override
  Widget build(BuildContext context) {

    final filteredItems =
    selectedTab == 0
        ? agendaItems.where((item) =>
    item['status'] == 'Selesai' ||
        item['status'] == 'Batal').toList()
        : agendaItems.where((item) =>
    item['status'] == 'Berjalan' ||
        item['status'] == 'Menunggu').toList();

    return Scaffold(
      backgroundColor: AppColors.dark100,

      body: Column(
        children: [

          /// HEADER
          AuthHeaderWidget(
            imagePath:
            'lib/assets/images/wayang_image.png',

            showTitle: true,
            title: 'Aktivitas Anda',

            onBackPressed: () {
              context.pop();
            },

            showBackButton: false,
          ),

          /// TAB BAR
          Container(
            height: 68,
            decoration: const BoxDecoration(
              color: Colors.white,

              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),

            child: Row(
              children: [

                /// RIWAYAT
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTab = 0;
                      });
                    },

                    child: Column(
                      mainAxisAlignment:
                      MainAxisAlignment.center,

                      children: [

                        Text(
                          'Riwayat',

                          style:
                          AppTextStyles.medium(
                            AppTextStyles.h4,
                          ).copyWith(
                            color:
                            selectedTab == 0
                                ? AppColors.dark500
                                : AppColors.dark300,
                          ),
                        ),

                        const SizedBox(height: 12),

                        AnimatedContainer(
                          duration:
                          const Duration(
                            milliseconds: 200,
                          ),

                          height: 4,
                          width: 42,

                          decoration: BoxDecoration(
                            color:
                            selectedTab == 0
                                ? const Color(
                              0xFF25AC63,
                            )
                                : Colors.transparent,

                            borderRadius:
                            BorderRadius.circular(
                              999,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                /// BERJALAN
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTab = 1;
                      });
                    },

                    child: Column(
                      mainAxisAlignment:
                      MainAxisAlignment.center,

                      children: [

                        Text(
                          'Berjalan',

                          style:
                          AppTextStyles.medium(
                            AppTextStyles.h4,
                          ).copyWith(
                            color:
                            selectedTab == 1
                                ? AppColors.dark500
                                : AppColors.dark300,
                          ),
                        ),

                        const SizedBox(height: 12),

                        AnimatedContainer(
                          duration:
                          const Duration(
                            milliseconds: 200,
                          ),

                          height: 4,
                          width: 42,

                          decoration: BoxDecoration(
                            color:
                            selectedTab == 1
                                ? const Color(
                              0xFF25AC63,
                            )
                                : Colors.transparent,

                            borderRadius:
                            BorderRadius.circular(
                              999,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// CONTENT
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 24,
              ),

              child: Column(
                children: List.generate(
                  filteredItems.length,
                      (index) {

                    final item =
                    filteredItems[index];

                    return Padding(
                      padding:
                      const EdgeInsets.only(
                        bottom: 12,
                      ),

                      child: GestureDetector(
                        onTap: () {},

                        child: Container(
                          width: double.infinity,

                          padding:
                          const EdgeInsets.only(
                            bottom: 12,
                            right: 12,
                            top: 12,
                            left: 18,
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
                            crossAxisAlignment:
                            CrossAxisAlignment.center,

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

                                    /// CATEGORY
                                    Text(
                                      item['category']
                                      as String,

                                      style:
                                      AppTextStyles
                                          .medium(
                                        AppTextStyles
                                            .body3,
                                      ).copyWith(
                                        color:
                                        AppColors
                                            .blue300,
                                      ),
                                    ),

                                    const SizedBox(
                                      height: 2,
                                    ),

                                    /// TITLE
                                    Text(
                                      item['title']
                                      as String,

                                      style:
                                      AppTextStyles
                                          .medium(
                                        AppTextStyles
                                            .h4,
                                      ).copyWith(
                                        color:
                                        AppColors
                                            .dark500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(
                                width: 12,
                              ),

                              /// STATUS
                              SizedBox(
                                height: 70,

                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.end,

                                  crossAxisAlignment:
                                  CrossAxisAlignment.end,

                                  children: [

                                    Container(
                                      padding:
                                      const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 8,
                                      ),

                                      decoration:
                                      BoxDecoration(
                                        gradient:
                                        getStatusGradient(
                                          item['status'],
                                        ),

                                        borderRadius:
                                        BorderRadius.circular(
                                          999,
                                        ),
                                      ),

                                      child: Text(
                                        'Status : ${item['status']}',

                                        style:
                                        AppTextStyles
                                            .medium(
                                          AppTextStyles
                                              .body3,
                                        ).copyWith(
                                          color:
                                          Colors.white,
                                        ),
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