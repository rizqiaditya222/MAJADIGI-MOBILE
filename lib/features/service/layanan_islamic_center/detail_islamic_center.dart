import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:majadigi/core/router/app_router.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';
import 'package:majadigi/core/widgets/auth_header_widget.dart';
import 'package:majadigi/core/widgets/primary_button.dart';

import '../../../core/widgets/aula_card.dart';

class DetailIslamicCenter extends StatelessWidget {
  const DetailIslamicCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// IMAGE + HEADER
            Stack(
              children: [
                SizedBox(
                  height: 420,
                  width: double.infinity,
                  child: Image.asset(
                    'lib/assets/images/islamic_sample.png',
                    fit: BoxFit.cover,
                  ),
                ),

                Container(
                  height: 420,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.15),
                        Colors.transparent,
                        Colors.black.withOpacity(0.2),
                      ],
                    ),
                  ),
                ),

                AuthHeaderWidget(
                  imagePath:
                  'lib/assets/images/islamic_background.png',
                  onBackPressed: () {
                    context.pop();
                  },
                ),
              ],
            ),

            /// CONTENT CARD
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(
                24,
                24,
                24,
                32,
              ),
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// TITLE
                  Text(
                    'Hall Utama',
                    style: AppTextStyles.bold(
                      AppTextStyles.h2,
                    ).copyWith(
                      color: AppColors.black,
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// INFO SECTION
                  Row(
                    children: const [
                      Expanded(
                        child: InfoItem(
                          label: 'Kapasitas',
                          icon: Icons.people,
                          iconColor: Colors.blue,
                          value: '2000 Orang',
                        ),
                      ),

                      SizedBox(width: 24),

                      Expanded(
                        child: InfoItem(
                          label: 'Tarif mulai dari',
                          icon: Icons.payments,
                          iconColor: Colors.green,
                          value: 'Rp10.000.000',
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  const Divider(
                    thickness: 1,
                    color: Color(0xFFE5E5EA),
                  ),

                  const SizedBox(height: 28),

                  /// DESCRIPTION TITLE
                  Text(
                    'Description',
                    style: AppTextStyles.bold(
                      AppTextStyles.h3,
                    ),
                  ),

                  const SizedBox(height: 16),

                  /// DESCRIPTION CONTENT
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                        'Arcu amet tempor, in massa, habitasse habitasse fermentum, '
                        'sed faucibus. Augue arcu, ac proin accumsan urna morbi diam nunc, '
                        'tincidunt. Ac turpis amet vitae dui aliquam vitae nunc. '
                        'Non enim, lorem duis maecenas odio. Arcu amet tempor, in massa, '
                        'habitasse habitasse fermentum, sed faucibus. Augue arcu, '
                        'ac proin accumsan urna morbi diam nunc, tincidunt. '
                        'Ac turpis amet vitae dui aliquam vitae nunc. '
                        'Non enim, lorem duis maecenas.',
                    textAlign: TextAlign.justify,
                    style: AppTextStyles.regular(
                      AppTextStyles.body1,
                    ).copyWith(
                      color: AppColors.dark300,
                      height: 1.8,
                    ),
                  ),

                  const SizedBox(height: 40),

                  /// BUTTON
                  PrimaryButton(
                    label: 'Pesan',
                    onPressed: () {
                      context.push(Routes.pesananIslamicCenter);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
