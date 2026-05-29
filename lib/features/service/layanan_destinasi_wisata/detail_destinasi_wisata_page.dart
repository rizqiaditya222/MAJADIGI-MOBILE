import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';
import 'package:majadigi/core/widgets/auth_header_widget.dart';

import '../../../core/widgets/primary_button.dart';

class DetailDestinasiWisataPage extends StatefulWidget {
  const DetailDestinasiWisataPage({super.key});

  @override
  State<DetailDestinasiWisataPage> createState() =>
      _DetailDestinasiWisataPageState();
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
    return Scaffold(
      backgroundColor: AppColors.white,

      body: SingleChildScrollView(
        child: Column(
          children: [
            /// IMAGE + HEADER
            Stack(
              children: [
                /// IMAGE
                SizedBox(
                  height: 420,
                  width: double.infinity,
                  child: Image.asset(
                    'lib/assets/images/wisata_sample.png',
                    fit: BoxFit.cover,
                  ),
                ),

                /// OVERLAY GRADIENT
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

                /// HEADER
                AuthHeaderWidget(
                  imagePath: 'lib/assets/images/background_wisata.png',
                  onBackPressed: () {
                    context.pop();
                  },
                ),

                /// IMAGE COUNT
                Positioned(
                  right: 16,
                  bottom: 90,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),

            /// CARD
            Transform.translate(
              offset: const Offset(0, 0),
              child: Container(
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
                    /// TITLE
                    Text(
                      'Ranu Kumbolo',
                      style: AppTextStyles.bold(
                        AppTextStyles.h2,
                      ).copyWith(color: AppColors.black),
                    ),

                    const SizedBox(height: 12),

                    /// LOCATION
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Color(0xFFE67E00),
                          size: 20,
                        ),

                        const SizedBox(width: 6),

                        Text(
                          'Lumajang, Jawa Timur',
                          style: AppTextStyles.regular(
                            AppTextStyles.body1,
                          ).copyWith(color: AppColors.dark300),
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

                      labelStyle: AppTextStyles.semiBold(
                        AppTextStyles.body1,
                      ).copyWith(fontSize: 16),

                      unselectedLabelStyle: AppTextStyles.regular(
                        AppTextStyles.body1,
                      ).copyWith(fontSize: 16),

                      tabs: const [
                        Tab(text: 'Tentang'),
                        Tab(text: 'Maps'),
                      ],
                    ),

                    const SizedBox(height: 24),

                    /// TAB CONTENT
                    SizedBox(
                      height: 280,
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          /// TENTANG
                          SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Deskripsi',
                                  style: AppTextStyles.bold(AppTextStyles.h3),
                                ),

                                const SizedBox(height: 12),

                                Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Arcu amet tempor, in massa, habitasse habitasse fermentum, sed faucibus. Augue arcu, ac proin accumsan urna morbi diam nunc, tincidunt. Ac turpis amet vitae dui aliquam vitae nunc. Non enim, lorem duis maecenas odio.',
                                  textAlign: TextAlign.justify,
                                  style:
                                      AppTextStyles.regular(
                                        AppTextStyles.body1,
                                      ).copyWith(
                                        color: AppColors.dark300,
                                        height: 1.8,
                                      ),
                                ),
                              ],
                            ),
                          ),

                          /// MAPS

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text(
                                'Lokasi Destinasi',
                                style: AppTextStyles.bold(AppTextStyles.h3),
                              ),

                              SizedBox(height: 24),

                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 220, // atur tinggi image di sini
                                  child: Image.asset(
                                    'lib/assets/images/wisata_sample.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          )

                        ],
                      ),
                    ),

                    const SizedBox(height: 32),

                    /// BUTTON
                    PrimaryButton(
                      label: 'Petunjuk Arah Maps',
                      onPressed: () {},
                      prefixIcon: const Icon(
                        Icons.map_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
