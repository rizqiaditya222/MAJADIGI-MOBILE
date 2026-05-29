import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:majadigi/core/router/app_router.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';
import 'package:majadigi/core/widgets/auth_header_widget.dart';

import 'package:majadigi/core/widgets/labeled_header.dart';
import 'package:majadigi/features/service/layanan_transjatim/transjatim_route_card.dart';
import 'package:majadigi/features/service/layanan_transjatim/transjatim_ticket_card.dart';

class TiketTransjatimPage extends StatefulWidget {
  const TiketTransjatimPage({super.key});

  @override
  State<TiketTransjatimPage> createState() => _TiketTransjatimPage();
}

class _TiketTransjatimPage extends State<TiketTransjatimPage> {
  final TextEditingController searchController = TextEditingController();

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
      'image': 'lib/assets/images/transjatim_sample.png',
    },
    {
      'title': 'Pelajar',
      'price': 'Rp5.000',
      'image': 'lib/assets/images/transjatim_sample.png',
    },
    {
      'title': 'SBY - GSK Umum',
      'price': 'Rp20.000',
      'image': 'lib/assets/images/transjatim_sample.png',
    },
    {
      'title': 'SBY - SDA Umum',
      'price': 'Rp15.000',
      'image': 'lib/assets/images/transjatim_sample.png',
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
            title: 'Daftar Tiket',
          ),

          const SizedBox(height: 32),

          /// CONTENT
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  /// =========================
                  /// TITLE TIKET
                  /// =========================
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 30,
                      right: 30,
                      bottom: 8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Umum',
                          style: AppTextStyles.semiBold(
                            AppTextStyles.h3,
                          ).copyWith(color: AppColors.dark500),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  /// =========================
                  /// LIST TIKET
                  /// =========================
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                    itemCount: ticketList.length,
                    itemBuilder: (context, index) {
                      final item = ticketList[index];

                      return TransjatimTicketCard(
                        title: item['title'],
                        price: item['price'],
                        image: item['image'],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
