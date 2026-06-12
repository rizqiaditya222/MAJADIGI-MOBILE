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

import '../../../../core/widgets/service_dropdown.dart';
import '../bloc/layanan_bloc.dart';
import '../bloc/layanan_state.dart';

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

                            BlocBuilder<LayananBloc, LayananState>(
                              builder: (context, state) {

                                final groupedServices =
                                <String, List<String>>{};

                                for (final service in state.services) {
                                  groupedServices.putIfAbsent(
                                    service.category,
                                        () => [],
                                  );

                                  groupedServices[service.category]!
                                      .add(service.service);
                                }

                                if (groupedServices.isEmpty) {
                                  return Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(24),
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius:
                                      BorderRadius.circular(16),
                                    ),
                                    child: Text(
                                      'Belum ada layanan yang dipilih',
                                      textAlign: TextAlign.center,
                                      style: AppTextStyles.regular(
                                        AppTextStyles.body2,
                                      ),
                                    ),
                                  );
                                }

                                return Column(
                                  children: groupedServices.entries
                                      .map(
                                        (entry) => ServiceDropdown(
                                      title: entry.key,
                                      services: entry.value,
                                    ),
                                  )
                                      .toList(),
                                );
                              },
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