import 'package:flutter/material.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? trailing;
  final VoidCallback onTap;

  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 50,
        child: Row(
          children: [
            Icon(
              icon,
              color: AppColors.blue300,
              size: 18,
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Text(
                title,
                style:
                AppTextStyles.medium(
                  AppTextStyles.body1,
                ),
              ),
            ),

            if (trailing != null)
              Text(
                trailing!,
                style:
                AppTextStyles.regular(
                  AppTextStyles.body2,
                ).copyWith(
                  color:
                  AppColors.dark300,
                ),
              ),

            const SizedBox(width: 8),

            Icon(
              Icons.chevron_right,
              color: AppColors.dark300,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}