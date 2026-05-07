import 'package:flutter/material.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';

enum ServiceCardVariant {
  light, // Default: border dark200, text black
  dark,  // Background blue300, text white
}

class ServiceCardWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final VoidCallback onTap;
  final ServiceCardVariant variant;

  const ServiceCardWidget({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.onTap,
    this.variant = ServiceCardVariant.light,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLight = variant == ServiceCardVariant.light;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isLight ? Colors.transparent : AppColors.blue300,
          border: Border.all(
            color: isLight ? AppColors.dark150 : Colors.transparent,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: SizedBox(
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  imagePath,
                  width: 56,
                  height: 56,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: AppTextStyles.semiBold(AppTextStyles.h4)
                            .copyWith(
                              color: isLight ? AppColors.black : Colors.white,
                            ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        description,
                        style: AppTextStyles.regular(AppTextStyles.body3)
                            .copyWith(
                              color: isLight ? AppColors.dark300 : Colors.white70,
                            ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
