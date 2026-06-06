import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:majadigi/core/router/app_router.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';
import 'package:majadigi/core/widgets/labeled_header.dart';
import 'package:majadigi/core/widgets/custom_tab_bar.dart';

import 'package:majadigi/injection_container.dart';
import 'package:majadigi/features/transjatim/presentation/bloc/transjatim_bloc.dart';
import 'package:majadigi/features/service/layanan_transjatim/transjatim_route_card.dart';
import 'package:majadigi/features/service/layanan_transjatim/transjatim_ticket_card.dart';
import 'widgets/transjatim_tentang_tab.dart';

class TransjatimPage extends StatefulWidget {
  const TransjatimPage({super.key});

  @override
  State<TransjatimPage> createState() => _TransjatimPage();
}

class _TransjatimPage extends State<TransjatimPage> with SingleTickerProviderStateMixin {
  final TextEditingController searchController = TextEditingController();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => s1<TransjatimBloc>()..add(FetchHomeData()),
      child: Scaffold(
        backgroundColor: AppColors.dark100,
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            LabeledHeader(
              title: 'Transjatim',
              description: 'Aplikasi untuk kemudahan akses layanan bus Trans Jatim.',
              backgroundImage: 'lib/assets/images/transjatim_background.png',
              searchController: searchController,
              onBackPressed: () => Navigator.pop(context),
              onBookmarkPressed: () {},
            ),
            CustomTabBar(tabController: _tabController, tabs: const ['Layanan', 'Tentang']),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildLayananTab(),
                  const TransjatimTentangTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLayananTab() {
    return BlocBuilder<TransjatimBloc, TransjatimState>(
      builder: (context, state) {
        if (state.isLoading) return const Center(child: CircularProgressIndicator());
        if (state.error != null) return Center(child: Text(state.error!));

        return SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 32),
              
              /// TITLE TIKET
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Daftar Tiket', style: AppTextStyles.semiBold(AppTextStyles.h3).copyWith(color: AppColors.dark500)),
                    GestureDetector(
                      onTap: () => context.push(Routes.tiketTransjatim),
                      child: Text('Lihat Semua', style: AppTextStyles.medium(AppTextStyles.body1).copyWith(color: AppColors.blue300)),
                    ),
                  ],
                ),
              ),

              /// LIST TIKET
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                itemCount: state.homeTickets.length,
                itemBuilder: (context, index) {
                  final item = state.homeTickets[index];
                  return TransjatimTicketCard(
                    title: item.name,
                    price: 'Rp${item.price}',
                    image: 'lib/assets/images/transjatim_sample.png', // Fallback static image
                  );
                },
              ),

              /// TITLE RUTE
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Daftar Rute', style: AppTextStyles.semiBold(AppTextStyles.h3).copyWith(color: AppColors.dark500)),
                    GestureDetector(
                      onTap: () => context.push(Routes.ruteTransjatim),
                      child: Text('Lihat Semua', style: AppTextStyles.medium(AppTextStyles.body1).copyWith(color: AppColors.blue300)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              /// LIST RUTE
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: state.homeRoutes.length,
                itemBuilder: (context, index) {
                  final item = state.homeRoutes[index];
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
              ),
              const SizedBox(height: 24),
            ],
          ),
        );
      },
    );
  }
}