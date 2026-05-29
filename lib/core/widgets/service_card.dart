import 'package:flutter/material.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';
import 'package:majadigi/core/widgets/index.dart';

class ServiceCard extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final VoidCallback onPressed;

  const ServiceCard({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // IMAGE
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            child: Image.asset(
              image,
              width: double.infinity,
              height: 160,
              fit: BoxFit.cover,
            ),
          ),

          // CONTENT
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 24,
            ),
            child: Column(
              children: [

                // TITLE
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.semiBold(
                    AppTextStyles.h2,
                  ).copyWith(
                    color: AppColors.black,
                  ),
                ),

                const SizedBox(height: 4),

                // DESCRIPTION
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.regular(
                    AppTextStyles.body2,
                  ).copyWith(
                    color: AppColors.dark300,
                  ),
                ),

                const SizedBox(height: 24),

                // BUTTON
                PrimaryButton(
                  label: 'CEK',
                  onPressed: onPressed,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}