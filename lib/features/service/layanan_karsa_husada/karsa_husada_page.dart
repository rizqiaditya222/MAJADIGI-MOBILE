import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';
import 'package:majadigi/core/widgets/index.dart';
import 'package:majadigi/core/widgets/labeled_header.dart';
import 'package:majadigi/features/service/layanan_dasa_husada/widget/summary_card.dart';

// Sesuaikan path import BLoC, Entity, dan Dependency Injection (s1)
import 'package:majadigi/injection_container.dart';
import 'package:majadigi/features/karsa_husada/domain/entities/karsa_husada_entity.dart';
import 'package:majadigi/features/karsa_husada/presentation/bloc/karsa_husada_bloc.dart';

import '../../../core/router/app_router.dart';

class KarsaHusadaPage extends StatelessWidget {
  const KarsaHusadaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => s1<KarsaHusadaBloc>()..add(FetchKamarKarsaHusada()),
      child: const KarsaHusadaView(),
    );
  }
}

class KarsaHusadaView extends StatefulWidget {
  const KarsaHusadaView({super.key});

  @override
  State<KarsaHusadaView> createState() => _KarsaHusadaViewState();
}

class _KarsaHusadaViewState extends State<KarsaHusadaView>
    with SingleTickerProviderStateMixin {
  final TextEditingController searchController = TextEditingController();
  late TabController _tabController;

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
            title: 'RSUD Karsa Husada',
            description: 'Info ketersediaan kamar rawat RSUD Karsa Husada Batu',
            backgroundImage: 'lib/assets/images/background_wisata.png',
            searchController: searchController,
            onBackPressed: () {
              Navigator.pop(context);
            },
            onBookmarkPressed: () {},
            showSearch: false,
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
                const KarsaHusadaTentangTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// TAB 1: LAYANAN (TERINTEGRASI BLOC)
  Widget _buildLayananTab() {
    return BlocBuilder<KarsaHusadaBloc, KarsaHusadaState>(
      builder: (context, state) {
        if (state is KarsaHusadaLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is KarsaHusadaError) {
          return Center(
              child: Text(state.message,
                  style: const TextStyle(color: Colors.red)));
        } else if (state is KarsaHusadaLoaded) {
          final summary = state.data.summary;
          final rooms = state.data.rooms;

          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Ketersediaan Kamar Rawat',
                              style: AppTextStyles.bold(AppTextStyles.h4)),
                          Text(
                            summary.lastUpdate.isNotEmpty 
                                ? summary.lastUpdate.substring(0, 10) 
                                : '',
                            style: AppTextStyles.medium(AppTextStyles.body3)
                                .copyWith(color: AppColors.dark300),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      SummaryCard(
                        color: const Color(0xFFFF0054),
                        icon: Icons.local_hospital,
                        value: summary.total.toString(),
                        title: 'Total Kamar Rawat',
                      ),
                      const SizedBox(height: 10),
                      SummaryCard(
                        color: const Color(0xFF1FA55B),
                        icon: Icons.person_add_alt_1,
                        value: summary.available.toString(),
                        title: 'Tersedia',
                      ),
                      const SizedBox(height: 10),
                      SummaryCard(
                        color: const Color(0xFFF39C12),
                        icon: Icons.meeting_room,
                        value: summary.occupied.toString(),
                        title: 'Terisi',
                      ),
                      const SizedBox(height: 28),
                      Text('Status Ketersediaan Ruangan',
                          style: AppTextStyles.bold(AppTextStyles.h4)),
                      const SizedBox(height: 16),
                      _buildTable(rooms),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }

  Widget _buildTable(List<KarsaHusadaRoomEntity> rooms) {
    if (rooms.isEmpty) {
      return const Center(child: Text('Tidak ada data ruangan.'));
    }

    return Container(
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
            headingRowColor: MaterialStateProperty.all(const Color(0xFFE8F0FB)),
            columns: [
              DataColumn(label: Text('Ruang', style: AppTextStyles.bold(AppTextStyles.body3))),
              DataColumn(label: Text('Kelas', style: AppTextStyles.bold(AppTextStyles.body3))),
              DataColumn(numeric: true, label: Text('Kapasitas', style: AppTextStyles.bold(AppTextStyles.body3))),
              DataColumn(numeric: true, label: Text('Terisi', style: AppTextStyles.bold(AppTextStyles.body3))),
              DataColumn(numeric: true, label: Text('Tersedia', style: AppTextStyles.bold(AppTextStyles.body3))),
            ],
            rows: rooms.map((item) {
              return DataRow(
                cells: [
                  DataCell(
                    Text(
                      item.name,
                      style: AppTextStyles.bold(AppTextStyles.body3).copyWith(
                        color: item.available == 0
                            ? const Color(0xFFFF0054)
                            : const Color(0xFFF39C12),
                      ),
                    ),
                  ),
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

/// TAB 2: TENTANG - COMPONENT LOKAL
class KarsaHusadaTentangTab extends StatelessWidget {
  const KarsaHusadaTentangTab({super.key});
  @override
  Widget build(BuildContext context) {
    return TentangTab(
      accordionItems: [
        AccordionItemData(
          title: 'Operasional',
          content: OperasionalContent(
            linkUrl: 'https://rsudkarsahusadabatu.jatimprov.go.id/',
            alamat: 'Jl. Ahmad Yani No.10-13, Ngaglik, Kec. Batu, Kota Batu, Jawa Timur 65311',
            jamOperasional: {
              'Senin': '08:00 - 20:00',
              'Selasa': '08:00 - 20:00',
              'Rabu': '08:00 - 20:00',
              'Kamis': '08:00 - 20:00',
              'Jumat': '08:00 - 20:00',
              'Sabtu': '08:00 - 17:00',
              'Minggu': 'Libur',
            },
            mediaSosial: [
              {'icon': Icons.camera_alt_outlined, 'label': 'Instagram'},
              {'icon': Icons.facebook_outlined, 'label': 'Facebook'},
              {'icon': Icons.language, 'label': 'Website'},
            ],
          ),
        ),
        AccordionItemData(
          title: 'Ketentuan Umum',
          content: KetentuanUmumContent(
            manfaatTitle: 'Manfaat Layanan',
            manfaatDescription: 'RSUD Karsa Husada memberikan layanan kesehatan yang prima dengan fasilitas terkini untuk seluruh masyarakat Jawa Timur.',
            manfaatItems: [
              'Pelayanan medis dengan dokter spesialis berpengalaman',
              'Fasilitas perawatan intensif dan operasi',
              'Layanan farmasi lengkap',
            ],
            prosedurTitle: 'Prosedur Pendaftaran',
            prosedurItems: [
              'Datang ke loket pendaftaran',
              'Isi formulir pendaftaran',
              'Tunggu panggilan',
            ],
          ),
        ),
      ],
    );
  }
}