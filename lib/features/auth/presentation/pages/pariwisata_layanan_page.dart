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

import '../../../../core/widgets/primary_button.dart';
import '../bloc/layanan_bloc.dart';
import '../bloc/layanan_event.dart';

class PariwisataLayananPage extends StatefulWidget {
  const PariwisataLayananPage({super.key});

  @override
  State<PariwisataLayananPage> createState() => _PariwisataLayananPage();
}

class _PariwisataLayananPage extends State<PariwisataLayananPage> {

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
                              imagePath: 'lib/assets/images/pariwisata_icon.png',
                              title: 'Pariwisata & Kebudayaan',
                              description: 'Eksplor ragam destinasi wisata, seni, dan budaya khas Jatim',
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
                                    imagePath: 'lib/assets/images/icon_destinasi.png',
                                    category: 'Pariwisata & Kebudayaan',
                                    title: 'Destinasi Wisata',
                                    description: 'Panduan terkait destinasi wisata di Jawa Timur',
                                    onTap: () {},
                                    onCheckboxChanged: (selected) {
                                      context.read<LayananBloc>().add(
                                        ToggleServiceEvent(
                                          category: 'Pariwisata & Kebudayaan',
                                          service: 'Destinasi Wisata',
                                          selected: selected,
                                        ),
                                      );
                                    },
                                  ),
                                  OptionCardWidget(
                                    imagePath: 'lib/assets/images/social_icon.png',
                                    category: 'Pariwisata & Kebudayaan',
                                    title: 'Transjatim',
                                    description: 'Platform layanan bus Trans Jatim',
                                    onTap: () {},
                                    onCheckboxChanged: (selected) {
                                      context.read<LayananBloc>().add(
                                        ToggleServiceEvent(
                                          category: 'Pariwisata & Kebudayaan',
                                          service: 'Transjatim',
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
