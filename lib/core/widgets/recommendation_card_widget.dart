import 'package:flutter/material.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';

class RecommendationCardWidget extends StatelessWidget {
  final String image;
  final String subtitle;
  final String title;
  final String description;
  final VoidCallback onTap;

  const RecommendationCardWidget({
    super.key,
    required this.image,
    required this.subtitle,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 132,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          children: [

            /// IMAGE
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24),
                bottomLeft: Radius.circular(24),
              ),
              child: SizedBox(
                width: 96,
                height: double.infinity,
                child: Image.asset(
                  image,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),

            /// CONTENT
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 18,
                ),
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  children: [

                    Text(
                      subtitle,
                      style: AppTextStyles.medium(
                        AppTextStyles.body2,
                      ).copyWith(
                        color: AppColors.dark300,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      title,
                      style: AppTextStyles.semiBold(
                        AppTextStyles.h3,
                      ).copyWith(
                        color: AppColors.dark500,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      description,
                      style: AppTextStyles.regular(
                        AppTextStyles.body3,
                      ).copyWith(
                        color: AppColors.dark400,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}