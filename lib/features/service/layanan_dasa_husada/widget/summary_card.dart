import 'package:flutter/material.dart';

import '../../../../core/theme/app_text_styles.dart';

class SummaryCard extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String value;
  final String? title;
  final String? label;

  const SummaryCard({
    super.key,
    required this.color,
    required this.icon,
    required this.value,
    this.title,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    final displayText = label ?? title ?? '';

    return Container(
      height: 92,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 72,
            height: double.infinity,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 34,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    value,
                    style: AppTextStyles.bold(
                      AppTextStyles.h2,
                    ).copyWith(
                      color: color,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    displayText,
                    style: AppTextStyles.medium(
                      AppTextStyles.body2,
                    ).copyWith(
                      color: const Color(0xFF666666),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
