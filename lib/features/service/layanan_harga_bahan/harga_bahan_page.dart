import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:majadigi/core/router/app_router.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';
import 'package:majadigi/core/widgets/custom_tab_bar.dart';
import 'package:majadigi/core/widgets/labeled_header.dart';
import 'package:majadigi/injection_container.dart';

// Sesuaikan path import BLoC & Entity
import 'package:majadigi/features/commodity/domain/entities/commodity_entity.dart';
import 'package:majadigi/features/commodity/presentation/bloc/commodity_bloc.dart';

class HargaBahanPokokPage extends StatefulWidget {
  const HargaBahanPokokPage({super.key});

  @override
  State<HargaBahanPokokPage> createState() => _HargaBahanPokokPageState();
}

class _HargaBahanPokokPageState extends State<HargaBahanPokokPage> with SingleTickerProviderStateMixin {
  final TextEditingController searchController = TextEditingController();
  late TabController _tabController;
  late PageController _pageController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    searchController.dispose();
    super.dispose();
  }

  // Fungsi formatter angka ke Rupiah
  String formatRp(double price) {
    String priceStr = price.toInt().toString();
    String result = '';
    int count = 0;
    for (int i = priceStr.length - 1; i >= 0; i--) {
      result = priceStr[i] + result;
      count++;
      if (count % 3 == 0 && i != 0) {
        result = '.$result';
      }
    }
    return 'Rp $result';
  }

  // Fungsi memecah list panjang menjadi per halaman (6 item per halaman)
  List<List<CommodityEntity>> _getPages(List<CommodityEntity> items) {
    List<List<CommodityEntity>> result = [];
    for (int i = 0; i < items.length; i += 6) {
      result.add(items.sublist(i, i + 6 > items.length ? items.length : i + 6));
    }
    return result;
  }

  void _showFilterSheet() {
    // Isi bottom sheet filter (tetap seperti kode aslimu, disembunyikan agar ringkas di contoh ini)
    // ... 
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    // Bungkus dengan BlocProvider
    return BlocProvider(
      create: (context) => s1<CommodityBloc>()..add(FetchCommodities()),
      child: Scaffold(
        backgroundColor: AppColors.dark100,
        body: Column(
          children: [
            LabeledHeader(
              title: 'Harga Bahan Pokok',
              description: 'Informasi harian seputar harga bahan pokok',
              backgroundImage: 'lib/assets/images/bahan_background.png',
              searchController: searchController,
              showSearch: true,
              showFilterButton: true,
              searchHintText: 'Cari data bahan pokok',
              onFilterPressed: _showFilterSheet,
              // INI SOLUSI TOMBOL BACK YANG MACET:
              onBackPressed: () => context.pop(), 
            ),
            CustomTabBar(
              tabController: _tabController,
              tabs: const ['Layanan', 'Tentang'],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // --- TAB LAYANAN DENGAN BLOC BUILDER ---
                  BlocBuilder<CommodityBloc, CommodityState>(
                    builder: (context, state) {
                      if (state is CommodityLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is CommodityError) {
                        return Center(child: Text(state.message, style: const TextStyle(color: Colors.red)));
                      } else if (state is CommodityLoaded) {
                        final pages = _getPages(state.commodities);
                        if (pages.isEmpty) {
                          return const Center(child: Text('Tidak ada data komoditas.'));
                        }

                        return _buildLayananTab(pages);
                      }
                      return const SizedBox();
                    },
                  ),
                  // --- TAB TENTANG ---
                  const Center(child: Text('Tentang Harga Bahan Pokok')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLayananTab(List<List<CommodityEntity>> pages) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: pages.length,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            itemBuilder: (context, pageIndex) {
              final pageItems = pages[pageIndex];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: pageItems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) {
                    return _buildCard(pageItems[index]);
                  },
                ),
              );
            },
          ),
        ),
        // Indicator Titik Halaman
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              pages.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: currentPage == index ? 8 : 6,
                height: currentPage == index ? 8 : 6,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentPage == index ? AppColors.blue300 : const Color(0xFFD9D9D9),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCard(CommodityEntity item) {
    return GestureDetector(
      onTap: () {
      context.push(Routes.detailHargaBahanPokok, extra: item.id);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Gambar statis sementara karena API tidak merespons gambar
            Image.asset(
              'lib/assets/images/bawang_merah.png', 
              width: 84,
              height: 84,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 4),
            Text(
              item.name,
              textAlign: TextAlign.center,
              style: AppTextStyles.medium(AppTextStyles.body3),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.isUp ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                  color: item.isUp ? const Color(0xFFFF0054) : const Color(0xFF27AE60),
                ),
                Text(
                  formatRp(item.averagePrice),
                  style: AppTextStyles.bold(AppTextStyles.body2).copyWith(
                    color: item.isUp ? const Color(0xFFFF0054) : const Color(0xFF27AE60),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}