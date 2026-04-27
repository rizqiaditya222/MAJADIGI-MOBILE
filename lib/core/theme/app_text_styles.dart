import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const String fontFamily = 'Poppins';

  //Headings

  static const h1 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 32,
    height: 1.3,
    color: AppColors.dark500,
  );

  static const h2 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 24,
    height: 1.3,
    color: AppColors.dark500,
  );

  static const h3 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    height: 1.3,
    color: AppColors.dark500,
  );

  static const h4 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    height: 1.4,
    color: AppColors.dark500,
  );

  //Body

  static const body1 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    height: 1.5,
    color: AppColors.dark400,
  );

  static const body2 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    height: 1.5,
    color: AppColors.dark400,
  );

  static const body3 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    height: 1.5,
    color: AppColors.dark300,
  );

  static const body4 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 10,
    height: 1.5,
    color: AppColors.dark300,
  );

  //Weight Helper

  static TextStyle regular(TextStyle style) =>
      style.copyWith(fontWeight: FontWeight.w400);

  static TextStyle medium(TextStyle style) =>
      style.copyWith(fontWeight: FontWeight.w500);

  static TextStyle semiBold(TextStyle style) =>
      style.copyWith(fontWeight: FontWeight.w600);

  static TextStyle bold(TextStyle style) =>
      style.copyWith(fontWeight: FontWeight.w700);
}