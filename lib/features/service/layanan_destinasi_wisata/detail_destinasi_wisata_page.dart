import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';
import 'package:majadigi/core/widgets/auth_header_widget.dart';
import '../../../core/widgets/primary_button.dart';
import 'package:majadigi/injection_container.dart';
import 'package:majadigi/features/destinasi_wisata/presentation/bloc/destinasi_bloc.dart';

class DetailDestinasiWisataPage extends StatefulWidget {
  final int destinasiId;
  const DetailDestinasiWisataPage({super.key, required this.destinasiId});

  @override
  State<DetailDestinasiWisataPage> createState() => _DetailDestinasiWisataPageState();
}

class _DetailDestinasiWisataPageState extends State<DetailDestinasiWisataPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => s1<DestinasiBloc>()..add(FetchDetail(widget.destinasiId)),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: BlocBuilder<DestinasiBloc, DestinasiState>(
          builder: (context, state) {
            if (state.isLoading) return const Center(child: CircularProgressIndicator());
            if (state.error != null) return Center(child: Text(state.error!));
            if (state.detail == null) return const SizedBox();

            final data = state.detail!;
            final destinationPoint = LatLng(data.latitude, data.longitude);

            return SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: 420,
                        width: double.infinity,
                        child: data.imageUrl != null
                            ? Image.network(data.imageUrl!, fit: BoxFit.cover,
                                errorBuilder: (c, e, s) => Container(color: Colors.grey))
                            : Image.asset('lib/assets/images/wisata_sample.png', fit: BoxFit.cover),
                      ),
                      Container(
                        height: 420,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withOpacity(0.15),
                              Colors.transparent,
                              Colors.black.withOpacity(0.2),
                            ],
                          ),
                        ),
                      ),
                      AuthHeaderWidget(
                        imagePath: 'lib/assets/images/background_wisata.png',
                        onBackPressed: () => context.pop(),
                      ),
                    ],
                  ),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data.name,
                            style: AppTextStyles.bold(AppTextStyles.h2)
                                .copyWith(color: AppColors.black)),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            const Icon(Icons.location_on, color: Color(0xFFE67E00), size: 20),
                            const SizedBox(width: 6),
                            Expanded(
                              child: Text(data.location,
                                  style: AppTextStyles.regular(AppTextStyles.body1)
                                      .copyWith(color: AppColors.dark300)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),

                        TabBar(
                          controller: _tabController,
                          indicatorColor: AppColors.blue300,
                          dividerColor: Colors.transparent,
                          indicatorSize: TabBarIndicatorSize.tab,
                          labelColor: AppColors.blue300,
                          unselectedLabelColor: AppColors.dark300,
                          labelStyle: AppTextStyles.semiBold(AppTextStyles.body1)
                              .copyWith(fontSize: 16),
                          unselectedLabelStyle: AppTextStyles.regular(AppTextStyles.body1)
                              .copyWith(fontSize: 16),
                          tabs: const [Tab(text: 'Tentang'), Tab(text: 'Maps')],
                        ),
                        const SizedBox(height: 24),

                        SizedBox(
                          height: 280,
                          child: TabBarView(
                            controller: _tabController,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              /// TAB TENTANG
                              SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Deskripsi',
                                        style: AppTextStyles.bold(AppTextStyles.h3)),
                                    const SizedBox(height: 12),
                                    Text(
                                      data.description ?? 'Deskripsi tidak tersedia.',
                                      textAlign: TextAlign.justify,
                                      style: AppTextStyles.regular(AppTextStyles.body1)
                                          .copyWith(color: AppColors.dark300, height: 1.8),
                                    ),
                                  ],
                                ),
                              ),

                              /// TAB MAPS - FlutterMap
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Lokasi Destinasi',
                                      style: AppTextStyles.bold(AppTextStyles.h3)),
                                  const SizedBox(height: 24),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: SizedBox(
                                      width: double.infinity,
                                      height: 220,
                                      child: FlutterMap(
                                        options: MapOptions(
                                          initialCenter: destinationPoint,
                                          initialZoom: 15.0,
                                        ),
                                        children: [
                                          TileLayer(
                                            urlTemplate:
                                                'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                            userAgentPackageName: 'com.majadigi.app',
                                          ),
                                          MarkerLayer(
                                            markers: [
                                              Marker(
                                                point: destinationPoint,
                                                width: 50,
                                                height: 50,
                                                child: const Icon(
                                                  Icons.location_on,
                                                  color: Colors.red,
                                                  size: 40,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 32),
                        PrimaryButton(
                          label: 'Petunjuk Arah Maps',
                          onPressed: () {},
                          prefixIcon: const Icon(Icons.map_outlined,
                              color: Colors.white, size: 20),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}