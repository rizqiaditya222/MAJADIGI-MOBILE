import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';
import 'package:majadigi/core/widgets/auth_header_widget.dart';

import 'package:majadigi/injection_container.dart';
import 'package:majadigi/features/transjatim/presentation/bloc/transjatim_bloc.dart';
import 'package:majadigi/features/service/layanan_transjatim/transjatim_route_card.dart';

class RuteTransjatimPage extends StatelessWidget {
  const RuteTransjatimPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => s1<TransjatimBloc>()..add(FetchAllRoutes()),
      child: Scaffold(
        backgroundColor: AppColors.dark100,
        body: Column(
          children: [
            AuthHeaderWidget(
              imagePath: 'lib/assets/images/transjatim_background.png',
              onBackPressed: () => context.pop(),
              showTitle: true,
              title: 'Daftar Rute',
            ),
            const SizedBox(height: 32),
            Expanded(
              child: BlocBuilder<TransjatimBloc, TransjatimState>(
                builder: (context, state) {
                  if (state.isLoading) return const Center(child: CircularProgressIndicator());
                  if (state.error != null) return Center(child: Text(state.error!));

                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: state.allRoutes.length,
                    itemBuilder: (context, index) {
                      final item = state.allRoutes[index];
                      final routeStr = item.destinations.isNotEmpty ? item.destinations[0] : '-';
                      final destStr = item.destinations.length > 1 ? item.destinations[1] : '-';

                      return TransjatimRouteCard(
                        routeId: item.id ?? 0,
                        kode: item.corridorName,
                        route: routeStr,
                        destination: destStr,
                        time: item.operatingTime,
                        price: 'Rp${item.price}',
                        colorHex: item.corridorColor,
                      );
                    },
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