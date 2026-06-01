import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/auth_header_widget.dart';

class DetailBahanPokokPage extends StatefulWidget {
  const DetailBahanPokokPage({super.key});

  @override
  State<DetailBahanPokokPage> createState() =>
      _DetailBahanPokokPageState();
}

class _DetailBahanPokokPageState
    extends State<DetailBahanPokokPage> {
  final List<HargaDaerahItem> daerahItems = [
    HargaDaerahItem(
      daerah: 'Kab. Pamekasan',
      harga: 'Rp 45.000',
      isUp: true,
    ),
    HargaDaerahItem(
      daerah: 'Kab. Pamekasan',
      harga: 'Rp 45.000',
      isUp: true,
    ),
    HargaDaerahItem(
      daerah: 'Kab. Pamekasan',
      harga: 'Rp 45.000',
      isUp: true,
    ),
    HargaDaerahItem(
      daerah: 'Kab. Nganjuk',
      harga: 'Rp 45.000',
      isUp: false,
    ),
    HargaDaerahItem(
      daerah: 'Kab. Nganjuk',
      harga: 'Rp 45.000',
      isUp: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark100,
      body: Column(
        children: [
          AuthHeaderWidget(
            imagePath:
            'lib/assets/images/bahan_background.png',
            showTitle: true,
            title: 'Bawang Merah',
            onBackPressed: () {
              context.pop();
            },
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildHeroCard(),

                  const SizedBox(height: 14),

                  _buildChartCard(),

                  const SizedBox(height: 14),

                  Row(
                    children: [
                      Expanded(
                        child: _buildHighestCard(),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildLowestCard(),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Harga di Kota/Kab',
                          style: AppTextStyles.bold(
                            AppTextStyles.h4,
                          ),
                        ),
                      ),

                      Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          color:
                          AppColors.blue300,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.tune,
                          size: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  ...daerahItems.map(
                        (item) => Padding(
                      padding:
                      const EdgeInsets.only(
                        bottom: 10,
                      ),
                      child: _buildDaerahCard(
                        item,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.blue300,
        borderRadius:
        BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(
                  'Bawang Putih / kg',
                  style:
                  AppTextStyles.bold(
                    AppTextStyles.body1,
                  ).copyWith(
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 12),

                Container(
                  padding:
                  const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                    BorderRadius.circular(
                      100,
                    ),
                  ),
                  child: Row(
                    mainAxisSize:
                    MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.arrow_drop_down,
                        color:
                        Color(0xFF27AE60),
                      ),
                      Text(
                        'Rp 36.429',
                        style:
                        AppTextStyles.bold(
                          AppTextStyles.body2,
                        ).copyWith(
                          color: const Color(
                            0xFF27AE60,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Container(
            width: 82,
            height: 82,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding:
              const EdgeInsets.all(10),
              child: Image.asset(
                'lib/assets/images/bawang_putih.png',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChartCard() {
    return Container(
      height: 215,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
        BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Harga Bawang Putih',
                style:
                AppTextStyles.bold(
                  AppTextStyles.body1,
                ),
              ),
              const Spacer(),
              Text(
                '2026',
                style:
                AppTextStyles.medium(
                  AppTextStyles.body3,
                ),
              ),
            ],
          ),

          const SizedBox(height: 4),

          Text(
            '+Rp 2.000 (2%)',
            style:
            AppTextStyles.bold(
              AppTextStyles.body3,
            ).copyWith(
              color: const Color(
                0xFFFF0054,
              ),
            ),
          ),

          const Expanded(
            child: Center(
              child: Text(
                'Line Chart Area',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHighestCard() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFFF0054),
        borderRadius:
        BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          Text(
            'Harga Tertinggi',
            style:
            AppTextStyles.bold(
              AppTextStyles.body3,
            ).copyWith(
              color: Colors.white,
            ),
          ),
          Text(
            'Kab. Pamekasan',
            style:
            AppTextStyles.medium(
              AppTextStyles.body3,
            ).copyWith(
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Rp 45.000',
            style:
            AppTextStyles.bold(
              AppTextStyles.h3,
            ).copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLowestCard() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF27AE60),
        borderRadius:
        BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          Text(
            'Harga Terendah',
            style:
            AppTextStyles.bold(
              AppTextStyles.body3,
            ).copyWith(
              color: Colors.white,
            ),
          ),
          Text(
            'Kab. Nganjuk',
            style:
            AppTextStyles.medium(
              AppTextStyles.body3,
            ).copyWith(
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Rp 26.000',
            style:
            AppTextStyles.bold(
              AppTextStyles.h3,
            ).copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDaerahCard(
      HargaDaerahItem item,
      ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 18,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
        BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              item.daerah,
              style:
              AppTextStyles.medium(
                AppTextStyles.body1,
              ),
            ),
          ),

          Icon(
            item.isUp
                ? Icons.arrow_drop_up
                : Icons.arrow_drop_down,
            color: item.isUp
                ? const Color(
              0xFFFF0054,
            )
                : const Color(
              0xFF27AE60,
            ),
          ),

          Text(
            item.harga,
            style:
            AppTextStyles.bold(
              AppTextStyles.body1,
            ).copyWith(
              color: item.isUp
                  ? const Color(
                0xFFFF0054,
              )
                  : const Color(
                0xFF27AE60,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HargaDaerahItem {
  final String daerah;
  final String harga;
  final bool isUp;

  HargaDaerahItem({
    required this.daerah,
    required this.harga,
    required this.isUp,
  });
}