import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/auth_header_widget.dart';

class TentangMajadigiPage extends StatelessWidget {
  const TentangMajadigiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark100,
      body: SingleChildScrollView(
        child: Column(
          children: [
            AuthHeaderWidget(
              imagePath: 'lib/assets/images/wayang_image.png',
              showTitle: true,
              title: 'Tentang Majadigi',
              onBackPressed: () {
                context.pop();
              },
            ),

            Container(
              width: double.infinity,
              color: AppColors.white,
              padding: const EdgeInsets.symmetric(
                vertical: 32,
              ),
              child: Column(
                children: [
                  Image.asset(
                    'lib/assets/images/logo_majadigi.png',
                    width: 220,
                  ),

                  const SizedBox(height: 16),

                  Text(
                    'Vers 2.1.1',
                    style: AppTextStyles.regular(
                      AppTextStyles.body1,
                    ).copyWith(
                      color: AppColors.dark300,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(
                24,
                32,
                24,
                40,
              ),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sekilas Majadigi',
                    style: AppTextStyles.bold(
                      AppTextStyles.h2,
                    ).copyWith(
                      color: AppColors.black,
                    ),
                  ),

                  const SizedBox(height: 32),

                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      style: AppTextStyles.regular(
                        AppTextStyles.body1,
                      ).copyWith(
                        color: AppColors.dark400,
                        height: 1.8,
                      ),
                      children: [
                        TextSpan(
                          text: 'Majadigi',
                          style: AppTextStyles.bold(
                            AppTextStyles.body1,
                          ).copyWith(
                            color: AppColors.blue300,
                          ),
                        ),
                        const TextSpan(
                          text:
                          ' adalah platform layanan publik digital berbasis web dan mobile. Diluncurkan pada Oktober 2024, Majadigi menyajikan info penting dan akses ke layanan publik yang terintegrasi dengan pemerintah kabupaten/kota di Jawa Timur.',
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  _buildParagraph(
                    'Di Majadigi, kami mengembangkan integrasi layanan publik dengan sistem Single Sign-On (SSO). Pengguna bisa mengakses layanan publik dengan lebih praktis cukup dari satu aplikasi.',
                  ),

                  _buildParagraph(
                    'Dapatkan juga update seputar:',
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      bottom: 24,
                    ),
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        _buildListItem(
                          '1. Lowongan kerja & pelatihan',
                        ),
                        const SizedBox(height: 8),
                        _buildListItem(
                          '2. Fasilitas kesehatan',
                        ),
                        const SizedBox(height: 8),
                        _buildListItem(
                          '3. Harga sembako',
                        ),
                        const SizedBox(height: 8),
                        _buildListItem(
                          '4. Destinasi wisata',
                        ),
                        const SizedBox(height: 8),
                        _buildListItem(
                          '5. Event budaya, dan lainnya',
                        ),
                      ],
                    ),
                  ),

                  _buildParagraph(
                    'Ke depannya, Pemerintah Provinsi Jawa Timur berencana mengintegrasikan Majadigi dengan portal layanan nasional yang dikembangkan oleh Gov Tech Indonesia (INA Digital).',
                  ),

                  _buildParagraph(
                    'Majapahit Digital (Majadigi), layanan publik kini menjadi lebih mudah, cepat, dan praktis dalam satu aplikasi.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildParagraph(String text) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 24,
      ),
      child: Text(
        text,
        textAlign: TextAlign.justify,
        style: AppTextStyles.regular(
          AppTextStyles.body1,
        ).copyWith(
          color: AppColors.dark400,
          height: 1.8,
        ),
      ),
    );
  }

  Widget _buildListItem(String text) {
    return Text(
      text,
      style: AppTextStyles.regular(
        AppTextStyles.body1,
      ).copyWith(
        color: AppColors.dark400,
        height: 1.8,
      ),
    );
  }
}