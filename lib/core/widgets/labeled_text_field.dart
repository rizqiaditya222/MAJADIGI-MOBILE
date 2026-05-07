import 'package:flutter/material.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';

class LabeledTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final bool isOptional;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  const LabeledTextField({
    Key? key,
    required this.label,
    required this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.isOptional = false,
    this.controller,
    this.validator,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Text(
                label,
                textAlign: TextAlign.start,
                style: AppTextStyles.semiBold(AppTextStyles.body1)
                    .copyWith(color: AppColors.black),
              ),
              if (isOptional)
                Padding(
                  padding: EdgeInsets.only(left: 4),
                  child: Text(
                    '(Opsional)',
                    textAlign: TextAlign.start,
                    style: AppTextStyles.regular(AppTextStyles.body2)
                        .copyWith(color: AppColors.dark300),
                  ),
                ),
            ],
          ),
        ),
        SizedBox(height: 4),
        TextField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          onChanged: onChanged,
          style: AppTextStyles.medium(AppTextStyles.body1)
              .copyWith(color: AppColors.dark300),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppTextStyles.medium(AppTextStyles.body1)
                .copyWith(color: AppColors.dark300),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            suffixIcon: suffixIcon,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: AppColors.dark200,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: AppColors.blue300,
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

