import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/auth_header_widget.dart';
import 'widget/summary_card.dart';

// Sesuaikan path import ini dengan struktur foldermu
import 'package:majadigi/injection_container.dart';
import 'package:majadigi/features/daha_husada/presentation/bloc/kamar_bloc.dart';
import 'package:majadigi/features/daha_husada/domain/entities/daha_husada_entity.dart';

class KetersediaanKamarPage extends StatelessWidget {
  const KetersediaanKamarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => s1<KamarBloc>()..add(FetchKamar()),
      child: Scaffold(
        backgroundColor: AppColors.dark100,
        body: Column(
          children: [
            AuthHeaderWidget(
              imagePath: 'lib/assets/images/daha_husada_background.png',
              showTitle: true,
              title: 'Ketersediaan Kamar',
              onBackPressed: () {
                context.pop();
              },
            ),
            Expanded(
              child: BlocBuilder<KamarBloc, KamarState>(
                builder: (context, state) {
                  if (state is KamarLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is KamarError) {
                    return Center(
                      child: Text(state.message, style: const TextStyle(color: Colors.red)),
                    );
                  } else if (state is KamarLoaded) {
                    final summary = state.data.summary;
                    final rooms = state.data.rooms;

                    return SingleChildScrollView(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ketersediaan Kamar Rawat',
                            style: AppTextStyles.bold(AppTextStyles.h4),
                          ),
                          const SizedBox(height: 16),
                          SummaryCard(
                            color: const Color(0xFFFF0054),
                            icon: Icons.local_hospital,
                            value: summary.total.toString(), // Data dinamis Total Kamar
                            title: 'Total Kamar Rawat',
                          ),
                          const SizedBox(height: 10),
                          SummaryCard(
                            color: const Color(0xFF1FA55B),
                            icon: Icons.person_add_alt_1,
                            value: summary.available.toString(), // Data dinamis Tersedia
                            title: 'Tersedia',
                          ),
                          const SizedBox(height: 10),
                          SummaryCard(
                            color: const Color(0xFFF39C12),
                            icon: Icons.meeting_room,
                            value: summary.occupied.toString(), // Data dinamis Terisi
                            title: 'Terisi',
                          ),
                          const SizedBox(height: 28),
                          Text(
                            'Status Ketersediaan Ruangan',
                            style: AppTextStyles.bold(AppTextStyles.h4),
                          ),
                          const SizedBox(height: 16),
                          _buildTable(rooms), // Mengirim data list ruangan ke fungsi tabel
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
      ),
    );
  }

  Widget _buildTable(List<RuanganItemEntity> rooms) {
    if (rooms.isEmpty) {
      return const Center(child: Text("Tidak ada data ruangan"));
    }

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            headingRowHeight: 48,
            dataRowMinHeight: 42,
            dataRowMaxHeight: 42,
            columnSpacing: 24,
            headingRowColor: WidgetStateProperty.all(const Color(0xFFE8F0FB)), // Perbaikan MaterialStateProperty usang
            columns: [
              DataColumn(label: Text('Ruang', style: AppTextStyles.bold(AppTextStyles.body3))),
              DataColumn(label: Text('Kelas', style: AppTextStyles.bold(AppTextStyles.body3))),
              DataColumn(numeric: true, label: Text('Kapasitas', style: AppTextStyles.bold(AppTextStyles.body3))),
              DataColumn(numeric: true, label: Text('Terisi', style: AppTextStyles.bold(AppTextStyles.body3))),
              DataColumn(numeric: true, label: Text('Tersedia', style: AppTextStyles.bold(AppTextStyles.body3))),
            ],
            rows: rooms.map((item) {
              // Logika warna untuk UI temanmu (Merah untuk ruangan tertentu, Kuning untuk yang lain)
              Color ruangColor = item.name.contains('AMARILIS') || item.name.contains('CVCU')
                  ? const Color(0xFFFF0054)
                  : const Color(0xFFF39C12);

              return DataRow(
                cells: [
                  DataCell(Text(item.name, style: AppTextStyles.bold(AppTextStyles.body3).copyWith(color: ruangColor))),
                  DataCell(Text(item.type, style: AppTextStyles.medium(AppTextStyles.body3))),
                  DataCell(Text(item.total.toString())),
                  DataCell(
                    Text(item.occupied.toString(),
                        style: const TextStyle(color: Color(0xFFF39C12), fontWeight: FontWeight.w600)),
                  ),
                  DataCell(
                    Text(item.available.toString(),
                        style: const TextStyle(color: Color(0xFF1FA55B), fontWeight: FontWeight.w600)),
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