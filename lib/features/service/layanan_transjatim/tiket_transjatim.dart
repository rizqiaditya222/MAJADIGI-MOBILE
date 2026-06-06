import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';
import 'package:majadigi/core/widgets/auth_header_widget.dart';

import 'package:majadigi/injection_container.dart';
import 'package:majadigi/features/transjatim/presentation/bloc/transjatim_bloc.dart';
import 'package:majadigi/features/service/layanan_transjatim/transjatim_ticket_card.dart';

class TiketTransjatimPage extends StatelessWidget {
  const TiketTransjatimPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => s1<TransjatimBloc>()..add(FetchAllTickets()),
      child: Scaffold(
        backgroundColor: AppColors.dark100,
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            AuthHeaderWidget(
              imagePath: 'lib/assets/images/transjatim_background.png',
              onBackPressed: () => context.pop(),
              showTitle: true,
              title: 'Daftar Tiket',
            ),
            const SizedBox(height: 32),
            Expanded(
              child: BlocBuilder<TransjatimBloc, TransjatimState>(
                builder: (context, state) {
                  if (state.isLoading) return const Center(child: CircularProgressIndicator());
                  if (state.error != null) return Center(child: Text(state.error!));
                  if (state.allTickets == null) return const SizedBox();

                  final data = state.allTickets!;

                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        /// TIKET UMUM
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30, bottom: 8),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Umum', style: AppTextStyles.semiBold(AppTextStyles.h3).copyWith(color: AppColors.dark500)),
                          ),
                        ),
                        const SizedBox(height: 12),
                        ListView.builder(
                          shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                          itemCount: data.umum.length,
                          itemBuilder: (context, index) {
                            return TransjatimTicketCard(title: data.umum[index].name, price: 'Rp${data.umum[index].price}', image: 'lib/assets/images/transjatim_sample.png');
                          },
                        ),

                        /// TIKET LUXURY
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30, bottom: 8),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Luxury', style: AppTextStyles.semiBold(AppTextStyles.h3).copyWith(color: AppColors.dark500)),
                          ),
                        ),
                        const SizedBox(height: 12),
                        ListView.builder(
                          shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                          itemCount: data.luxury.length,
                          itemBuilder: (context, index) {
                            return TransjatimTicketCard(title: data.luxury[index].name, price: 'Rp${data.luxury[index].price}', image: 'lib/assets/images/transjatim_sample.png');
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}