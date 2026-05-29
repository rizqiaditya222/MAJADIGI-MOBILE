import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:majadigi/core/router/app_router.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';
import 'package:majadigi/core/widgets/labeled_header.dart';

class IslamicCenterPage extends StatefulWidget {
  const IslamicCenterPage({super.key});

  @override
  State<IslamicCenterPage> createState() =>
      _IslamicCenterPage();
}

class _IslamicCenterPage
    extends State<IslamicCenterPage> {
  final TextEditingController searchController =
  TextEditingController();

  final List<Map<String, dynamic>> facilityList = [
    {
      'title': 'Aula',
      'image':
      'lib/assets/images/islamic_sample.png',
    },
    {
      'title': 'Asrama',
      'image':
      'lib/assets/images/islamic_sample.png',
    },
    {
      'title': 'Ruangan Masjid',
      'image':
      'lib/assets/images/islamic_sample.png',
    },
    {
      'title': 'Aula',
      'image':
      'lib/assets/images/islamic_sample.png',
    },
    {
      'title': 'Aula',
      'image':
      'lib/assets/images/islamic_sample.png',
    },
    {
      'title': 'Aula',
      'image':
      'lib/assets/images/islamic_sample.png',
    },
    {
      'title': 'Aula',
      'image':
      'lib/assets/images/islamic_sample.png',
    },
    {
      'title': 'Aula',
      'image':
      'lib/assets/images/islamic_sample.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark100,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          /// HEADER
          LabeledHeader(
            title: 'Islamic Center',
            description:
            'Pemesanan online fasilitas aula dan asrama di Islamic Centre Surabaya',
            backgroundImage:
            'lib/assets/images/islamic_background.png',
            searchController: searchController,
            onBackPressed: () {
              Navigator.pop(context);
            },
            onBookmarkPressed: () {},
            showSearch: false,
          ),

          /// CONTENT
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: facilityList.length,
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.9 ,
              ),
              itemBuilder: (context, index) {
                final item = facilityList[index];

                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                    BorderRadius.circular(22),
                    border: Border.all(
                      color: AppColors.dark150,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.center,
                    children: [
                      /// IMAGE
                      ClipRRect(
                        borderRadius:
                        const BorderRadius.only(
                          topLeft: Radius.circular(22),
                          topRight:
                          Radius.circular(22),
                        ),
                        child: Image.asset(
                          item['image'],
                          width: double.infinity,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                      ),

                      Expanded(
                        child: Padding(
                          padding:
                          const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 10,
                          ),
                          child: Column(
                            mainAxisAlignment:
                            MainAxisAlignment
                                .center,
                            children: [
                              /// TITLE
                              Text(
                                item['title'],
                                textAlign:
                                TextAlign.center,
                                style:
                                AppTextStyles
                                    .semiBold(
                                  AppTextStyles
                                      .body2,
                                ).copyWith(
                                  color:
                                  AppColors
                                      .dark500,
                                ),
                              ),

                              const SizedBox(
                                  height: 4),

                              /// DETAIL
                              GestureDetector(
                                onTap: () {
                                  context.push(
                                    Routes.detailLayananIslamicCenter,
                                  );
                                },
                                child: Text(
                                  'Lihat Detail',
                                  textAlign:
                                  TextAlign.center,
                                  style:
                                  AppTextStyles
                                      .bold(
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
                        ),
                      ),
                    ],
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