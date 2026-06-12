import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';
import 'package:majadigi/core/widgets/auth_header_widget.dart';
import 'package:majadigi/core/widgets/primary_button.dart';
import 'package:majadigi/core/widgets/labeled_widget.dart';

class UbahKataSandiPage extends StatefulWidget {
  const UbahKataSandiPage({super.key});

  @override
  State<UbahKataSandiPage> createState() =>
      _UbahKataSandiPageState();
}

class _UbahKataSandiPageState
    extends State<UbahKataSandiPage> {
  bool _obscureOldPassword = true;
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;

  final oldPasswordController =
  TextEditingController();

  final newPasswordController =
  TextEditingController();

  final confirmPasswordController =
  TextEditingController();

  @override
  void dispose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  InputDecoration _inputDecoration({
    required String hintText,
    required bool obscure,
    required VoidCallback onToggle,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: AppTextStyles.medium(
        AppTextStyles.body1,
      ).copyWith(
        color: AppColors.dark300,
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      suffixIcon: IconButton(
        onPressed: onToggle,
        icon: Icon(
          obscure
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined,
          color: AppColors.dark300,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: AppColors.dark200,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: AppColors.blue300,
          width: 1.5,
        ),
      ),
    );
  }

  void _submit() {
    if (oldPasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content:
          Text('Kata sandi lama wajib diisi'),
        ),
      );
      return;
    }

    if (newPasswordController.text.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Password minimal 8 karakter',
          ),
        ),
      );
      return;
    }

    if (newPasswordController.text !=
        confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content:
          Text('Konfirmasi password tidak sama'),
        ),
      );
      return;
    }

    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark100,
      body: Column(
        children: [
          AuthHeaderWidget(
            imagePath:
            'lib/assets/images/wayang_image.png',
            showTitle: true,
            title: 'Ubah Kata Sandi',
            onBackPressed: () {
              context.pop();
            },
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),

                  LabelWidget(
                    label: 'Kata Sandi Lama',
                  ),

                  const SizedBox(height: 8),

                  TextField(
                    controller:
                    oldPasswordController,
                    obscureText:
                    _obscureOldPassword,
                    style: AppTextStyles.medium(
                      AppTextStyles.body1,
                    ).copyWith(
                      color: AppColors.dark400,
                    ),
                    decoration: _inputDecoration(
                      hintText:
                      'Masukkan Kata Sandi Lama',
                      obscure:
                      _obscureOldPassword,
                      onToggle: () {
                        setState(() {
                          _obscureOldPassword =
                          !_obscureOldPassword;
                        });
                      },
                    ),
                  ),

                  const SizedBox(height: 24),

                  LabelWidget(
                    label: 'Kata Sandi Baru',
                  ),

                  const SizedBox(height: 8),

                  TextField(
                    controller:
                    newPasswordController,
                    obscureText:
                    _obscureNewPassword,
                    style: AppTextStyles.medium(
                      AppTextStyles.body1,
                    ).copyWith(
                      color: AppColors.dark400,
                    ),
                    decoration: _inputDecoration(
                      hintText:
                      'Masukkan Kata Sandi Baru',
                      obscure:
                      _obscureNewPassword,
                      onToggle: () {
                        setState(() {
                          _obscureNewPassword =
                          !_obscureNewPassword;
                        });
                      },
                    ),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    'Gunakan minimal 8 karakter dengan kombinasi huruf dan angka.',
                    style: AppTextStyles.regular(
                      AppTextStyles.body1,
                    ).copyWith(
                      color: AppColors.dark500,
                    ),
                  ),

                  const SizedBox(height: 24),

                  TextField(
                    controller:
                    confirmPasswordController,
                    obscureText:
                    _obscureConfirmPassword,
                    style: AppTextStyles.medium(
                      AppTextStyles.body1,
                    ).copyWith(
                      color: AppColors.dark400,
                    ),
                    decoration: _inputDecoration(
                      hintText:
                      'Konfirmasi Kata Sandi Baru',
                      obscure:
                      _obscureConfirmPassword,
                      onToggle: () {
                        setState(() {
                          _obscureConfirmPassword =
                          !_obscureConfirmPassword;
                        });
                      },
                    ),
                  ),

                  const SizedBox(height: 36),

                  PrimaryButton(
                    label: 'Ubah Kata Sandi',
                    onPressed: _submit,
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