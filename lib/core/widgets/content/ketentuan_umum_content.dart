import 'package:flutter/material.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';

class KetentuanUmumContent extends StatelessWidget {
  final String? manfaatTitle;
  final String? manfaatDescription;
  final List<String>? manfaatItems;
  final String? prosedurTitle;
  final List<String>? prosedurItems;

  const KetentuanUmumContent({
    super.key,
    this.manfaatTitle,
    this.manfaatDescription,
    this.manfaatItems,
    this.prosedurTitle,
    this.prosedurItems,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 4),

        /// Manfaat
        if (manfaatTitle != null) ...[
          _sectionLabel(manfaatTitle!),
          const SizedBox(height: 6),
          if (manfaatDescription != null) ...[
            Text(
              manfaatDescription!,
              style: AppTextStyles.regular(AppTextStyles.body2)
                  .copyWith(color: AppColors.dark400),
            ),
            const SizedBox(height: 10),
          ],
          if (manfaatItems != null && manfaatItems!.isNotEmpty) ...[
            _numberedList(manfaatItems!),
            const SizedBox(height: 12),
          ],
        ],

        /// Prosedur / Ketentuan Lainnya
        if (prosedurTitle != null && prosedurItems != null) ...[
          _sectionLabel(prosedurTitle!),
          const SizedBox(height: 6),
          _numberedList(prosedurItems!),
        ],
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

