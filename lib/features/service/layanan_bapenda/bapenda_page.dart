import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/widgets/labeled_header.dart';
import 'package:majadigi/core/widgets/service_card.dart';
import 'package:majadigi/core/widgets/custom_tab_bar.dart';

import '../../../core/router/app_router.dart';
import 'widgets/bapenda_tentang_tab.dart';

class BapendaPage extends StatefulWidget {
  const BapendaPage({super.key});

  @override
  State<BapendaPage> createState() => _BapendaPage();
}

class _BapendaPage extends State<BapendaPage>
    with SingleTickerProviderStateMixin {
  final TextEditingController searchController = TextEditingController();
  late TabController _tabController;

  final List<Map<String, String>> layananList = [
    {
      'title': 'Pajak Kendaraan Bermotor',
      'description':
      'Lihat informasi pajak kendaraan bermotor dengan cepat dan mudah',
      'image': 'lib/assets/images/pajak_sample.png',
    },
    {
      'title': 'Nilai Jual Kendaraan Bermotor',
      'description':
      'Temukan Nilai Jual Kendaraan Bermotor terkini langsung dari sumber resmi.',
      'image': 'lib/assets/images/pajak_sample.png',
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

          // HEADER
          LabeledHeader(
            title: 'Bapenda Jatim',
            description:
            'informasi dan layanan Pajak Kendaraan Bermotor, Jual Kendaraan Bermotor & Pendapatan Asli Daerah.',
            backgroundImage:
            'lib/assets/images/bapenda_background.png',
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

          // CONTENT
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildLayananTab(),
                const BapendaTentangTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLayananTab() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        itemCount: layananList.length,
        itemBuilder: (context, index) {
          final layanan = layananList[index];

          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: ServiceCard(
              title: layanan['title']!,
              description: layanan['description']!,
              image: layanan['image']!,
              onPressed: () {
                if (layanan['title'] ==
                    'Pajak Kendaraan Bermotor') {
                  context.push(Routes.pajakBapenda);
                }
                else {
                  context.push(Routes.njkpBapenda);
                }

              },
            ),
          );
        },
      ),
    );
  }
}