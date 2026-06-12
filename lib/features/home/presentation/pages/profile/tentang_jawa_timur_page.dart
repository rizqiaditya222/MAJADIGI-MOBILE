import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/auth_header_widget.dart';

class TentangJawaTimurPage extends StatelessWidget {
  const TentangJawaTimurPage({super.key});

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
              title: 'Tentang Jawa Timur',
              onBackPressed: () {
                context.pop();
              },
            ),

            /// IMAGE
            SizedBox(
              width: double.infinity,
              height: 280,
              child: Image.asset(
                'lib/assets/images/mountain_image.png',
                fit: BoxFit.cover,
              ),
            ),

            /// CONTENT
            Padding(
              padding: const EdgeInsets.fromLTRB(
                24,
                32,
                24,
                40,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sekilas Profil Jawa Timur',
                    style: AppTextStyles.bold(
                      AppTextStyles.h2,
                    ).copyWith(
                      color: AppColors.black,
                    ),
                  ),

                  const SizedBox(height: 32),

                  _buildParagraph(
                    'Terletak di ujung timur Pulau Jawa, Provinsi Jawa Timur secara administratif terdiri dari 29 kabupaten dan 9 kota. Melansir laman BPS tahun 2023, luas wilayah Jawa Timur sekitar 48.036,84 km². Jawa Timur menjadi wilayah dengan jumlah penduduk terbanyak di Indonesia, populasinya lebih dari 40 juta jiwa.',
                  ),

                  _buildParagraph(
                    'Provinsi Jatim memiliki peran strategis dalam lanskap nasional dari berbagai aspek seperti demografi, ekonomi, industri, infrastruktur, politik, dan budaya. Jatim tercatat sebagai destinasi utama investasi terbesar di tingkat nasional pada tahun 2022. Di tahun berikutnya, tren investasi di Jatim tumbuh 50,2% pada triwulan III 2023. Posisi ini menempatkan Jatim di urutan ketiga nasional setelah DKI Jakarta dan Jawa Barat.',
                  ),

                  _buildParagraph(
                    'Jatim tumbuh dalam lingkungan multikultural. Budayawan Universitas Jember, Ayu Sutarto (2004), membagi Jatim menjadi sepuluh tanah atau kawasan budaya.',
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
                          '1. Kawasan budaya besar terdiri dari Mataraman, Arek, Madura Pulau, dan Pandalungan.',
                        ),

                        const SizedBox(height: 8),

                        _buildListItem(
                          '2. Tlatah kebudayaan kecil terdiri dari Jawa Panaragan, Osing, Tengger, Madura Bawean, Madura Kangean, dan Samin.',
                        ),
                      ],
                    ),
                  ),

                  _buildParagraph(
                    'Lebih dari sekadar seni dan tradisi, masyarakat Jatim menjunjung tinggi nilai kebajikan. Nilai ini tercermin dalam moto Jer Basuki Mawa Beya, yang berarti bahwa setiap keberhasilan membutuhkan pengorbanan. Prinsip ini menjadi landasan semangat dan ketangguhan rakyat Jawa Timur dalam menghadapi berbagai rintangan.',
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
      padding: const EdgeInsets.only(bottom: 24),
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
      textAlign: TextAlign.justify,
      style: AppTextStyles.regular(
        AppTextStyles.body1,
      ).copyWith(
        color: AppColors.dark400,
        height: 1.8,
      ),
    );
  }
}