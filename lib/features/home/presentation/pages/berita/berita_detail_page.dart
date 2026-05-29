import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';
import 'package:majadigi/core/widgets/auth_header_widget.dart';

class BeritaPageDetail extends StatefulWidget {
  const BeritaPageDetail({super.key});

  @override
  State<BeritaPageDetail> createState() =>
      _BeritaPageDetailState();
}

class _BeritaPageDetailState
    extends State<BeritaPageDetail> {

  final Map<String, dynamic> beritaDetail = {
    'title':
    'Gunung Raung Erupsi, Puluhan Pendaki Putar Balik',

    'date': 'Kamis, 01 Januari 2026',

    'image':
    'lib/assets/images/wisata_sample.png',

    'content':
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Arcu amet tempor, in massa, habitasse habitasse fermentum, sed faucibus. Augue arcu, ac proin accumsan urna morbi diam nunc, tincidunt. Ac turpis amet vitae dui aliquam vitae nunc. Non enim, lorem duis maecenas odio. Augue arcu, ac proin accumsan urna morbi diam nunc, tincidunt. Ac turpis amet vitae dui aliquam vitae nunc. Non enim, lorem duis maecenas odio.\n\n'
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Arcu amet tempor, in massa, habitasse habitasse fermentum, sed faucibus. Augue arcu, ac proin accumsan urna morbi diam nunc, tincidunt. Ac turpis amet vitae dui aliquam vitae nunc. Non enim, lorem duis maecenas odio. Augue arcu, ac proin accumsan urna morbi diam nunc, tincidunt. Ac turpis amet vitae dui aliquam vitae nunc. Non enim, lorem duis maecenas odio.',

    'source':
    'https://majadigi.jatimprov.go.id/',
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
            title: 'Berita Jawa Timur',

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
                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  /// TITLE
                  Text(
                    beritaDetail['title']
                    as String,

                    style:
                    AppTextStyles.bold(
                      AppTextStyles.h3,
                    ).copyWith(
                      color:
                      AppColors.dark500,
                      height: 1.2,
                    ),
                  ),

                  const SizedBox(height: 16),

                  /// DATE
                  Text(
                    beritaDetail['date']
                    as String,

                    style:
                    AppTextStyles.medium(
                      AppTextStyles.body1,
                    ).copyWith(
                      color:
                      AppColors.dark300,
                    ),
                  ),

                  const SizedBox(height: 24),

                  /// IMAGE
                  ClipRRect(
                    borderRadius:
                    BorderRadius.circular(
                      20,
                    ),

                    child: Image.asset(
                      beritaDetail['image']
                      as String,

                      width: double.infinity,
                      height: 180,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(height: 28),

                  /// CONTENT TEXT
                  Text(
                    beritaDetail['content']
                    as String,

                    style:
                    AppTextStyles.regular(
                      AppTextStyles.body2,
                    ).copyWith(
                      color:
                      AppColors.dark500,
                      height: 1.8,
                    ),
                    textAlign:
                    TextAlign.justify,
                  ),

                  const SizedBox(height: 36),

                  /// SOURCE TITLE
                  Text(
                    'Link Rujukkan',

                    style:
                    AppTextStyles.semiBold(
                      AppTextStyles.h3,
                    ).copyWith(
                      color:
                      AppColors.dark500,
                    ),
                  ),

                  const SizedBox(height: 8),

                  /// SOURCE LINK
                  Text(
                    beritaDetail['source']
                    as String,

                    style:
                    AppTextStyles.medium(
                      AppTextStyles.body2,
                    ).copyWith(
                      color:
                      AppColors.dark400,
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}