import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:majadigi/core/router/app_router.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';

import 'package:majadigi/core/widgets/labeled_header.dart';
import 'package:majadigi/core/widgets/custom_tab_bar.dart';
import 'package:majadigi/features/service/layanan_transjatim/transjatim_route_card.dart';
import 'package:majadigi/features/service/layanan_transjatim/transjatim_ticket_card.dart';
import 'widgets/transjatim_tentang_tab.dart';

class TransjatimPage extends StatefulWidget {
  const TransjatimPage({super.key});

  @override
  State<TransjatimPage> createState() =>
      _TransjatimPage();
}

class _TransjatimPage
    extends State<TransjatimPage> with SingleTickerProviderStateMixin {
  final TextEditingController searchController =
  TextEditingController();
  late TabController _tabController;

  /// =========================
  /// DATA DUMMY ROUTE
  /// =========================
  final List<Map<String, dynamic>> routeList = [
    {
      'kode': 'JTM1',
      'route': 'Sidoarjo via Surabaya',
      'destination': 'Gresik',
      'time': '05:00 - 21:00',
      'price': 'Rp20.000',
    },
    {
      'kode': 'JTM2',
      'route': 'Mojokerto via Surabaya',
      'destination': 'Surabaya',
      'time': '05:00 - 20:00',
      'price': 'Rp15.000',
    },
    {
      'kode': 'JTM3',
      'route': 'Lamongan via Gresik',
      'destination': 'Surabaya',
      'time': '04:30 - 22:00',
      'price': 'Rp18.000',
    },
  ];

  /// =========================
  /// DATA DUMMY TIKET
  /// =========================
  final List<Map<String, dynamic>> ticketList = [
    {
      'title': 'Umum',
      'price': 'Rp2.500',
      'image':
      'lib/assets/images/transjatim_sample.png',
    },
    {
      'title': 'Pelajar',
      'price': 'Rp5.000',
      'image':
      'lib/assets/images/transjatim_sample.png',
    },
    {
      'title': 'SBY - GSK Umum',
      'price': 'Rp20.000',
      'image':
      'lib/assets/images/transjatim_sample.png',
    },
    {
      'title': 'SBY - SDA Umum',
      'price': 'Rp15.000',
      'image':
      'lib/assets/images/transjatim_sample.png',
    },
  ];

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
    return Scaffold(
      backgroundColor: AppColors.dark100,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          /// HEADER
          LabeledHeader(
            title: 'Transjatim',
            description:
            'aplikasi untuk kemudahan akses layanan bus Trans Jatim.',
            backgroundImage:
            'lib/assets/images/transjatim_background.png',
            searchController: searchController,
            onBackPressed: () {
              Navigator.pop(context);
            },
            onBookmarkPressed: () {},
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
                const TransjatimTentangTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// TAB 1: LAYANAN
  Widget _buildLayananTab() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 32),

          /// TITLE TIKET
          Padding(
            padding: const EdgeInsets.only(
              left: 30,
              right: 30,
              bottom: 8,
            ),
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment
                  .spaceBetween,
              children: [
                Text(
                  'Daftar Tiket',
                  style:
                  AppTextStyles.semiBold(
                    AppTextStyles.h3,
                  ).copyWith(
                    color:
                    AppColors.dark500,
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    context.push(
                      Routes.tiketTransjatim,
                    );
                  },
                  child: Text(
                    'Lihat Semua',
                    style:
                    AppTextStyles.medium(
                      AppTextStyles.body1,
                    ).copyWith(
                      color:
                      AppColors.blue300,
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// LIST TIKET
          ListView.builder(
            shrinkWrap: true,
            physics:
            const NeverScrollableScrollPhysics(),
            padding:
            const EdgeInsets.fromLTRB(
              16,
              0,
              16,
              24,
            ),
            itemCount: ticketList.length,
            itemBuilder:
                (context, index) {
              final item =
              ticketList[index];

              return TransjatimTicketCard(
                title: item['title'],
                price: item['price'],
                image: item['image'],
              );
            },
          ),

          /// TITLE RUTE
          Padding(
            padding: const EdgeInsets.only(
              left: 30,
              right: 30,
              bottom: 8,
            ),
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment
                  .spaceBetween,
              children: [
                Text(
                  'Daftar Rute',
                  style:
                  AppTextStyles.semiBold(
                    AppTextStyles.h3,
                  ).copyWith(
                    color:
                    AppColors.dark500,
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    context.push(
                      Routes.ruteTransjatim,
                    );
                  },
                  child: Text(
                    'Lihat Semua',
                    style:
                    AppTextStyles.medium(
                      AppTextStyles.body1,
                    ).copyWith(
                      color:
                      AppColors.blue300,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          /// LIST RUTE
          ListView.builder(
            shrinkWrap: true,
            physics:
            const NeverScrollableScrollPhysics(),
            padding:
            const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            itemCount: routeList.length,
            itemBuilder:
                (context, index) {
              final item =
              routeList[index];

              return TransjatimRouteCard(
                kode: item['kode'],
                route: item['route'],
                destination:
                item['destination'],
                time: item['time'],
                price: item['price'],
              );
            },
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }
}