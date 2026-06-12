import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_map/flutter_map.dart'; // <-- Import Peta
import 'package:latlong2/latlong.dart';       // <-- Import Kordinat

import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';
import 'package:majadigi/core/widgets/auth_header_widget.dart';
import 'package:majadigi/injection_container.dart';
import 'package:majadigi/features/transjatim/presentation/bloc/transjatim_bloc.dart';

class DetailRoutePage extends StatelessWidget {
  final int routeId;
  const DetailRoutePage({super.key, required this.routeId});

  Color _parseColor(String hex) {
    String cleanHex = hex.replaceAll('#', '');
    if (cleanHex.length == 6) cleanHex = 'FF$cleanHex';
    return Color(int.parse(cleanHex, radix: 16));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => s1<TransjatimBloc>()..add(FetchRouteDetail(routeId)),
      child: Scaffold(
        backgroundColor: AppColors.dark100,
        body: Column(
          children: [
            /// HEADER
            AuthHeaderWidget(
              imagePath: 'lib/assets/images/transjatim_background.png',
              onBackPressed: () => context.pop(),
              showTitle: true, 
              title: 'Detail Rute',
            ),
            
            /// CONTENT
            Expanded(
              child: BlocBuilder<TransjatimBloc, TransjatimState>(
                builder: (context, state) {
                  if (state.isLoading) return const Center(child: CircularProgressIndicator());
                  if (state.error != null) return Center(child: Text(state.error!));
                  if (state.routeDetail == null) return const SizedBox();

                  final data = state.routeDetail!;
                  final routeColor = _parseColor(data.corridorColor);
                  final routeStr = data.destinations.isNotEmpty ? data.destinations[0] : '-';
                  final destStr = data.destinations.length > 1 ? data.destinations[1] : '-';
                  final halteList = data.stops ?? [];
                  
                  // Mengubah daftar halte menjadi daftar titik kordinat (LatLng)
                  final List<LatLng> routePoints = halteList
                      .map((halte) => LatLng(halte.latitude, halte.longitude))
                      .toList();
                  
                  // Menentukan titik tengah peta (mengambil halte pertama, atau default ke Surabaya jika kosong)
                  final mapCenter = routePoints.isNotEmpty 
                      ? routePoints[0] 
                      : const LatLng(-7.250445, 112.768845);

                  return SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        /// MAPS (SUDAH INTERAKTIF)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: SizedBox(
                            width: double.infinity, 
                            height: 320,
                            child: routePoints.isEmpty
                                ? const Center(child: Text('Data rute tidak tersedia'))
                                : FlutterMap(
                                    options: MapOptions(
                                      initialCenter: mapCenter,
                                      initialZoom: 10.5, // Zoom yang pas agar seluruh rute terlihat
                                    ),
                                    children: [
                                      TileLayer(
                                        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                        userAgentPackageName: 'com.majadigi.app',
                                      ),
                                      // PolylineLayer untuk menggambar garis rute
                                      PolylineLayer(
                                        polylines: [
                                          Polyline(
                                            points: routePoints,
                                            strokeWidth: 4.0,
                                            color: routeColor, // Warna garis mengikuti warna koridor
                                          ),
                                        ],
                                      ),
                                      // MarkerLayer untuk menggambar titik-titik halte
                                      MarkerLayer(
                                        markers: routePoints.map((point) {
                                          return Marker(
                                            point: point,
                                            width: 14,
                                            height: 14,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle,
                                                border: Border.all(color: routeColor, width: 3.5),
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ],
                                  ),
                          ),
                        ),
                        
                        const SizedBox(height: 16),
                        
                        /// ROUTE CARD
                        Container(
                          width: double.infinity, padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18), border: Border.all(color: const Color(0xFFE5E7EB))),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                                    decoration: BoxDecoration(color: routeColor, borderRadius: BorderRadius.circular(10)),
                                    child: Text(data.corridorName, style: AppTextStyles.bold(AppTextStyles.body3).copyWith(color: Colors.white)),
                                  ),
                                  const SizedBox(width: 10),
                                  const Icon(Icons.access_time_filled, color: Color(0xFFFF2D55), size: 16),
                                  const SizedBox(width: 4),
                                  Text(data.operatingTime, style: AppTextStyles.semiBold(AppTextStyles.body3).copyWith(color: const Color(0xFFFF2D55))),
                                  const Spacer(),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: routeColor)),
                                    child: Row(
                                      children: [
                                        Icon(Icons.payments_outlined, color: routeColor, size: 20),
                                        const SizedBox(width: 8),
                                        Text('Rp${data.price}', style: AppTextStyles.bold(AppTextStyles.body2).copyWith(color: routeColor)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 14),
                              SizedBox(
                                height: 110,
                                child: Stack(
                                  alignment: Alignment.centerRight,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 10),
                                          child: Column(
                                            children: [
                                              Container(width: 10, height: 10, decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle, border: Border.all(color: AppColors.blue300, width: 2))),
                                              Container(width: 2, height: 38, decoration: BoxDecoration(border: Border(left: BorderSide(color: AppColors.blue200, width: 2)))),
                                              Container(width: 10, height: 10, decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle, border: Border.all(color: AppColors.blue300, width: 2))),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(width: double.infinity, padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: const Color(0xFFD9D9D9))), child: Text(routeStr, maxLines: 1, overflow: TextOverflow.ellipsis, style: AppTextStyles.medium(AppTextStyles.body2))),
                                              const SizedBox(height: 14),
                                              Container(width: double.infinity, padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: const Color(0xFFD9D9D9))), child: Text(destStr, maxLines: 1, overflow: TextOverflow.ellipsis, style: AppTextStyles.medium(AppTextStyles.body2))),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 30),
                                      ],
                                    ),
                                    Positioned(
                                      right: 0,
                                      child: Container(width: 46, height: 46, decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.blue300), child: const Icon(Icons.arrow_forward_rounded, color: Colors.white, size: 24)),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        
                        const SizedBox(height: 16),
                        
                        /// HALTE LIST
                        Container(
                          width: double.infinity, height: 220, padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), border: Border.all(color: AppColors.dark150)),
                          child: Scrollbar(
                            thumbVisibility: true,
                            child: ListView.separated(
                              itemCount: halteList.length,
                              separatorBuilder: (_, __) => const SizedBox(height: 12),
                              itemBuilder: (context, index) {
                                final isLast = index == halteList.length - 1;
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        Container(width: 10, height: 10, decoration: BoxDecoration(color: routeColor, shape: BoxShape.circle)),
                                        if (!isLast) Container(width: 2, height: 24, color: routeColor),
                                      ],
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(child: Text(halteList[index].name, style: AppTextStyles.medium(AppTextStyles.body2).copyWith(color: AppColors.dark500))),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
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