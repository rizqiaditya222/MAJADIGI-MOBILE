import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/auth_header_widget.dart';
import 'widget/summary_card.dart';

class JadwalOperasiPage extends StatefulWidget {
  const JadwalOperasiPage({super.key});

  @override
  State<JadwalOperasiPage> createState() =>
      _JadwalOperasiPageState();
}

class _JadwalOperasiPageState
    extends State<JadwalOperasiPage> {
  final TextEditingController searchController =
  TextEditingController();

  final List<OperasiGroup> operasiData = [
    OperasiGroup(
      date: 'Senin, 04 Mei 2026',
      totalOperasi: 1,
      items: [
        OperasiItem(
          namaOperasi: 'Amputasi Besar',
          dokter: 'Dr. Syaiful Anwar',
          spesialis: 'Klinik Mata',
        ),
      ],
    ),
    OperasiGroup(
      date: 'Rabu, 06 Mei 2026',
      totalOperasi: 3,
      items: [
        OperasiItem(
          namaOperasi: 'Phaco',
          dokter: 'Dr. Syaiful Anwar',
          spesialis: 'Klinik Mata',
        ),
        OperasiItem(
          namaOperasi: 'Cek Mata',
          dokter: 'Dr. Syaiful Anwar',
          spesialis: 'Klinik Mata',
        ),
        OperasiItem(
          namaOperasi: 'Phaco',
          dokter: 'Dr. Syaiful Anwar',
          spesialis: 'Klinik Mata',
        ),
      ],
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
            'lib/assets/images/daha_husada_background.png',
            showTitle: true,
            title: 'Jadwal Operasi',
            onBackPressed: () {
              context.pop();
            },
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  /// SUMMARY
                  Text(
                    'Jadwal Operasi',
                    style: AppTextStyles.bold(
                      AppTextStyles.h4,
                    ),
                  ),

                  const SizedBox(height: 16),

                  SummaryCard(
                    color: const Color(0xFFFF0054),
                    icon: Icons.favorite,
                    value: '253',
                    title: 'Total Operasi',
                  ),

                  const SizedBox(height: 10),

                  SummaryCard(
                    color: const Color(0xFF23A55A),
                    icon: Icons.person_add_alt_1,
                    value: '0',
                    title: 'Selesai',
                  ),

                  const SizedBox(height: 10),

                  SummaryCard(
                    color: const Color(0xFFF39C12),
                    icon: Icons.calendar_month,
                    value: '99',
                    title: 'Terjadwal',
                  ),

                  const SizedBox(height: 24),

                  /// SEARCH
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 48,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                            BorderRadius.circular(
                              100,
                            ),
                            border: Border.all(
                              color: const Color(
                                0xFFE5E5E5,
                              ),
                            ),
                          ),
                          child: TextField(
                            controller:
                            searchController,
                            decoration:
                            const InputDecoration(
                              border:
                              InputBorder.none,
                              prefixIcon: Icon(
                                Icons.search,
                              ),
                              hintText:
                              'Cari Nama Operasi',
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 10),

                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(
                              0xFFE5E5E5,
                            ),
                          ),
                        ),
                        child: const Icon(
                          Icons.calendar_month,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  /// DROPDOWN
                  Container(
                    height: 52,
                    padding:
                    const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.circular(
                        100,
                      ),
                      border: Border.all(
                        color:
                        const Color(0xFFE5E5E5),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Semua Spesialis',
                            style:
                            AppTextStyles.medium(
                              AppTextStyles.body2,
                            ).copyWith(
                              color:
                              const Color(
                                0xFF999999,
                              ),
                            ),
                          ),
                        ),
                        const Icon(
                          Icons
                              .keyboard_arrow_down,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  /// LIST
                  ...operasiData.map(
                        (group) => Padding(
                      padding:
                      const EdgeInsets.only(
                        bottom: 24,
                      ),
                      child: _buildGroup(group),
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


  Widget _buildGroup(
      OperasiGroup group,
      ) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                group.date,
                style: AppTextStyles.bold(
                  AppTextStyles.h4,
                ),
              ),
            ),
            Text(
              '${group.totalOperasi} Operasi',
              style: AppTextStyles.medium(
                AppTextStyles.body2,
              ).copyWith(
                color: const Color(
                  0xFF666666,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        ...group.items.map(
              (item) => Padding(
            padding:
            const EdgeInsets.only(
              bottom: 10,
            ),
            child: _buildOperasiCard(item),
          ),
        ),
      ],
    );
  }

  Widget _buildOperasiCard(
      OperasiItem item,
      ) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
        BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(
                  item.namaOperasi,
                  style: AppTextStyles.bold(
                    AppTextStyles.body1,
                  ),
                ),

                const SizedBox(height: 4),

                Row(
                  children: [
                    const Icon(
                      Icons.favorite_border,
                      size: 14,
                      color: Color(
                        0xFFFF0054,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      item.dokter,
                      style:
                      AppTextStyles.medium(
                        AppTextStyles.body3,
                      ).copyWith(
                        color:
                        const Color(
                          0xFFFF0054,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Container(
            padding:
            const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: AppColors.blue300,
              borderRadius:
              BorderRadius.circular(
                100,
              ),
            ),
            child: Text(
              item.spesialis,
              style: AppTextStyles.medium(
                AppTextStyles.body3,
              ).copyWith(
                color: Colors.white,
              ),
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

  OperasiGroup({
    required this.date,
    required this.totalOperasi,
    required this.items,
  });
}

class OperasiItem {
  final String namaOperasi;
  final String dokter;
  final String spesialis;

  OperasiItem({
    required this.namaOperasi,
    required this.dokter,
    required this.spesialis,
  });
}