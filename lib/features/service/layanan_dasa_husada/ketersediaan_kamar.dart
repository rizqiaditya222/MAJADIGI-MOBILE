import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/auth_header_widget.dart';
import 'widget/summary_card.dart';

class KetersediaanKamarPage extends StatelessWidget {
  const KetersediaanKamarPage({super.key});

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
            title: 'Ketersediaan Kamar',
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
                  Text(
                    'Ketersediaan Kamar Rawat',
                    style: AppTextStyles.bold(
                      AppTextStyles.h4,
                    ),
                  ),

                  const SizedBox(height: 16),

                  SummaryCard(
                    color: const Color(0xFFFF0054),
                    icon: Icons.local_hospital,
                    value: '253',
                    title: 'Total Kamar Rawat',
                  ),

                  const SizedBox(height: 10),

                  SummaryCard(
                    color: const Color(0xFF1FA55B),
                    icon: Icons.person_add_alt_1,
                    value: '154',
                    title: 'Tersedia',
                  ),

                  const SizedBox(height: 10),

                  SummaryCard(
                    color: const Color(0xFFF39C12),
                    icon: Icons.meeting_room,
                    value: '99',
                    title: 'Terisi',
                  ),

                  const SizedBox(height: 28),

                  Text(
                    'Status Ketersediaan Ruangan',
                    style: AppTextStyles.bold(
                      AppTextStyles.h4,
                    ),
                  ),

                  const SizedBox(height: 16),

                  _buildTable(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildTable() {
    final data = [
      {
        'ruang': 'AMARILIS A',
        'kelas': 'Kelas I',
        'kapasitas': '6',
        'terisi': '3',
        'tersedia': '3',
      },
      {
        'ruang': 'AMARILIS A',
        'kelas': 'Kelas I',
        'kapasitas': '6',
        'terisi': '3',
        'tersedia': '3',
      },
      {
        'ruang': 'CVCU',
        'kelas': 'Kelas I',
        'kapasitas': '6',
        'terisi': '3',
        'tersedia': '3',
      },
      {
        'ruang': 'EDELWIS A',
        'kelas': 'Kelas I',
        'kapasitas': '6',
        'terisi': '3',
        'tersedia': '3',
      },
      {
        'ruang': 'EDELWIS B',
        'kelas': 'Kelas I',
        'kapasitas': '6',
        'terisi': '3',
        'tersedia': '3',
      },
      {
        'ruang': 'AMARILIS A',
        'kelas': 'Kelas I',
        'kapasitas': '6',
        'terisi': '3',
        'tersedia': '3',
      },
      {
        'ruang': 'AMARILIS A',
        'kelas': 'Kelas I',
        'kapasitas': '6',
        'terisi': '3',
        'tersedia': '3',
      },
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
        BorderRadius.circular(16),
      ),
      child: ClipRRect(
        borderRadius:
        BorderRadius.circular(16),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            headingRowHeight: 48,
            dataRowMinHeight: 42,
            dataRowMaxHeight: 42,
            columnSpacing: 24,
            headingRowColor:
            MaterialStateProperty.all(
              const Color(0xFFE8F0FB),
            ),
            columns: [
              DataColumn(
                label: Text(
                  'Ruang',
                  style:
                  AppTextStyles.bold(
                    AppTextStyles.body3,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'Kelas',
                  style:
                  AppTextStyles.bold(
                    AppTextStyles.body3,
                  ),
                ),
              ),
              DataColumn(
                numeric: true,
                label: Text(
                  'Kapasitas',
                  style:
                  AppTextStyles.bold(
                    AppTextStyles.body3,
                  ),
                ),
              ),
              DataColumn(
                numeric: true,
                label: Text(
                  'Terisi',
                  style:
                  AppTextStyles.bold(
                    AppTextStyles.body3,
                  ),
                ),
              ),
              DataColumn(
                numeric: true,
                label: Text(
                  'Tersedia',
                  style:
                  AppTextStyles.bold(
                    AppTextStyles.body3,
                  ),
                ),
              ),
            ],
            rows: data.map((item) {
              return DataRow(
                cells: [
                  DataCell(
                    Text(
                      item['ruang']!,
                      style:
                      AppTextStyles.bold(
                        AppTextStyles.body3,
                      ).copyWith(
                        color: item['ruang']!
                            .contains(
                            'AMARILIS') ||
                            item['ruang']!
                                .contains(
                                'CVCU')
                            ? const Color(
                            0xFFFF0054)
                            : const Color(
                            0xFFF39C12),
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      item['kelas']!,
                      style:
                      AppTextStyles.medium(
                        AppTextStyles.body3,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      item['kapasitas']!,
                    ),
                  ),
                  DataCell(
                    Text(
                      item['terisi']!,
                      style: const TextStyle(
                        color:
                        Color(0xFFF39C12),
                        fontWeight:
                        FontWeight.w600,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      item['tersedia']!,
                      style: const TextStyle(
                        color:
                        Color(0xFF1FA55B),
                        fontWeight:
                        FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}