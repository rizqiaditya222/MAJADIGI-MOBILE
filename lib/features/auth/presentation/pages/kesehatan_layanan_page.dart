import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:majadigi/core/router/app_router.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';
import 'package:majadigi/core/widgets/footer_widget.dart';
import 'package:majadigi/core/widgets/auth_header_widget.dart';
import 'package:majadigi/core/widgets/service_card_widget.dart';
import 'package:majadigi/core/widgets/option_card_widget.dart';
import 'package:majadigi/core/widgets/index.dart';

class KesehatanLayananPage extends StatefulWidget {
  const KesehatanLayananPage({super.key});

  @override
  State<KesehatanLayananPage> createState() => _KesehatanLayananPage();
}

class _KesehatanLayananPage extends State<KesehatanLayananPage> {

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
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 72),

                            ServiceCardWidget(
                              variant: ServiceCardVariant.dark,
                              imagePath: 'lib/assets/images/kesehatan_icon.png',
                              title: 'Kesehatan',
                              description: 'Layanan kesehatan, konsultasi medis, dan informasi kesehatan',
                              onTap: () {
                                print('Kesehatan card tapped');
                              },
                            ),

                            const SizedBox(height: 12),

                            SizedBox(
                              height: 380,
                              child: Column(
                                children: [
                                  OptionCardWidget(
                                    imagePath: 'lib/assets/images/kesehatan_icon.png',
                                    category: 'Kesehatan',
                                    title: 'Konsultasi Medis',
                                    description: 'Konsultasi dengan dokter profesional secara online',
                                    onTap: () {
                                      print('Option card tapped');
                                    },
                                    onCheckboxChanged: (isSelected) {
                                      print('Checkbox selected: $isSelected');
                                    },
                                  ),
                                  OptionCardWidget(
                                    imagePath: 'lib/assets/images/kesehatan_icon.png',
                                    category: 'Kesehatan',
                                    title: 'Fasilitas Kesehatan',
                                    description: 'Informasi rumah sakit, klinik, dan fasilitas kesehatan',
                                    onTap: () {
                                      print('Option card tapped');
                                    },
                                    onCheckboxChanged: (isSelected) {
                                      print('Checkbox selected: $isSelected');
                                    },
                                  ),
                                  OptionCardWidget(
                                    imagePath: 'lib/assets/images/kesehatan_icon.png',
                                    category: 'Kesehatan',
                                    title: 'Edukasi Kesehatan',
                                    description: 'Tips dan informasi untuk gaya hidup sehat',
                                    onTap: () {
                                      print('Option card tapped');
                                    },
                                    onCheckboxChanged: (isSelected) {
                                      print('Checkbox selected: $isSelected');
                                    },
                                  ),
                                ],
                              ),
                            ),
                            PrimaryButton(
                              label: 'Simpan',
                              onPressed: () {
                                context.push(Routes.pariwisataLayanan);
                              },
                            )
                          ],
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
