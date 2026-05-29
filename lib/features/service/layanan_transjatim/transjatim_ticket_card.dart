import 'package:flutter/material.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';

class TransjatimTicketCard extends StatelessWidget {
  final String title;
  final String price;
  final String image;

  const TransjatimTicketCard({
    super.key,
    required this.title,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
      ),
      child: Row(
        children: [
          /// TEXT
          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.semiBold(
                    AppTextStyles.body1,
                  ).copyWith(
                    color: AppColors.dark500,
                    fontSize: 18,
                  ),
                ),

                const SizedBox(height: 10),

                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: price,
                        style: AppTextStyles.bold(
                          AppTextStyles.body1,
                        ).copyWith(
                          color: AppColors.blue300,
                        ),
                      ),
                      TextSpan(
                        text: ' /Tiket',
                        style: AppTextStyles.medium(
                          AppTextStyles.body1,
                        ).copyWith(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          /// IMAGE
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: const Color(0xFFEAF3FF),
              borderRadius:
              BorderRadius.circular(35),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                image,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}