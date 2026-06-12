import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:majadigi/core/router/app_router.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';
import 'package:majadigi/core/widgets/footer_widget.dart';
import 'package:majadigi/core/widgets/auth_header_widget.dart';
import 'package:majadigi/core/widgets/service_card_widget.dart';
import 'package:majadigi/core/widgets/option_card_widget.dart';
import 'package:majadigi/core/widgets/index.dart';

import '../bloc/layanan_bloc.dart';
import '../bloc/layanan_event.dart';

class KesehatanLayananPage extends StatefulWidget {
  const KesehatanLayananPage({super.key});

  @override
  State<KesehatanLayananPage> createState() => _KesehatanLayananPage();
}

class _KesehatanLayananPage extends State<KesehatanLayananPage> {

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
                              imagePath: 'lib/assets/images/kesehatan_icon.png',
                              title: 'Kesehatan',
                              description: 'Layanan kesehatan, konsultasi medis, dan informasi kesehatan',
                              onTap: () {
                                print('Kesehatan card tapped');
                              },
                            ),

                            const SizedBox(height: 12),

                            SizedBox(
                              height: 348,
                              child: Column(
                                children: [
                                  OptionCardWidget(
                                    imagePath: 'lib/assets/images/icon_karsa.png',
                                    category: 'Kesehatan',
                                    title: 'RSUD Karsa Husada',
                                    description: 'Layanan RSUD Karsa Husada Kota Batu',
                                    onTap: () {},
                                    onCheckboxChanged: (selected) {
                                      context.read<LayananBloc>().add(
                                        ToggleServiceEvent(
                                          category: 'Kesehatan',
                                          service: 'RSUD Karsa Husada',
                                          selected: selected,
                                        ),
                                      );
                                    },
                                  ),
                                  OptionCardWidget(
                                    imagePath: 'lib/assets/images/icon_daha.png',
                                    category: 'Kesehatan',
                                    title: 'RSUD Daha Husada',
                                    description: 'Layanan RSUD Daha Husada Kota Kediri',
                                    onTap: () {},
                                    onCheckboxChanged: (selected) {
                                      context.read<LayananBloc>().add(
                                        ToggleServiceEvent(
                                          category: 'Kesehatan',
                                          service: 'RSUD Daha Husada',
                                          selected: selected,
                                        ),
                                      );
                                    },
                                  ),
                                  OptionCardWidget(
                                    imagePath: 'lib/assets/images/kesehatan_icon.png',
                                    category: 'Kesehatan',
                                    title: 'Skrining Mandiri TBC',
                                    description: 'Aplikasi skrining mandiri Tuberkulosis (TBC)',
                                    onTap: () {},
                                    onCheckboxChanged: (selected) {
                                      context.read<LayananBloc>().add(
                                        ToggleServiceEvent(
                                          category: 'Kesehatan',
                                          service: 'Skrining Mandiri TBC',
                                          selected: selected,
                                        ),
                                      );
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
