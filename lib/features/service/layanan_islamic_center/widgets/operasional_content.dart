import 'package:flutter/material.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';

class OperasionalContent extends StatelessWidget {
  const OperasionalContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 4),

        /// Link Layanan
        _sectionLabel('Link Layanan'),
        const SizedBox(height: 4),
        GestureDetector(
          onTap: () {
            // Handle URL open
          },
          child: Text(
            'https://rsuddahahusada.jatimprov.go.id/',
            style: AppTextStyles.regular(AppTextStyles.body2).copyWith(
              color: AppColors.blue300,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.blue300,
            ),
          ),
        ),
        const SizedBox(height: 12),

        /// Alamat
        _sectionLabel('Alamat'),
        const SizedBox(height: 4),
        Text(
          'Jl. Veteran No.48, Mojoroto, Kec. Mojoroto, Kota Kediri 64112',
          style: AppTextStyles.regular(AppTextStyles.body2)
              .copyWith(color: AppColors.dark400),
        ),
        const SizedBox(height: 12),

        /// Jam Operasional
        _sectionLabel('Jam Operasional'),
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _jamItem('Senin', '07:00 - 21:00'),
                  const SizedBox(height: 4),
                  _jamItem('Selasa', '07:00 - 21:00'),
                  const SizedBox(height: 4),
                  _jamItem('Rabu', '07:00 - 21:00'),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _jamItem('Kamis', '07:00 - 21:00'),
                  const SizedBox(height: 4),
                  _jamItem('Jumat', '07:00 - 21:00'),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        /// Media Sosial
        _sectionLabel('Media Sosial'),
        const SizedBox(height: 8),
        Row(
          children: [
            _socialButton(Icons.camera_alt_outlined, 'Instagram'),
            const SizedBox(width: 12),
            _socialButton(Icons.facebook_outlined, 'Facebook'),
            const SizedBox(width: 12),
            _socialButton(Icons.play_circle_outline, 'Youtube'),
          ],
        ),
      ],
    );
  }

  Widget _sectionLabel(String text) {
    return Text(
      text,
      style: AppTextStyles.semiBold(AppTextStyles.body2)
          .copyWith(color: AppColors.dark500),
    );
  }

  Widget _jamItem(String day, String time) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '• ',
          style: AppTextStyles.regular(AppTextStyles.body2)
              .copyWith(color: AppColors.dark400),
        ),
        Expanded(
          child: Text(
            '$day ($time)',
            style: AppTextStyles.regular(AppTextStyles.body2)
                .copyWith(color: AppColors.dark400),
          ),
        ),
      ],
    );
  }

  Widget _socialButton(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, size: 18, color: AppColors.blue300),
        const SizedBox(width: 4),
        Text(
          label,
          style: AppTextStyles.medium(AppTextStyles.body2)
              .copyWith(color: AppColors.blue300),
        ),
      ],
    );
  }
}

