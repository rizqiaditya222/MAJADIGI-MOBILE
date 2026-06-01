import 'package:flutter/material.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';

class KetentuanUmumContent extends StatelessWidget {
  const KetentuanUmumContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 4),
        _sectionLabel('Manfaat'),
        const SizedBox(height: 6),
        Text(
          'RSUD Daha Husada mempunyai tugas melaksanakan sebagian tugas Dinas Kesehatan di bidang promotif, preventif, kuratif, rehabilitatif, penelitian pengembangan, dan melaksanakan UKM Strata II di wilayah kerjanya.',
          style: AppTextStyles.regular(AppTextStyles.body2)
              .copyWith(color: AppColors.dark400),
        ),
        const SizedBox(height: 10),
        _numberedList([
          'Penyusunan rencana dan program RSUD Daha Husada',
          'Pelaksanaan ketatausahaan',
          'Pengawasan dan pengendalian operasional rumah sakit',
          'Pelayanan medis',
          'Penyelenggaraan pelayanan penunjang medis dan non medis',
          'Pelaksanaan pelayanan kesehatan umum masyarakat',
          'Penyelenggaraan pelayanan dan asuhan keperawatan',
        ]),
        const SizedBox(height: 12),
        _sectionLabel('Pendaftaran online di poli RSUD Daha Husada'),
        const SizedBox(height: 6),
        _numberedList([
          'Bagi pasien BPJS Kesehatan, pendaftaran menggunakan aplikasi Mobile JKN',
          'Untuk pasien umum dan asuransi lain, bisa daftar melalui WhatsApp.',
          'Pengguna akan diarahkan ke pesan WhatsApp admin RSUD Daha Husada',
        ]),
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

  Widget _numberedList(List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(items.length, (i) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${i + 1}. ',
                style: AppTextStyles.regular(AppTextStyles.body2)
                    .copyWith(color: AppColors.dark400),
              ),
              Expanded(
                child: Text(
                  items[i],
                  style: AppTextStyles.regular(AppTextStyles.body2)
                      .copyWith(color: AppColors.dark400),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

