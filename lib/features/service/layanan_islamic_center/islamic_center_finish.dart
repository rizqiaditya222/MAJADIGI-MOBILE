import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:majadigi/core/router/app_router.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';
import 'package:majadigi/core/widgets/auth_header_widget.dart';
import 'package:majadigi/core/widgets/primary_button.dart';

class IslamicCenterFinish extends StatefulWidget {
  const IslamicCenterFinish({super.key});

  @override
  State<IslamicCenterFinish> createState() =>
      _IslamicCenterFinishState();
}

class _IslamicCenterFinishState
    extends State<IslamicCenterFinish> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark100,
      body: Column(
        children: [
          AuthHeaderWidget(
            imagePath: 'lib/assets/images/islamic_background.png',
            showTitle: true,
            title: 'Aula',
            onBackPressed: () {
              context.pop();
            },
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 28,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// IMAGE
                  Image.asset(
                    'lib/assets/images/islamic_char.png',
                    height: 220,
                    fit: BoxFit.contain,
                  ),

                  const SizedBox(height: 32),

                  /// TITLE
                  Text(
                    'Selamat, Proses\nPemesananmu Berhasil!',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.bold(
                      AppTextStyles.h1,
                    ).copyWith(
                      color: AppColors.black,
                      height: 1.2,
                    ),
                  ),

                  const SizedBox(height: 16),

                  /// DESCRIPTION
                  Text(
                    'Cek email anda untuk detail pemesanan\nfasilitas anda',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.regular(
                      AppTextStyles.body1,
                    ).copyWith(
                      color: AppColors.dark300,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 40),

                  /// BUTTON CEK EMAIL
                  PrimaryButton(
                    label: 'Cek Email Anda',
                    variant: ButtonVariant.secondary,
                    onPressed: () {
                      // TODO: Open Email App
                    },
                  ),

                  const SizedBox(height: 12),

                  /// BUTTON HOME
                  PrimaryButton(
                    label: 'Kembali Ke Beranda',
                    variant: ButtonVariant.primary,
                    onPressed: () {
                      context.go(Routes.home);
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
}