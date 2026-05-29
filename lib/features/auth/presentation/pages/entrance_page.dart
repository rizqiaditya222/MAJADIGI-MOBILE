import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';
import 'package:majadigi/core/widgets/primary_button.dart';
import 'package:majadigi/core/router/app_router.dart';
import 'package:majadigi/core/widgets/footer_widget.dart';

class EntrancePage extends StatefulWidget {
  const EntrancePage({super.key});

  @override
  State<EntrancePage> createState() => _EntrancePage();
}

class _EntrancePage extends State<EntrancePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
            child: Container(
              width: double.infinity,
              height: 328,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF0090FF),
                            Color(0xFF005699),
                          ],
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                        ),
                      ),
                      child: Image.asset(
                        'lib/assets/images/wayang_image.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(left: 24, right: 24, bottom: 48),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 264),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Selamat Datang Kembali Di Majadigi!',
                              textAlign: TextAlign.center,
                              style: AppTextStyles.bold(AppTextStyles.h2)
                                  .copyWith(color: AppColors.white),
                            ),
                            SizedBox(height: 24),
                            Text(
                              'Platform layanan publik Jawa Timur. Cerdas, Praktis, & Terintegrasi.',
                              textAlign: TextAlign.center,
                              style: AppTextStyles.medium(AppTextStyles.body1)
                                  .copyWith(color: AppColors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),

          ),

          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  PrimaryButton(
                    label: 'Masuk',
                    variant: ButtonVariant.primary,
                    onPressed: () {
                      context.push(Routes.login);
                    },
                  ),

                  SizedBox(height: 16),

                  PrimaryButton(
                    label: 'Masuk Sebagai Guest',
                    variant: ButtonVariant.secondary,
                    onPressed: () {},
                  ),

                  SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Belum memiliki akun?',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.regular(AppTextStyles.body2)
                            .copyWith(color: AppColors.dark300),
                      ),

                      SizedBox(width: 4),

                      GestureDetector(
                        onTap: () {
                          context.push(Routes.register);
                        },
                        child: Text(
                          'Daftar Sekarang',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.bold(AppTextStyles.body2)
                              .copyWith(color: AppColors.dark300),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 32),

                  Container(
                    height: 1,
                    width: double.infinity,
                    color: AppColors.dark100,
                  ),

                  SizedBox(height: 16),

                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColors.white,
                        side: BorderSide(
                          color: AppColors.dark200,
                          width: 1,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'lib/assets/images/google_icon.png',
                            width: 20,
                            height: 20,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Masuk dengan Google',
                            style: AppTextStyles.semiBold(AppTextStyles.body1)
                                .copyWith(color: AppColors.dark300),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

         ],
       ),
      bottomNavigationBar: const FooterWidget(),
     );
  }

}