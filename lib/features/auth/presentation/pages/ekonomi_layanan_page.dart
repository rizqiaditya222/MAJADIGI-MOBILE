import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:majadigi/core/router/app_router.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';
import 'package:majadigi/core/widgets/footer_widget.dart';
import 'package:majadigi/core/widgets/auth_header_widget.dart';
import 'package:majadigi/core/widgets/index.dart';
import 'package:majadigi/core/widgets/service_card_widget.dart';
import 'package:majadigi/core/widgets/option_card_widget.dart';

import '../bloc/layanan_bloc.dart';
import '../bloc/layanan_event.dart';

class EkonomiLayananPage extends StatefulWidget {
  const EkonomiLayananPage({super.key});

  @override
  State<EkonomiLayananPage> createState() => _EkonomiLayananPage();
}

class _EkonomiLayananPage extends State<EkonomiLayananPage> {

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
                                imagePath: 'lib/assets/images/ekonomi_icon.png',
                                title: 'Ekonomi',
                                description: 'Layanan pengembangan usaha, peluang bisnis, dan investasi',
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
                                      category: 'Ekonomi',
                                      title: 'Harga Bahan Pokok',
                                      description: 'Informasi harian seputar harga bahan pokok',
                                      onTap: () {},
                                      onCheckboxChanged: (selected) {
                                        context.read<LayananBloc>().add(
                                          ToggleServiceEvent(
                                            category: 'Ekonomi',
                                            service: 'Harga Bahan Pokok',
                                            selected: selected,
                                          ),
                                        );
                                      },
                                    ),
                                    OptionCardWidget(
                                      imagePath: 'lib/assets/images/icon_bapenda.png',
                                      category: 'Ekonomi',
                                      title: 'Bapenda',
                                      description: 'Info & layanan pajak kendaraan bermotor',
                                      onTap: () {},
                                      onCheckboxChanged: (selected) {
                                        context.read<LayananBloc>().add(
                                          ToggleServiceEvent(
                                            category: 'Ekonomi',
                                            service: 'Bapenda',
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
                                  onPressed: (){
                                    context.push(Routes.listLayanan);
                                  }),

                              SizedBox(height: 8),
                              PrimaryButton(
                                  label: 'Pilih Layanan Lainnya',
                                  variant: ButtonVariant.secondary,
                                  onPressed: (){
                                    context.push(Routes.entranceLayanan);
                                  })
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