import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:majadigi/core/router/app_router.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';
import 'package:majadigi/core/widgets/labeled_header.dart';
import 'package:majadigi/core/widgets/custom_tab_bar.dart';
import 'package:majadigi/injection_container.dart';
import 'package:majadigi/features/destinasi_wisata/presentation/bloc/destinasi_bloc.dart';
import 'widgets/destinasi_wisata_tentang_tab.dart';

class DestinasiWisataPage extends StatefulWidget {
  const DestinasiWisataPage({super.key});

  @override
  State<DestinasiWisataPage> createState() => _DestinasiWisataPage();
}

class _DestinasiWisataPage extends State<DestinasiWisataPage> with SingleTickerProviderStateMixin {
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
      create: (context) => s1<DestinasiBloc>()..add(FetchAllAndPopular()),
      child: Scaffold(
        backgroundColor: AppColors.dark100,
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            /// HEADER
            LabeledHeader(
              title: 'Destinasi Wisata',
              description: 'SIDITA merupakan media promosi dan informasi destinasi yang tersebar di Jawa Timur.',
              backgroundImage: 'lib/assets/images/background_wisata.png',
              searchController: searchController,
              onBackPressed: () => Navigator.pop(context),
              onBookmarkPressed: () {},
              showSearch: true,
            ),

            /// TAB BAR
            CustomTabBar(
              tabController: _tabController,
              tabs: const ['Layanan', 'Tentang'],
            ),

            /// TAB CONTENT
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildLayananTab(),
                  const DestinasiWisataTentangTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// TAB 1: LAYANAN
  Widget _buildLayananTab() {
    return BlocBuilder<DestinasiBloc, DestinasiState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.error != null) {
          return Center(child: Text(state.error!, style: const TextStyle(color: Colors.red)));
        }

        final wisataList = state.listAll;
        final populerList = state.listPopuler;

        return Column(
          children: [
            /// HORIZONTAL CARD (Semua Destinasi)
            SizedBox(
              height: 270,
              child: Container(
                width: double.infinity,
                color: AppColors.dark100,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: wisataList.map((wisata) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: GestureDetector(
                            onTap: () {
                              context.push(Routes.detailLayananDestinasiWisata, extra: wisata.id);
                              }, 
                            child: Container(
                              width: 216,
                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: wisata.imageUrl != null 
                                          ? Image.network(wisata.imageUrl!, height: 108, width: double.infinity, fit: BoxFit.cover, errorBuilder: (c, e, s) => Container(height: 108, color: Colors.grey))
                                          : Image.asset('lib/assets/images/wisata_sample.png', height: 108, width: double.infinity, fit: BoxFit.cover),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(wisata.name, style: AppTextStyles.semiBold(AppTextStyles.h3).copyWith(color: AppColors.dark500), maxLines: 2, overflow: TextOverflow.ellipsis),
                                          const SizedBox(height: 8),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const Padding(padding: EdgeInsets.only(top: 2), child: Icon(Icons.location_on, color: Color(0xFFE67E00), size: 16)),
                                              const SizedBox(width: 4),
                                              Expanded(child: Text(wisata.location, style: AppTextStyles.regular(AppTextStyles.body2).copyWith(color: AppColors.dark300), maxLines: 2, overflow: TextOverflow.ellipsis)),
                                            ],
                                          ),
                                          const Spacer(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),

            /// TITLE (Tempat Populer)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(child: Text('Tempat Populer', style: AppTextStyles.regular(AppTextStyles.h3).copyWith(color: AppColors.black))),
                  GestureDetector(
                    onTap: () => context.push(Routes.listLayananDestinasiWisata),
                    child: Text('lihat semua', style: AppTextStyles.medium(AppTextStyles.body1).copyWith(color: AppColors.blue300)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            /// LIST POPULER (Vertikal)
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  itemCount: populerList.length,
                  itemBuilder: (context, index) {
                    final wisata = populerList[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: GestureDetector(
                        onTap: () => context.push(Routes.detailLayananDestinasiWisata, extra: wisata.id),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(16)),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: wisata.imageUrl != null 
                                    ? Image.network(wisata.imageUrl!, width: 96, height: 96, fit: BoxFit.cover, errorBuilder: (c,e,s) => Container(width: 96, height: 96, color: Colors.grey))
                                    : Image.asset('lib/assets/images/wisata_sample.png', width: 96, height: 96, fit: BoxFit.cover),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(wisata.name, style: AppTextStyles.semiBold(AppTextStyles.h3).copyWith(color: AppColors.black), maxLines: 1, overflow: TextOverflow.ellipsis),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        const Icon(Icons.location_on, size: 18, color: Color(0xFFE67E00)),
                                        const SizedBox(width: 6),
                                        Expanded(child: Text(wisata.location, style: AppTextStyles.regular(AppTextStyles.body2).copyWith(color: AppColors.dark300), maxLines: 1, overflow: TextOverflow.ellipsis)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}