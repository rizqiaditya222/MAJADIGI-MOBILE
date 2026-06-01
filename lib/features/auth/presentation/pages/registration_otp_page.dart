import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:majadigi/core/router/app_router.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';
import 'package:majadigi/core/widgets/primary_button.dart';
import 'package:majadigi/core/widgets/footer_widget.dart';
import 'package:majadigi/core/widgets/labeled_text_field.dart';
import 'package:majadigi/core/widgets/auth_header_widget.dart';
import 'package:majadigi/core/widgets/service_card_widget.dart';
import 'package:majadigi/core/widgets/labeled_widget.dart';
import 'package:majadigi/core/widgets/otp_text_field.dart';
import 'package:majadigi/core/widgets/otp_text_field.dart';

class RegistrationOtpPage extends StatefulWidget {
  const RegistrationOtpPage({super.key});

  @override
  State<RegistrationOtpPage> createState() => _RegistrationOtpPage();
}

class _RegistrationOtpPage extends State<RegistrationOtpPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    AuthHeaderWidget(
                      imagePath: 'lib/assets/images/wayang_image.png',
                      onBackPressed: () {
                        context.pop();
                      },
                    ),

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Masukan Kode Konfirmasi",
                                textAlign: TextAlign.center,
                                style: AppTextStyles
                                    .bold(AppTextStyles.h2)
                                    .copyWith(color: AppColors.black),
                              ),

                              const SizedBox(height: 12),

                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 24),
                                child: Text(
                                  "A 4-digit code was sent to andrianfaikh@gmail.com",
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles
                                      .regular(AppTextStyles.body2)
                                      .copyWith(color: AppColors.dark300),
                                ),
                              ),
                              const SizedBox(height: 24),

                              OtpTextField(
                                onComplete: (otp) {
                                  print('OTP Lengkap: $otp');
                                  // Handle OTP completion here
                                },
                                onChanged: (otp) {
                                  print('OTP Changed: $otp');
                                },
                              ),


                              const SizedBox(height: 24),

                              Text(
                                "Kirim Ulang Kode",
                                textAlign: TextAlign.center,
                                style: AppTextStyles
                                    .semiBold(AppTextStyles.body1)
                                    .copyWith(color: AppColors.blue300),
                              ),

                              const SizedBox(height: 24),

                              PrimaryButton(
                                label: 'Lanjutkan',
                                onPressed: () {
                                  context.push(Routes.entranceLayanan);
                                },
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: const FooterWidget(),
    );

  }


}