import 'package:flutter/material.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';

class LabelWidget extends StatelessWidget {
  final String label;

  const LabelWidget({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.semiBold(AppTextStyles.body1).copyWith(
            color: AppColors.black,
          ),
        ),
        const SizedBox(height: 4),
      ],
    );
  }
}

