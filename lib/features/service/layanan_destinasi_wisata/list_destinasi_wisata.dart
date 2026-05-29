import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:majadigi/core/router/app_router.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';
import 'package:majadigi/core/widgets/labeled_header.dart';

class ListDestinasiWisataPage extends StatefulWidget {
  const ListDestinasiWisataPage({super.key});

  @override
  State<ListDestinasiWisataPage> createState() =>
      _ListDestinasiWisataPage();
}

class _ListDestinasiWisataPage
    extends State<ListDestinasiWisataPage> {
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