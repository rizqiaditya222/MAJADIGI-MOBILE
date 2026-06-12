import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';
import 'package:majadigi/core/widgets/recommendation_card_widget.dart';

class LayananCepatKesehatanPage extends StatefulWidget {
  const LayananCepatKesehatanPage({super.key});

  @override
  State<LayananCepatKesehatanPage> createState() =>
      _LayananCepatKesehatanPageState();
}

class _LayananCepatKesehatanPageState
    extends State<LayananCepatKesehatanPage> {

  final List<Map<String, dynamic>> layananItems = [
    {
      'image':
      'lib/assets/images/banner_karsa.png',
      'subtitle': 'Kesehatan',
      'title': 'RSUD Karsa Husada',
      'description':
      'Layanan RSUD Karsa Husada Kota Batu',
    },
    {
      'image':
      'lib/assets/images/banner_daha.png',
      'subtitle': 'Kesehatan',
      'title': 'RSUD Daha Husada',
      'description':
      'Layanan RSUD Daha Husada Kota Kediri',
    },
    {
      'image':
      'lib/assets/images/banner_etibi.png',
      'subtitle': 'Kesehatan',
      'title': 'Skrining E-Tibi',
      'description':
      'Skrining Mandiri Tuberkolosis (TBC)',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark100,

      body: Column(
        children: [

          /// TOP IMAGE SECTION
          Stack(
            children: [

              /// IMAGE
              ClipRRect(
                borderRadius:
                const BorderRadius.only(
                  bottomLeft:
                  Radius.circular(28),
                  bottomRight:
                  Radius.circular(28),
                ),

                child: Image.asset(
                  'lib/assets/images/recommendation_kesehatan.png',

                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),

              /// BACK BUTTON
              Positioned(
                top: 48,
                left: 20,

                child: GestureDetector(
                  onTap: () {
                    context.pop();
                  },

                  child: Container(
                    width: 46,
                    height: 46,

                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,

                      boxShadow: [
                        BoxShadow(
                          color: Colors.black
                              .withOpacity(0.08),
                          blurRadius: 10,
                          offset:
                          const Offset(
                            0,
                            4,
                          ),
                        ),
                      ],
                    ),

                    child: const Icon(
                      Icons.arrow_back_rounded,
                      color:
                      AppColors.blue300,
                      size: 26,
                    ),
                  ),
                ),
              ),
            ],
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
                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  /// SUBTITLE
                  Text(
                    'Kesehatan Yang Utama',

                    style:
                    AppTextStyles.medium(
                      AppTextStyles.body1,
                    ).copyWith(
                      color:
                      AppColors.dark300,
                    ),
                  ),

                  const SizedBox(height: 6),

                  /// TITLE
                  Text(
                    'Cek Kesahatan Anda',

                    style:
                    AppTextStyles.semiBold(
                      AppTextStyles.h2,
                    ).copyWith(
                      color:
                      AppColors.dark500,
                    ),
                  ),

                  const SizedBox(height: 24),

                  /// LIST
                  Column(
                    children: List.generate(
                      layananItems.length,
                          (index) {
                        final item =
                        layananItems[index];

                        return Padding(
                          padding:
                          const EdgeInsets.only(
                            bottom: 12,
                          ),

                          child:
                          RecommendationCardWidget(
                            image:
                            item['image']
                            as String,

                            subtitle:
                            item['subtitle']
                            as String,

                            title:
                            item['title']
                            as String,

                            description:
                            item['description']
                            as String,

                            onTap: () {},
                          ),
                        );
                      },
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