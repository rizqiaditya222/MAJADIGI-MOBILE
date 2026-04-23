import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.light(
        primary: AppColors.blue300,
        secondary: AppColors.green300,
        error: AppColors.red300,
        surface: AppColors.white,
        onPrimary: AppColors.white,
        onSecondary: AppColors.white,
        onSurface: AppColors.dark500,
        onError: AppColors.white,
      ),
      scaffoldBackgroundColor: AppColors.white,

      // Text Theme
      textTheme: TextTheme(
        displayLarge: AppTextStyles.semiBold(AppTextStyles.h1),
        displayMedium: AppTextStyles.semiBold(AppTextStyles.h2),
        displaySmall: AppTextStyles.semiBold(AppTextStyles.h3),
        headlineSmall: AppTextStyles.semiBold(AppTextStyles.h4),
        bodyLarge: AppTextStyles.regular(AppTextStyles.body1),
        bodyMedium: AppTextStyles.regular(AppTextStyles.body2),
        bodySmall: AppTextStyles.regular(AppTextStyles.body3),
        labelLarge: AppTextStyles.semiBold(AppTextStyles.body2),
        labelMedium: AppTextStyles.semiBold(AppTextStyles.body3),
      ),
    );
  }
}