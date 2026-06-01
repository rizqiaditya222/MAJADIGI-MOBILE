import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/auth_header_widget.dart';
import '../../../core/widgets/primary_button.dart';

enum RiskLevel {
  rendah,
  sedang,
  tinggi,
}

class HasilSkriningEtibi extends StatefulWidget {
  final RiskLevel riskLevel;

  const HasilSkriningEtibi({
    super.key,
    this.riskLevel = RiskLevel.tinggi,
  });

  @override
  State<HasilSkriningEtibi> createState() =>
      _HasilSkriningEtibiState();
}

class _HasilSkriningEtibiState
    extends State<HasilSkriningEtibi> {
  RiskData get riskData {
    switch (widget.riskLevel) {
      case RiskLevel.rendah:
        return RiskData(
          label: 'Risiko Rendah',
          title: 'Risiko Anda : Rendah',
          description:
          'Gejala yang Anda alami masih minim dan belum mengarah kuat ke TBC.',
          description2:
          'Tetap jaga pola hidup sehat dan lakukan pemeriksaan apabila gejala muncul atau berlanjut.',
          badgeColor: const Color(0xFF27AE60),
          image:
          'lib/assets/images/etibi_background.png',
          buttonText: 'Selesai',
          suggestions: [
            'Terapkan pola hidup sehat dan seimbang',
            'Pastikan ventilasi rumah baik dan sinar matahari masuk',
            'Gunakan masker saat batuk atau pilek',
            'Periksa ke fasilitas kesehatan bila gejala berlanjut',
          ],
        );

      case RiskLevel.sedang:
        return RiskData(
          label: 'Risiko Sedang',
          title: 'Risiko Anda: Sedang',
          description:
          'Terdapat beberapa gejala yang perlu diperiksa lebih lanjut.',
          description2:
          'Disarankan untuk melakukan pemeriksaan di fasilitas kesehatan terdekat.',
          badgeColor: const Color(0xFFFFA91A),
          image:
          'lib/assets/images/etibi_background.png',
          buttonText: 'Selesai',
          suggestions: [
            'Lakukan pemeriksaan lebih lanjut',
            'Perhatikan kondisi tubuh secara berkala',
            'Jaga pola makan dan istirahat cukup',
            'Gunakan masker saat batuk',
          ],
        );

      case RiskLevel.tinggi:
        return RiskData(
          label: 'Risiko Tinggi',
          title: 'Risiko Anda: Tinggi',
          description:
          'Gejala yang Anda alami cukup mengarah pada TBC.',
          description2:
          'Segera lakukan pemeriksaan di fasilitas kesehatan untuk mendapatkan penanganan yang tepat.',
          badgeColor: const Color(0xFFFF0054),
          image:
          'lib/assets/images/etibi_background.png',
          buttonText:
          'Pilih Faskes Tujuan Anda',
          suggestions: [
            'Segera periksa ke fasilitas kesehatan',
            'Hindari kontak dekat sementara waktu',
            'Gunakan masker dan jaga kebersihan diri',
            'Periksa ke fasilitas kesehatan bila gejala berlanjut',
          ],
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = riskData;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          AuthHeaderWidget(
            imagePath:
            'lib/assets/images/etibi_background.png',
            showTitle: true,
            title: 'Hasil Skrining',
            onBackPressed: () {
              context.pop();
            },
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.circular(32),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 12),

                    Container(
                      width: 220,
                      height: 220,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: data.badgeColor
                            .withOpacity(0.15),
                      ),
                      child: Padding(
                        padding:
                        const EdgeInsets.all(34),
                        child: Image.asset(
                          data.image,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    const SizedBox(height: 28),

                    Container(
                      padding:
                      const EdgeInsets.symmetric(
                        horizontal: 36,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        color: data.badgeColor,
                        borderRadius:
                        BorderRadius.circular(
                          100,
                        ),
                      ),
                      child: Text(
                        data.label,
                        style:
                        AppTextStyles.bold(
                          AppTextStyles.body1,
                        ).copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),

                    Text(
                      data.title,
                      textAlign: TextAlign.center,
                      style:
                      AppTextStyles.bold(
                        AppTextStyles.h2,
                      ),
                    ),

                    const SizedBox(height: 20),

                    Text(
                      data.description,
                      textAlign: TextAlign.center,
                      style:
                      AppTextStyles.medium(
                        AppTextStyles.body1,
                      ),
                    ),

                    const SizedBox(height: 28),

                    Text(
                      data.description2,
                      textAlign: TextAlign.center,
                      style:
                      AppTextStyles.medium(
                        AppTextStyles.body1,
                      ),
                    ),

                    const SizedBox(height: 40),

                    _buildSuggestionCard(data),

                    const SizedBox(height: 36),

                    PrimaryButton(
                      label: data.buttonText,
                      backgroundColor:
                      data.badgeColor,
                      onPressed: () {
                        if (widget.riskLevel ==
                            RiskLevel.tinggi) {
                          context.push(
                            Routes.faskesEtibi,
                          );
                        } else {
                          context.go(
                            Routes.layananEtibi,
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuggestionCard(
      RiskData data,
      ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFEAF1FF),
        borderRadius:
        BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          Text(
            'Saran untuk anda',
            style:
            AppTextStyles.bold(
              AppTextStyles.h4,
            ).copyWith(
              color: AppColors.blue300,
            ),
          ),

          const SizedBox(height: 24),

          ...data.suggestions.map(
                (item) => Padding(
              padding:
              const EdgeInsets.only(
                bottom: 20,
              ),
              child: Row(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.health_and_safety,
                    size: 28,
                    color: Color(0xFF555555),
                  ),

                  const SizedBox(width: 16),

                  Expanded(
                    child: Text(
                      item,
                      style:
                      AppTextStyles.medium(
                        AppTextStyles.body1,
                      ).copyWith(
                        height: 1.6,
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
  }
}

class RiskData {
  final String label;
  final String title;
  final String description;
  final String description2;
  final Color badgeColor;
  final String image;
  final String buttonText;
  final List<String> suggestions;

  RiskData({
    required this.label,
    required this.title,
    required this.description,
    required this.description2,
    required this.badgeColor,
    required this.image,
    required this.buttonText,
    required this.suggestions,
  });
}