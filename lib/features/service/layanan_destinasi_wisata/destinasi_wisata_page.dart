import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:majadigi/core/router/app_router.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';
import 'package:majadigi/core/widgets/labeled_header.dart';

class DestinasiWisataPage extends StatefulWidget {
  const DestinasiWisataPage({super.key});

  @override
  State<DestinasiWisataPage> createState() =>
      _DestinasiWisataPage();
}

class _DestinasiWisataPage
    extends State<DestinasiWisataPage> {
  final TextEditingController searchController =
  TextEditingController();

  final List<Map<String, String>> populerList = [
    {
      'title': 'Mount Bromo',
      'location': 'Jawa Timur',
      'image': 'lib/assets/images/wisata_sample.png',
    },
    {
      'title': 'Kawah Ijen',
      'location': 'Banyuwangi',
      'image': 'lib/assets/images/wisata_sample.png',
    },
    {
      'title': 'Pantai Papuma',
      'location': 'Jember',
      'image': 'lib/assets/images/wisata_sample.png',
    },
  ];

  final List<Map<String, String>> wisataList = [
    {
      'title': 'Ranu Kumbolo',
      'location':
      'Lumajang, Jawa Timur, Indonesia raya tanah',
      'image': 'lib/assets/images/wisata_sample.png',
    },
    {
      'title': 'Bromo Tengger Semeru',
      'location': 'Probolinggo, Jawa Timur',
      'image': 'lib/assets/images/wisata_sample.png',
    },
    {
      'title': 'Air Terjun Madakaripura',
      'location': 'Probolinggo, Jawa Timur',
      'image': 'lib/assets/images/wisata_sample.png',
    },
    {
      'title': 'Pantai Papuma',
      'location': 'Jember, Jawa Timur',
      'image': 'lib/assets/images/wisata_sample.png',
    },
    {
      'title': 'Candi Borobudur',
      'location': 'Magelang, Jawa Tengah',
      'image': 'lib/assets/images/wisata_sample.png',
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
            title: 'Destinasi Wisata',
            description:
            'SIDITA merupakan media promosi dan informasi destinasi yang tersebar di Jawa Timur.',
            backgroundImage:
            'lib/assets/images/background_wisata.png',
            searchController: searchController,
            onBackPressed: () {
              Navigator.pop(context);
            },
            onBookmarkPressed: () {},
            showSearch: true,
          ),

          /// HORIZONTAL CARD
          SizedBox(
            height: 248,
            child: Container(
              width: double.infinity,
              color: AppColors.dark100,
              child: Align(
                alignment: Alignment.topLeft,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding:
                  const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  child: Row(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children:
                    wisataList.map((wisata) {
                      return Padding(
                        padding:
                        const EdgeInsets.only(
                          right: 12,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            context.push(
                              Routes
                                  .detailLayananDestinasiWisata,
                            );
                          },
                          child: Container(
                            width: 216,
                            height: 216,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.circular(
                                16,
                              ),
                            ),
                            child: Column(
                              mainAxisSize:
                              MainAxisSize.min,
                              crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,
                              children: [
                                /// IMAGE
                                Padding(
                                  padding:
                                  const EdgeInsets
                                      .all(8),
                                  child: ClipRRect(
                                    borderRadius:
                                    BorderRadius
                                        .circular(
                                      12,
                                    ),
                                    child: Image.asset(
                                      wisata['image']!,
                                      height: 108,
                                      width: double
                                          .infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),

                                /// CONTENT
                                Padding(
                                  padding:
                                  const EdgeInsets
                                      .symmetric(
                                    horizontal: 12,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,
                                    children: [
                                      /// TITLE
                                      Text(
                                        wisata[
                                        'title']!,
                                        style:
                                        AppTextStyles
                                            .semiBold(
                                          AppTextStyles
                                              .h3,
                                        ).copyWith(
                                          color:
                                          AppColors
                                              .dark500,
                                        ),
                                        maxLines: 2,
                                        overflow:
                                        TextOverflow
                                            .ellipsis,
                                      ),

                                      const SizedBox(
                                        height: 8,
                                      ),

                                      /// LOCATION
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons
                                                .location_on,
                                            color: Color(
                                              0xFFE67E00,
                                            ),
                                            size: 16,
                                          ),

                                          const SizedBox(
                                            width: 4,
                                          ),

                                          Expanded(
                                            child: Text(
                                              wisata[
                                              'location']!,
                                              style:
                                              AppTextStyles
                                                  .regular(
                                                AppTextStyles
                                                    .body2,
                                              ).copyWith(
                                                color:
                                                AppColors
                                                    .dark300,
                                              ),
                                              maxLines: 1,
                                              overflow:
                                              TextOverflow
                                                  .ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),

                                      const SizedBox(
                                        height: 16,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ),

          /// TITLE
          Padding(
            padding:
            const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Tempat Populer',
                    style:
                    AppTextStyles.regular(
                      AppTextStyles.h3,
                    ).copyWith(
                      color: AppColors.black,
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    context.push(Routes.listLayananDestinasiWisata);

                  },
                  child: Text(
                    'lihat semua',
                    style:
                    AppTextStyles.medium(
                      AppTextStyles.body1,
                    ).copyWith(
                      color: AppColors.blue300,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          /// LIST POPULER
          Expanded(
            child: ClipRRect(
              borderRadius:
              const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: ListView.builder(
                padding:
                const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                itemCount: populerList.length,
                itemBuilder:
                    (context, index) {
                  final wisata =
                  populerList[index];

                  return Padding(
                    padding:
                    const EdgeInsets.only(
                      bottom: 12,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        context.push(
                          Routes
                              .detailLayananDestinasiWisata,
                        );
                      },
                      child: Container(
                        padding:
                        const EdgeInsets.all(
                          8,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius:
                          BorderRadius.circular(
                            16,
                          ),
                        ),
                        child: Row(
                          children: [
                            /// IMAGE
                            ClipRRect(
                              borderRadius:
                              BorderRadius
                                  .circular(12),
                              child: Image.asset(
                                wisata['image']!,
                                width: 96,
                                height: 96,
                                fit: BoxFit.cover,
                              ),
                            ),

                            const SizedBox(
                              width: 16,
                            ),

                            /// CONTENT
                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment
                                    .start,
                                mainAxisAlignment:
                                MainAxisAlignment
                                    .center,
                                children: [
                                  Text(
                                    wisata['title']!,
                                    style:
                                    AppTextStyles
                                        .semiBold(
                                      AppTextStyles
                                          .h3,
                                    ).copyWith(
                                      color:
                                      AppColors
                                          .black,
                                    ),
                                    maxLines: 1,
                                    overflow:
                                    TextOverflow
                                        .ellipsis,
                                  ),

                                  const SizedBox(
                                    height: 8,
                                  ),

                                  Row(
                                    children: [
                                      const Icon(
                                        Icons
                                            .location_on,
                                        size: 18,
                                        color: Color(
                                          0xFFE67E00,
                                        ),
                                      ),

                                      const SizedBox(
                                        width: 6,
                                      ),

                                      Expanded(
                                        child: Text(
                                          wisata[
                                          'location']!,
                                          style:
                                          AppTextStyles
                                              .regular(
                                            AppTextStyles
                                                .body2,
                                          ).copyWith(
                                            color:
                                            AppColors
                                                .dark300,
                                          ),
                                          maxLines: 1,
                                          overflow:
                                          TextOverflow
                                              .ellipsis,
                                        ),
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
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}