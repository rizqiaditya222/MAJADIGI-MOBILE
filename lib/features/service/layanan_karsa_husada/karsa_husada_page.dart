import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';
import 'package:majadigi/core/widgets/index.dart';
import 'package:majadigi/core/widgets/labeled_header.dart';
import 'package:majadigi/features/service/layanan_dasa_husada/widget/summary_card.dart';

import '../../../core/router/app_router.dart';

class KarsaHusadaPage extends StatefulWidget {
  const KarsaHusadaPage({super.key});

  @override
  State<KarsaHusadaPage> createState() => _KarsaHusadaPageState();
}

class _KarsaHusadaPageState extends State<KarsaHusadaPage>
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
            title: 'RSUD Daha Husada',
            description:
            'Info ketersediaan kamar rawat RSUD Daha Husada Batu',
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
                const DasaHusadaTentangTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// TAB 1: LAYANAN
  Widget _buildLayananTab() {
    return Column(
      children: [
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
            headingRowColor: MaterialStateProperty.all(
              const Color(0xFFE8F0FB),
            ),
            columns: [
              DataColumn(
                label: Text(
                  'Ruang',
                  style: AppTextStyles.bold(
                    AppTextStyles.body3,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'Kelas',
                  style: AppTextStyles.bold(
                    AppTextStyles.body3,
                  ),
                ),
              ),
              DataColumn(
                numeric: true,
                label: Text(
                  'Kapasitas',
                  style: AppTextStyles.bold(
                    AppTextStyles.body3,
                  ),
                ),
              ),
              DataColumn(
                numeric: true,
                label: Text(
                  'Terisi',
                  style: AppTextStyles.bold(
                    AppTextStyles.body3,
                  ),
                ),
              ),
              DataColumn(
                numeric: true,
                label: Text(
                  'Tersedia',
                  style: AppTextStyles.bold(
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
                      style: AppTextStyles.bold(
                        AppTextStyles.body3,
                      ).copyWith(
                        color: item['ruang']!.contains('AMARILIS') ||
                                item['ruang']!.contains('CVCU')
                            ? const Color(0xFFFF0054)
                            : const Color(0xFFF39C12),
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      item['kelas']!,
                      style: AppTextStyles.medium(
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
                        color: Color(0xFFF39C12),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      item['tersedia']!,
                      style: const TextStyle(
                        color: Color(0xFF1FA55B),
                        fontWeight: FontWeight.w600,
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

/// TAB 2: TENTANG - COMPONENT LOKAL
class DasaHusadaTentangTab extends StatelessWidget {
  const DasaHusadaTentangTab({super.key});

  @override
  Widget build(BuildContext context) {
    return TentangTab(
      accordionItems: [
        AccordionItemData(
          title: 'Operasional',
          content: OperasionalContent(
            linkUrl: 'https://rsud.badung.go.id/',
            alamat:
            'Jl. Raya Sesetan, Sesetan, Denpasar, Bali 80223, Indonesia',
            jamOperasional: {
              'Senin': '08:00 - 20:00',
              'Selasa': '08:00 - 20:00',
              'Rabu': '08:00 - 20:00',
              'Kamis': '08:00 - 20:00',
              'Jumat': '08:00 - 20:00',
              'Sabtu': '08:00 - 17:00',
              'Minggu': '08:00 - 17:00',
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
            manfaatDescription:
            'RSUD Daha Husada adalah rumah sakit milik pemerintah daerah yang memberikan pelayanan kesehatan berkualitas dengan standar internasional untuk masyarakat umum.',
            manfaatItems: [
              'Pelayanan medis 24 jam dengan dokter spesialis berpengalaman',
              'Fasilitas perawatan intensif dan operasi modern',
              'Layanan farmasi lengkap dengan harga terjangkau',
              'Program kesehatan preventif dan edukasi masyarakat',
              'Sistem informasi kesehatan terintegrasi',
              'Kemitraan dengan berbagai asuransi kesehatan',
              'Tim medis dan paramedis profesional dan berkomitmen',
            ],
            prosedurTitle: 'Prosedur Pendaftaran',
            prosedurItems: [
              'Datang ke loket pendaftaran dengan membawa KTP atau identitas lainnya',
              'Isi formulir pendaftaran pasien dengan data yang lengkap dan benar',
              'Serahkan formulir kepada petugas untuk diproses',
              'Tunggu panggilan dan masuk ke ruang pemeriksaan dokter',
              'Lakukan pembayaran sesuai dengan jenis asuransi yang dimiliki',
            ],
          ),
        ),
        AccordionItemData(
          title: 'Tentang Layanan',
          content: TentangLayananContent(
            title: 'Tentang RSUD Daha Husada Batu',
            paragraphs: [
              'RSUD Daha Husada adalah Rumah Sakit Umum Daerah milik Pemerintah Kota Batu yang berkomitmen memberikan pelayanan kesehatan berkualitas, terjangkau, dan mudah diakses oleh seluruh masyarakat.',
              'Dengan fasilitas modern dan tenaga medis profesional, kami siap melayani segala kebutuhan kesehatan Anda mulai dari pemeriksaan umum hingga tindakan operasi yang kompleks.',
              'Visi kami adalah menjadi rumah sakit pilihan utama yang dipercaya masyarakat. Misi kami memberikan pelayanan kesehatan prima dengan teknologi terkini, sumber daya manusia yang kompeten, dan nilai-nilai kemanusiaan yang tinggi.',
              'Kami terus berinovasi dan meningkatkan kualitas pelayanan untuk memenuhi kebutuhan kesehatan masyarakat Kota Batu dan sekitarnya.',
            ],
          ),
        ),
      ],
    );
  }
}
