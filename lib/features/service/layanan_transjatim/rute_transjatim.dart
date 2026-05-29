import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:majadigi/core/router/app_router.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';

import 'package:majadigi/core/widgets/labeled_header.dart';
import 'package:majadigi/features/service/layanan_transjatim/transjatim_route_card.dart';
import 'package:majadigi/features/service/layanan_transjatim/transjatim_ticket_card.dart';

import '../../../core/widgets/auth_header_widget.dart';

class RuteTransjatimPage extends StatefulWidget {
  const RuteTransjatimPage({super.key});

  @override
  State<RuteTransjatimPage> createState() =>
      _RuteTransjatimPage();
}

class _RuteTransjatimPage
    extends State<RuteTransjatimPage> {
  final TextEditingController searchController =
  TextEditingController();

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
    },{
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
    },{
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark100,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          /// HEADER
          AuthHeaderWidget(
            imagePath: 'lib/assets/images/transjatim_background.png',
            onBackPressed: () {
              context.pop();
            },
            showTitle: true,
            title: 'Daftar Rute',
          ),

          const SizedBox(height: 32),

          /// CONTENT
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [

                  /// =========================
                  /// TITLE RUTE
                  /// =========================
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
                          'Umum',
                          style:
                          AppTextStyles.semiBold(
                            AppTextStyles.h3,
                          ).copyWith(
                            color:
                            AppColors.dark500,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  /// =========================
                  /// LIST RUTE
                  /// =========================
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
            ),
          ),
        ],
      ),
    );
  }
}