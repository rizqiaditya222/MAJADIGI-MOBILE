import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:majadigi/core/router/app_router.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';
import 'package:majadigi/core/widgets/footer_widget.dart';
import 'package:majadigi/core/widgets/auth_header_widget.dart';
import 'package:majadigi/core/widgets/service_card_widget.dart';
import 'package:majadigi/core/widgets/option_card_widget.dart';

import '../../../../core/widgets/primary_button.dart';

class PariwisataLayananPage extends StatefulWidget {
  const PariwisataLayananPage({super.key});

  @override
  State<PariwisataLayananPage> createState() => _PariwisataLayananPage();
}

class _PariwisataLayananPage extends State<PariwisataLayananPage> {

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
                              imagePath: 'lib/assets/images/pariwisata_icon.png',
                              title: 'Pariwisata',
                              description: 'Destinasi wisata, paket tour, dan panduan wisata terlengkap',
                              onTap: () {
                                print('Pariwisata card tapped');
                              },
                            ),

                            const SizedBox(height: 12),

                            SizedBox(
                              height: 380,
                              child: Column(
                                children: [
                                  OptionCardWidget(
                                    imagePath: 'lib/assets/images/pariwisata_icon.png',
                                    category: 'Pariwisata',
                                    title: 'Destinasi Wisata',
                                    description: 'Informasi lengkap tentang destinasi wisata di Jawa Timur',
                                    onTap: () {
                                      print('Option card tapped');
                                    },
                                    onCheckboxChanged: (isSelected) {
                                      print('Checkbox selected: $isSelected');
                                    },
                                  ),
                                  OptionCardWidget(
                                    imagePath: 'lib/assets/images/pariwisata_icon.png',
                                    category: 'Pariwisata',
                                    title: 'Paket Tour',
                                    description: 'Berbagai paket tour menarik dengan harga terjangkau',
                                    onTap: () {
                                      print('Option card tapped');
                                    },
                                    onCheckboxChanged: (isSelected) {
                                      print('Checkbox selected: $isSelected');
                                    },
                                  ),
                                  OptionCardWidget(
                                    imagePath: 'lib/assets/images/pariwisata_icon.png',
                                    category: 'Pariwisata',
                                    title: 'Panduan Wisata',
                                    description: 'Dapatkan panduan wisata profesional untuk pengalaman terbaik',
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
                                context.push(Routes.sosialLayanan);
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

