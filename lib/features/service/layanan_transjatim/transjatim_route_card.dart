import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:majadigi/core/router/app_router.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';

class TransjatimRouteCard extends StatelessWidget {
  final int routeId;
  final String kode;
  final String route;
  final String destination;
  final String time;
  final String price;
  final String colorHex;

  const TransjatimRouteCard({
    super.key, required this.routeId, required this.kode,
    required this.route, required this.destination,
    required this.time, required this.price, required this.colorHex,
  });

  Color _parseColor(String hex) {
    String cleanHex = hex.replaceAll('#', '');
    if (cleanHex.length == 6) cleanHex = 'FF$cleanHex';
    return Color(int.parse(cleanHex, radix: 16));
  }

  @override
  Widget build(BuildContext context) {
    final routeColor = _parseColor(colorHex);

    return GestureDetector(
      onTap: () {
        context.push(Routes.detailRuteTransjatim, extra: routeId);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), border: Border.all(color: AppColors.dark150)),
        child: Column(
          children: [
            /// TOP
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(color: routeColor, borderRadius: BorderRadius.circular(8)),
                  child: Text(kode, style: AppTextStyles.bold(AppTextStyles.body2).copyWith(color: Colors.white)),
                ),
                const SizedBox(width: 16),
                Expanded(child: Text('TRANS JATIM', style: AppTextStyles.bold(AppTextStyles.h4).copyWith(color: Colors.grey, letterSpacing: 1))),
                const Icon(Icons.swap_horiz_rounded, color: AppColors.blue300, size: 30),
              ],
            ),
            const SizedBox(height: 24),

            /// CONTENT
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// LEFT
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Container(width: 12, height: 12, decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppColors.blue300, width: 2))),
                          Container(width: 2, height: 18, margin: const EdgeInsets.symmetric(vertical: 4), color: AppColors.blue200),
                          Container(width: 12, height: 12, decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppColors.blue300, width: 2))),
                        ],
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(route, style: AppTextStyles.semiBold(AppTextStyles.body2).copyWith(color: AppColors.dark500)),
                            const SizedBox(height: 12),
                            Text(destination, style: AppTextStyles.semiBold(AppTextStyles.body2).copyWith(color: AppColors.dark500)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                /// RIGHT
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.access_time_filled, color: Colors.pink, size: 18),
                        const SizedBox(width: 6),
                        Text(time, style: AppTextStyles.medium(AppTextStyles.body2).copyWith(color: Colors.pink, fontSize: 16)),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), border: Border.all(color: routeColor)),
                      child: Row(
                        children: [
                          Icon(Icons.payments_outlined, color: routeColor, size: 20),
                          const SizedBox(width: 8),
                          Text(price, style: AppTextStyles.bold(AppTextStyles.body2).copyWith(color: routeColor)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}