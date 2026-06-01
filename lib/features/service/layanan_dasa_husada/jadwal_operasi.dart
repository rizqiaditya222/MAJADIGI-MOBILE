import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/auth_header_widget.dart';
import 'widget/summary_card.dart';

import 'package:majadigi/injection_container.dart';
import 'package:majadigi/features/daha_husada/presentation/bloc/operasi_bloc.dart';
import 'package:majadigi/features/daha_husada/domain/entities/daha_husada_entity.dart';

class JadwalOperasiPage extends StatelessWidget {
  const JadwalOperasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => s1<OperasiBloc>()..add(FetchOperasi()),
      child: const JadwalOperasiView(),
    );
  }
}

class JadwalOperasiView extends StatefulWidget {
  const JadwalOperasiView({super.key});

  @override
  State<JadwalOperasiView> createState() => _JadwalOperasiViewState();
}

class _JadwalOperasiViewState extends State<JadwalOperasiView> {
  final TextEditingController searchController = TextEditingController();

  // Fungsi pengelompokan operasi berdasarkan tanggal
  List<OperasiGroup> _groupOperasi(List<OperasiEntity> items) {
    Map<String, List<OperasiItem>> grouped = {};
    for (var item in items) {
      if (!grouped.containsKey(item.date)) {
        grouped[item.date] = [];
      }
      grouped[item.date]!.add(OperasiItem(
        namaOperasi: item.surgeryName,
        dokter: item.surgeonName,
        spesialis: item.polychlinicName,
      ));
    }

    return grouped.entries.map((e) => OperasiGroup(
      date: e.key,
      totalOperasi: e.value.length,
      items: e.value,
    )).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark100,
      body: Column(
        children: [
          AuthHeaderWidget(
            imagePath: 'lib/assets/images/daha_husada_background.png',
            showTitle: true,
            title: 'Jadwal Operasi',
            onBackPressed: () => context.pop(),
          ),

          Expanded(
            child: BlocBuilder<OperasiBloc, OperasiState>(
              builder: (context, state) {
                if (state is OperasiLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is OperasiError) {
                  return Center(child: Text(state.message, style: const TextStyle(color: Colors.red)));
                } else if (state is OperasiLoaded) {
                  final operasiList = state.operasiList;
                  final groupedData = _groupOperasi(operasiList);

                  return SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Jadwal Operasi', style: AppTextStyles.bold(AppTextStyles.h4)),
                        const SizedBox(height: 16),

                        SummaryCard(
                          color: const Color(0xFFFF0054),
                          icon: Icons.favorite,
                          value: operasiList.length.toString(), // Dinamis dari API
                          title: 'Total Operasi',
                        ),
                        const SizedBox(height: 10),

                        // Placeholder statis karena di API list operasi tidak ada status 'Selesai'
                        const SummaryCard(color: Color(0xFF23A55A), icon: Icons.person_add_alt_1, value: '0', title: 'Selesai'),
                        const SizedBox(height: 10),

                        SummaryCard(
                          color: const Color(0xFFF39C12),
                          icon: Icons.calendar_month,
                          value: operasiList.length.toString(), 
                          title: 'Terjadwal',
                        ),

                        const SizedBox(height: 24),

                        // Fitur Search (UI Saja, logika filter search bisa ditambahkan nanti)
                        _buildSearchBox(),
                        const SizedBox(height: 12),
                        _buildDropdownSpesialis(),
                        const SizedBox(height: 24),

                        // Render List Operasi yang sudah dikelompokkan
                        if (groupedData.isEmpty)
                          const Center(child: Text('Tidak ada jadwal operasi.'))
                        else
                          ...groupedData.map((group) => Padding(
                                padding: const EdgeInsets.only(bottom: 24),
                                child: _buildGroup(group),
                              )),
                      ],
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBox() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 48,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: const Color(0xFFE5E5E5)),
            ),
            child: TextField(
              controller: searchController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search),
                hintText: 'Cari Nama Operasi',
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          width: 48, height: 48,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFFE5E5E5)),
          ),
          child: const Icon(Icons.calendar_month),
        ),
      ],
    );
  }

  Widget _buildDropdownSpesialis() {
    return Container(
      height: 52,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: const Color(0xFFE5E5E5)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Semua Spesialis',
              style: AppTextStyles.medium(AppTextStyles.body2).copyWith(color: const Color(0xFF999999)),
            ),
          ),
          const Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }

  Widget _buildGroup(OperasiGroup group) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Text(group.date, style: AppTextStyles.bold(AppTextStyles.h4))),
            Text(
              '${group.totalOperasi} Operasi',
              style: AppTextStyles.medium(AppTextStyles.body2).copyWith(color: const Color(0xFF666666)),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ...group.items.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: _buildOperasiCard(item),
          ),
        ),
      ],
    );
  }

  Widget _buildOperasiCard(OperasiItem item) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.namaOperasi, style: AppTextStyles.bold(AppTextStyles.body1)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.favorite_border, size: 14, color: Color(0xFFFF0054)),
                    const SizedBox(width: 4),
                    Text(
                      item.dokter,
                      style: AppTextStyles.medium(AppTextStyles.body3).copyWith(color: const Color(0xFFFF0054)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(color: AppColors.blue300, borderRadius: BorderRadius.circular(100)),
            child: Text(
              item.spesialis,
              style: AppTextStyles.medium(AppTextStyles.body3).copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class OperasiGroup {
  final String date;
  final int totalOperasi;
  final List<OperasiItem> items;

  OperasiGroup({required this.date, required this.totalOperasi, required this.items});
}

class OperasiItem {
  final String namaOperasi;
  final String dokter;
  final String spesialis;

  OperasiItem({required this.namaOperasi, required this.dokter, required this.spesialis});
}