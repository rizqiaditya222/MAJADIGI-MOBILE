import 'package:flutter/material.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';

class TentangLayananContent extends StatelessWidget {
  const TentangLayananContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 4),
        _sectionLabel('Tentang RSUD Daha Husada'),
        const SizedBox(height: 6),
        Text(
          'Rumah Sakit Umum Daerah Daha Husada merupakan Unit Pelaksana Teknis Dinas Kesehatan Provinsi Jawa Timur yang telah berstatus sebagai Badan Layanan Umum Daerah (BLUD). Berdiri sejak tahun 1956, RSUD Daha Husada awalnya merupakan rumah sakit khusus kusta.',
          style: AppTextStyles.regular(AppTextStyles.body2)
              .copyWith(color: AppColors.dark400),
        ),
        const SizedBox(height: 8),
        Text(
          'Berdasarkan Peraturan Gubernur Jawa Timur No. 17 Tahun 2022, Rumah Sakit Kusta Kediri berubah nomenklatur menjadi Rumah Sakit Umum Daerah Daha Husada Kediri dengan klasifikasi kelas D.',
          style: AppTextStyles.regular(AppTextStyles.body2)
              .copyWith(color: AppColors.dark400),
        ),
        const SizedBox(height: 8),
        Text(
          'Pelayanan prima menjadi nilai utama yang mendasari seluruh aktivitas pelayanan di RSUD Daha Husada. Kami percaya bahwa pelayanan berkualitas tidak hanya menyembuhkan, tetapi juga membangun kepercayaan dan kepuasan masyarakat secara berkelanjutan.',
          style: AppTextStyles.regular(AppTextStyles.body2)
              .copyWith(color: AppColors.dark400),
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
}

