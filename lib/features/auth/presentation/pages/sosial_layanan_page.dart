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

class SosialLayananPage extends StatefulWidget {
  const SosialLayananPage({super.key});

  @override
  State<SosialLayananPage> createState() => _SosialLayananPage();
}

class _SosialLayananPage extends State<SosialLayananPage> {

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
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 48),

                            ServiceCardWidget(
                              variant: ServiceCardVariant.dark,
                              imagePath: 'lib/assets/images/social_icon.png',
                              title: 'Sosial',
                              description: 'Layanan bantuan sosial dan kesejahteraan masyarakat',
                              onTap: () {
                                print('Sosial card tapped');
                              },
                            ),

                            const SizedBox(height: 12),

                            SizedBox(
                              height: 348,
                              child: Column(
                                children: [
                                  OptionCardWidget(
                                    imagePath: 'lib/assets/images/social_icon.png',
                                    category: 'Sosial',
                                    title: 'Bantuan Sosial',
                                    description: 'Program bantuan sosial untuk keluarga kurang mampu',
                                    onTap: () {
                                      print('Option card tapped');
                                    },
                                    onCheckboxChanged: (isSelected) {
                                      print('Checkbox selected: $isSelected');
                                    },
                                  ),
                                  OptionCardWidget(
                                    imagePath: 'lib/assets/images/social_icon.png',
                                    category: 'Sosial',
                                    title: 'Pemberdayaan Masyarakat',
                                    description: 'Program pemberdayaan dan pelatihan keterampilan',
                                    onTap: () {
                                      print('Option card tapped');
                                    },
                                    onCheckboxChanged: (isSelected) {
                                      print('Checkbox selected: $isSelected');
                                    },
                                  ),
                                  OptionCardWidget(
                                    imagePath: 'lib/assets/images/social_icon.png',
                                    category: 'Sosial',
                                    title: 'Perlindungan Anak',
                                    description: 'Layanan perlindungan dan pemeliharaan anak',
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
                                context.push(Routes.listLayanan);
                              },
                            ),

                            SizedBox(height: 8),
                            PrimaryButton(
                              label: 'Pilih Layanan Lainnya',
                              variant: ButtonVariant.secondary,
                              onPressed: () {
                                context.push(Routes.entranceLayanan);
                              },
                            )
                          ],
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
