import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:majadigi/core/router/app_router.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';
import 'package:majadigi/core/widgets/footer_widget.dart';
import 'package:majadigi/core/widgets/auth_header_widget.dart';
import 'package:majadigi/core/widgets/index.dart';
import 'package:majadigi/core/widgets/service_card_widget.dart';

import '../../../../core/widgets/service_dropdown.dart';

class ListLayananPage extends StatefulWidget {
  const ListLayananPage({super.key});

  @override
  State<ListLayananPage> createState() => _ListLayananPage();
}

class _ListLayananPage extends State<ListLayananPage> {

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
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "List Layanan yang Anda Pilih",
                              style: AppTextStyles
                                  .semiBold(AppTextStyles.h2)
                                  .copyWith(
                                color: AppColors.black,
                              ),
                            ),

                            const SizedBox(height: 4),

                            Text(
                              "Semoga layanan yang anda pilih ini membantu anda",
                              style: AppTextStyles
                                  .regular(AppTextStyles.body2)
                                  .copyWith(
                                color: AppColors.dark300,
                              ),
                            ),

                            const SizedBox(height: 16),

                            Column(
                              children: [
                                ServiceDropdown(
                                  title: 'Ekonomi',
                                  services: [
                                    'RSUD DAHA HUSADA',
                                    'RSUD KARSA HUSADA',
                                  ],
                                ),

                                ServiceDropdown(
                                  title: 'Kesehatan',
                                  services: [
                                    'RSUD DAHA HUSADA',
                                    'RSUD KARSA HUSADA',
                                  ],
                                ),

                                ServiceDropdown(
                                  title: 'Pariwisata & Kebudayaan',
                                  services: [],
                                ),

                                ServiceDropdown(
                                  title: 'Sosial',
                                  services: [
                                    'RSUD DAHA HUSADA',
                                    'RSUD KARSA HUSADA',
                                  ],
                                ),
                              ],
                            ),

                            const SizedBox(height: 24),

                            PrimaryButton(
                              label: 'Simpan',
                              onPressed: () {
                                context.go(Routes.mainNavigation);
                              },
                            ),

                            const SizedBox(height: 24),
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