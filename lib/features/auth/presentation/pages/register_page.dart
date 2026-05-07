import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:majadigi/core/router/app_router.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';
import 'package:majadigi/core/widgets/auth_header_widget.dart';
import 'package:majadigi/core/widgets/footer_widget.dart';
import 'package:majadigi/core/widgets/labeled_text_field.dart';
import 'package:majadigi/core/widgets/primary_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  DateTime? selectedDate;
  String? selectedGender;

  final List<String> genderList = [
    'Laki-laki',
    'Perempuan',
  ];

  final TextEditingController dateController = TextEditingController();

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2004),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
        dateController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  InputDecoration _inputDecoration({
    required String hintText,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: AppTextStyles.medium(AppTextStyles.body1).copyWith(
        color: AppColors.dark300,
      ),
      contentPadding: const EdgeInsets.symmetric(
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
    );
  }

  Widget buildLabel(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.semiBold(AppTextStyles.body1).copyWith(
            color: AppColors.black,
          ),
        ),
        const SizedBox(height: 4),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          // STICKY HEADER
          AuthHeaderWidget(
            imagePath: 'lib/assets/images/wayang_image.png',
            onBackPressed: () {
              context.pop();
            },
          ),

          // SCROLLABLE CONTENT
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 24),

                        Text(
                          'Daftar Akun',
                          style: AppTextStyles.bold(AppTextStyles.h1)
                              .copyWith(color: AppColors.black),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          'Buat akun untuk memulai mencari layanan!',
                          style: AppTextStyles
                              .regular(AppTextStyles.body1)
                              .copyWith(color: AppColors.dark300),
                        ),

                        const SizedBox(height: 24),

                        LabeledTextField(
                          label: 'Nama',
                          hintText: 'Masukkan nama Anda',
                          onChanged: (value) {},
                        ),

                        const SizedBox(height: 16),

                        LabeledTextField(
                          label: 'Email Address',
                          hintText: 'Masukkan e-mail Anda',
                          onChanged: (value) {},
                        ),

                        const SizedBox(height: 16),

                        buildLabel("Password"),

                        TextField(
                          obscureText: _obscurePassword,
                          style: AppTextStyles.medium(AppTextStyles.body1)
                              .copyWith(color: AppColors.dark300),
                          decoration: _inputDecoration(
                            hintText: 'Buat kata sandi baru',
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: AppColors.dark300,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        buildLabel("Konfirmasi Password"),

                        TextField(
                          obscureText: _obscureConfirmPassword,
                          style: AppTextStyles.medium(AppTextStyles.body1)
                              .copyWith(color: AppColors.dark300),
                          decoration: _inputDecoration(
                            hintText: 'Konfirmasi Kata Sandi',
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureConfirmPassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: AppColors.dark300,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureConfirmPassword =
                                  !_obscureConfirmPassword;
                                });
                              },
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        LabeledTextField(
                          label: 'No. HP',
                          hintText: '08**********',
                          onChanged: (value) {},
                        ),

                        const SizedBox(height: 16),

                        LabeledTextField(
                          label: 'Alamat',
                          hintText: 'Masukkan Alamat Anda',
                          onChanged: (value) {},
                        ),

                        const SizedBox(height: 16),

                        LabeledTextField(
                          label: 'NIK',
                          hintText: 'Masukkan NIK Anda',
                          onChanged: (value) {},
                        ),

                        const SizedBox(height: 16),

                        // DATE PICKER
                        buildLabel("Tanggal Lahir"),

                        TextField(
                          controller: dateController,
                          readOnly: true,
                          onTap: _selectDate,
                          style: AppTextStyles.medium(
                            AppTextStyles.body1,
                          ).copyWith(
                            color: AppColors.dark300,
                          ),
                          decoration: _inputDecoration(
                            hintText: '24/11/2004',
                            suffixIcon: IconButton(
                              onPressed: _selectDate,
                              icon: Icon(
                                Icons.calendar_month,
                                color: AppColors.dark300,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        // DROPDOWN GENDER
                        buildLabel("Jenis Kelamin"),

                        DropdownButtonFormField<String>(
                          value: selectedGender,

                          style: AppTextStyles.medium(AppTextStyles.body1).copyWith(
                            color: AppColors.black,
                          ),

                          dropdownColor: Colors.white,

                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: AppColors.dark300,
                            size: 24,
                          ),

                          borderRadius: BorderRadius.circular(16),

                          decoration: InputDecoration(
                            hintText: 'Pilih jenis kelamin',

                            hintStyle: AppTextStyles.medium(AppTextStyles.body1).copyWith(
                              color: AppColors.dark300,
                            ),

                            filled: true,
                            fillColor: Colors.white,

                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 16,
                            ),

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

                          items: genderList.map((gender) {
                            return DropdownMenuItem<String>(
                              value: gender,
                              child: Text(
                                gender,
                                style: AppTextStyles.medium(AppTextStyles.body1),
                              ),
                            );
                          }).toList(),

                          onChanged: (value) {
                            setState(() {
                              selectedGender = value;
                            });
                          },
                        ),

                        const SizedBox(height: 24),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Checkbox(
                              value: true,
                              onChanged: (value) {},
                              activeColor: AppColors.blue300,
                            ),

                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 12),
                                child: RichText(
                                  text: TextSpan(
                                    style: AppTextStyles
                                        .regular(AppTextStyles.body2)
                                        .copyWith(
                                      color: AppColors.dark300,
                                    ),
                                    children: [
                                      const TextSpan(
                                        text:
                                        "I've read and agree with the ",
                                      ),
                                      TextSpan(
                                        text: "Terms and Conditions",
                                        style: AppTextStyles
                                            .semiBold(AppTextStyles.body2)
                                            .copyWith(
                                          color: AppColors.blue300,
                                        ),
                                        recognizer:
                                        TapGestureRecognizer()
                                          ..onTap = () {},
                                      ),
                                      const TextSpan(
                                        text: " and the ",
                                      ),
                                      TextSpan(
                                        text: "Privacy Policy",
                                        style: AppTextStyles
                                            .semiBold(AppTextStyles.body2)
                                            .copyWith(
                                          color: AppColors.blue300,
                                        ),
                                        recognizer:
                                        TapGestureRecognizer()
                                          ..onTap = () {},
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 24),

                        PrimaryButton(
                          label: 'Daftar',
                          variant: ButtonVariant.primary,
                          onPressed: () {
                            context.go(Routes.entranceLayanan);
                          },
                        ),

                        const SizedBox(height: 24),
                      ],
                    ),
                  ),

                  FooterWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}