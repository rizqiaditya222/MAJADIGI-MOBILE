import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:majadigi/core/router/app_router.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';
import 'package:majadigi/core/widgets/footer_widget.dart';
import 'package:majadigi/core/widgets/auth_header_widget.dart';
import 'package:majadigi/core/widgets/service_card_widget.dart';

class OptionLayananPage extends StatefulWidget {
  const OptionLayananPage({super.key});

  @override
  State<OptionLayananPage> createState() => _OptionLayananPage();
}

class _OptionLayananPage extends State<OptionLayananPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Pilih Layanan Yang Anda Butuhkan Disini",
                                textAlign: TextAlign.start,
                                style: AppTextStyles
                                    .semiBold(AppTextStyles.h1)
                                    .copyWith(color: AppColors.black),
                              ),

                              const SizedBox(height: 4),

                              Text(
                                "Pilih salah satu layanan yang membantu anda!",
                                textAlign: TextAlign.start,
                                style: AppTextStyles
                                    .regular(AppTextStyles.body2)
                                    .copyWith(color: AppColors.dark300),
                              ),

                              const SizedBox(height: 24),

                              ServiceCardWidget(
                                imagePath: 'lib/assets/images/ekonomi_icon.png',
                                title: 'Ekonomi',
                                description: 'Layanan pengembangan usaha, peluang bisnis, dan investasi',
                                onTap: () {
                                  context.push(Routes.ekonomiLayanan);
                                },
                              ),

                              const SizedBox(height: 4),

                              ServiceCardWidget(
                                imagePath: 'lib/assets/images/kesehatan_icon.png',
                                title: 'Kesehatan',
                                description: 'Berisi info layanan, fasilitas, dan program kesehatan di Jatim',
                                onTap: () {
                                  print('Sosial card tapped');
                                },
                              ),

                              const SizedBox(height: 4),

                              ServiceCardWidget(
                                imagePath: 'lib/assets/images/pariwisata_icon.png',
                                title: 'Pariwisata & Kebudayaan',
                                description: 'Eksplor ragam destinasi wisata, seni, dan budaya khas Jatim',
                                onTap: () {
                                  print('Sosial card tapped');
                                },
                              ),

                              const SizedBox(height: 4),

                              ServiceCardWidget(
                                imagePath: 'lib/assets/images/social_icon.png',
                                title: 'Sosial',
                                description: 'Akses bantuan dan layanan sosial untuk kesejahteraan warga Jatim',
                                onTap: () {
                                  print('Sosial card tapped');
                                },
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),

                    FooterWidget(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );

  }


}