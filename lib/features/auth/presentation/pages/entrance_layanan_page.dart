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

class EntranceLayananPage extends StatefulWidget {
  const EntranceLayananPage({super.key});

  @override
  State<EntranceLayananPage> createState() => _EntranceLayananPage();
}

class _EntranceLayananPage extends State<EntranceLayananPage> {

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

                              PrimaryButton(
                                label: 'Tambah layanan',
                                onPressed: () {
                                  context.push(Routes.optionLayanan);
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