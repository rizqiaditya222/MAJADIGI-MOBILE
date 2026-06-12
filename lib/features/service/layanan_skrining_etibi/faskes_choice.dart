import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:majadigi/core/router/app_router.dart';

import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/auth_header_widget.dart';
import '../../../core/widgets/primary_button.dart';

class FaskesChoicePage extends StatelessWidget {
  const FaskesChoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          AuthHeaderWidget(
            imagePath:
            'lib/assets/images/etibi_background.png',
            showTitle: false,
            onBackPressed: () {
              context.pop();
            },
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 24,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 24),

                  Text(
                    'Hai Andrian Faikha Ilham!',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.semiBold(
                      AppTextStyles.body1,
                    ).copyWith(
                      color: const Color(0xFF555555),
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    'Silakan datang ke faskes\nyang sudah Anda pilih.',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.bold(
                      AppTextStyles.h2,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    'Anda juga dapat melakukan pemeriksaan lebih\nlanjut untuk memastikan kondisi kesehatan Anda.',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.medium(
                      AppTextStyles.body2,
                    ).copyWith(
                      color: const Color(0xFF8E8E8E),
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 32),

                  Container(
                    width: 230,
                    height: 230,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFEAF1FF),
                    ),
                    padding: const EdgeInsets.all(18),
                    child: Image.asset(
                      'lib/assets/images/faskes_choice.png',
                      fit: BoxFit.contain,
                    ),
                  ),

                  const SizedBox(height: 28),

                  _buildSelectedFaskesCard(),

                  const SizedBox(height: 24),

                  PrimaryButton(
                    label: 'Selesai',
                    onPressed: () {
                      context.go(Routes.layananEtibi);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectedFaskesCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFEAEAEA),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFFFE5EE),
            ),
            child: const Icon(
              Icons.local_hospital,
              color: Color(0xFFFF0054),
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(
                  'PUSKESMAS\nKEDUNGKANDANG',
                  style: AppTextStyles.bold(
                    AppTextStyles.body1,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  'Kota Malang',
                  style: AppTextStyles.medium(
                    AppTextStyles.body3,
                  ).copyWith(
                    color: const Color(0xFF9A9A9A),
                  ),
                ),

                Text(
                  'Telp : -',
                  style: AppTextStyles.medium(
                    AppTextStyles.body3,
                  ).copyWith(
                    color: const Color(0xFF9A9A9A),
                  ),
                ),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFF8EB9FF),
              borderRadius:
              BorderRadius.circular(100),
            ),
            child: Text(
              'Terpilih',
              style: AppTextStyles.medium(
                AppTextStyles.body3,
              ).copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}