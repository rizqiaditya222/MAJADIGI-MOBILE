import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/auth_header_widget.dart';
import 'package:majadigi/injection_container.dart';
import 'package:majadigi/features/commodity/domain/entities/commodity_entity.dart';
import 'package:majadigi/features/commodity/presentation/bloc/commodity_bloc.dart';

class DetailBahanPokokPage extends StatefulWidget {
  final int commodityId;
  const DetailBahanPokokPage({super.key, required this.commodityId});

  @override
  State<DetailBahanPokokPage> createState() => _DetailBahanPokokPageState();
}

class _DetailBahanPokokPageState extends State<DetailBahanPokokPage> {
  
  String formatRp(double price) {
    String priceStr = price.toInt().toString();
    String result = '';
    int count = 0;
    for (int i = priceStr.length - 1; i >= 0; i--) {
      result = priceStr[i] + result;
      count++;
      if (count % 3 == 0 && i != 0) result = '.$result';
    }
    return 'Rp $result';
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => s1<CommodityBloc>()..add(FetchCommodityDetail(widget.commodityId)),
      child: Scaffold(
        backgroundColor: AppColors.dark100,
        body: BlocBuilder<CommodityBloc, CommodityState>(
          builder: (context, state) {
            if (state is CommodityLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CommodityError) {
              return Center(child: Text(state.message, style: const TextStyle(color: Colors.red)));
            } else if (state is CommodityDetailLoaded) {
              final detail = state.detail;
              
              // Mencari harga tertinggi dan terendah (mengabaikan harga 0)
              CityPriceEntity? highest;
              CityPriceEntity? lowest;
              
              if (detail.cityPrices.isNotEmpty) {
                final validPrices = detail.cityPrices.where((e) => e.price > 0).toList();
                if (validPrices.isNotEmpty) {
                  highest = validPrices.reduce((curr, next) => curr.price > next.price ? curr : next);
                  lowest = validPrices.reduce((curr, next) => curr.price < next.price ? curr : next);
                }
              }

              return Column(
                children: [
                  AuthHeaderWidget(
                    imagePath: 'lib/assets/images/bahan_background.png',
                    showTitle: true,
                    title: 'Detail Komoditas', // Bisa disesuaikan dengan passing name dari list
                    onBackPressed: () => context.pop(),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          _buildHeroCard(detail),
                          const SizedBox(height: 14),
                          _buildChartCard(detail),
                          const SizedBox(height: 14),
                          Row(
                            children: [
                              Expanded(child: _buildExtremesCard('Harga Tertinggi', highest, const Color(0xFFFF0054))),
                              const SizedBox(width: 12),
                              Expanded(child: _buildExtremesCard('Harga Terendah', lowest, const Color(0xFF27AE60))),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: Text('Harga di Kota/Kab', style: AppTextStyles.bold(AppTextStyles.h4)),
                              ),
                              Container(
                                width: 38, height: 38,
                                decoration: const BoxDecoration(color: AppColors.blue300, shape: BoxShape.circle),
                                child: const Icon(Icons.tune, size: 18, color: Colors.white),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          ...detail.cityPrices.where((c) => c.price > 0).map(
                                (item) => Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: _buildDaerahCard(item),
                                ),
                              ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  Widget _buildHeroCard(CommodityDetailEntity detail) {
    bool isUp = detail.status.toLowerCase() == 'naik';
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.blue300, borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Rata-rata Jawa Timur', style: AppTextStyles.bold(AppTextStyles.body1).copyWith(color: Colors.white)),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(100)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(isUp ? Icons.arrow_drop_up : Icons.arrow_drop_down, color: isUp ? const Color(0xFFFF0054) : const Color(0xFF27AE60)),
                      Text(
                        formatRp(detail.averagePrice),
                        style: AppTextStyles.bold(AppTextStyles.body2).copyWith(
                          color: isUp ? const Color(0xFFFF0054) : const Color(0xFF27AE60),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 82, height: 82,
            decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset('lib/assets/images/bawang_putih.png'), // Gambar statis sementara
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChartCard(CommodityDetailEntity detail) {
    return Container(
      height: 215,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Riwayat Harga', style: AppTextStyles.bold(AppTextStyles.body1)),
              const Spacer(),
              Text('30 Hari Terakhir', style: AppTextStyles.medium(AppTextStyles.body3)),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            'Status: ${detail.status.toUpperCase()}',
            style: AppTextStyles.bold(AppTextStyles.body3).copyWith(
              color: detail.status.toLowerCase() == 'naik' ? const Color(0xFFFF0054) : const Color(0xFF27AE60),
            ),
          ),
          const Expanded(
            child: Center(
              child: Text('Line Chart Area\n(Integrasi FlChart Nanti)'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExtremesCard(String title, CityPriceEntity? cityData, Color bgColor) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.bold(AppTextStyles.body3).copyWith(color: Colors.white)),
          Text(cityData?.city ?? 'Belum ada data', style: AppTextStyles.medium(AppTextStyles.body3).copyWith(color: Colors.white70), maxLines: 1, overflow: TextOverflow.ellipsis),
          const SizedBox(height: 8),
          Text(cityData != null ? formatRp(cityData.price) : '-', style: AppTextStyles.bold(AppTextStyles.h3).copyWith(color: Colors.white)),
        ],
      ),
    );
  }

  Widget _buildDaerahCard(CityPriceEntity item) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Expanded(child: Text(item.city, style: AppTextStyles.medium(AppTextStyles.body1))),
          Icon(item.isUp ? Icons.arrow_drop_up : Icons.arrow_drop_down, color: item.isUp ? const Color(0xFFFF0054) : const Color(0xFF27AE60)),
          Text(
            formatRp(item.price),
            style: AppTextStyles.bold(AppTextStyles.body1).copyWith(
              color: item.isUp ? const Color(0xFFFF0054) : const Color(0xFF27AE60),
            ),
          ),
        ],
      ),
    );
  }
}