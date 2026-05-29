import 'package:flutter/material.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';

enum ButtonVariant { primary, secondary }

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final ButtonVariant variant;
  final Widget? prefixIcon;
  final bool isLoading;

  /// NEW
  final Color? backgroundColor;
  final Color? textColor;
  final double borderRadius;

  const PrimaryButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.variant = ButtonVariant.primary,
    this.prefixIcon,
    this.isLoading = false,

    /// NEW
    this.backgroundColor,
    this.textColor,
    this.borderRadius = 12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSecondary = variant == ButtonVariant.secondary;

    final Color buttonColor =
        backgroundColor ??
            (isSecondary
                ? AppColors.blue150
                : AppColors.blue300);

    final Color buttonTextColor =
        textColor ??
            (isSecondary
                ? AppColors.blue300
                : AppColors.white);

    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(borderRadius),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 16,
          ),
        ),
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor:
            AlwaysStoppedAnimation(
              buttonTextColor,
            ),
          ),
        )
            : Row(
          mainAxisAlignment:
          MainAxisAlignment.center,
          children: [
            if (prefixIcon != null) ...[
              prefixIcon!,
              const SizedBox(width: 8),
            ],
            Text(
              label,
              style: AppTextStyles.semiBold(
                AppTextStyles.body1,
              ).copyWith(
                color: buttonTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}