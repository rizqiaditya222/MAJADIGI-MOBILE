import 'package:flutter/material.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';

class TentangLayananContent extends StatelessWidget {
  final String? title;
  final List<String>? paragraphs;

  const TentangLayananContent({
    super.key,
    this.title,
    this.paragraphs,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 4),
        if (title != null) ...[
          _sectionLabel(title!),
          const SizedBox(height: 6),
        ],
        if (paragraphs != null && paragraphs!.isNotEmpty) ...[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              paragraphs!.length,
              (index) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: index < paragraphs!.length - 1 ? 8 : 0,
                  ),
                  child: Text(
                    paragraphs![index],
                    style: AppTextStyles.regular(AppTextStyles.body2)
                        .copyWith(color: AppColors.dark400),
                  ),
                );
              },
            ),
          ),
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
}

