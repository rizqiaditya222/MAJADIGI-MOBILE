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
                                    imagePath: 'lib/assets/images/jatim_icon.png',
                                    category: 'Sosial',
                                    title: 'Nomor Darurat',
                                    description: 'Informasi nomor darurat Jawa Timur',
                                    onTap: () {},
                                    onCheckboxChanged: (selected) {
                                      context.read<LayananBloc>().add(
                                        ToggleServiceEvent(
                                          category: 'Sosial',
                                          service: 'Nomor Darurat',
                                          selected: selected,
                                        ),
                                      );
                                    },
                                  ),
                                  OptionCardWidget(
                                    imagePath: 'lib/assets/images/jatim_icon.png',
                                    category: 'Sosial',
                                    title: 'Klinik Hoaks',
                                    description: 'Cegah penyebaran berita hoaks',
                                    onTap: () {},
                                    onCheckboxChanged: (selected) {
                                      context.read<LayananBloc>().add(
                                        ToggleServiceEvent(
                                          category: 'Sosial',
                                          service: 'Klinik Hoaks',
                                          selected: selected,
                                        ),
                                      );
                                    },
                                  ),
                                  OptionCardWidget(
                                    imagePath: 'lib/assets/images/icon_islamic.png',
                                    category: 'Sosial',
                                    title: 'Islamic Center',
                                    description: 'Pemesanan online fasilitas aula & asrama',
                                    onTap: () {},
                                    onCheckboxChanged: (selected) {
                                      context.read<LayananBloc>().add(
                                        ToggleServiceEvent(
                                          category: 'Sosial',
                                          service: 'Islamic Center',
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
