import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/auth_header_widget.dart';
import 'widget/summary_card.dart';

class AntrianPasienPage extends StatefulWidget {
  const AntrianPasienPage({super.key});

  @override
  State<AntrianPasienPage> createState() =>
      _AntrianPasienPageState();
}

class _AntrianPasienPageState
    extends State<AntrianPasienPage> {
  bool showResult = true;

  String? selectedPoli;
  String? selectedDokter;

  final List<String> poliList = [
    'Klinik Mata',
    'Poli Umum',
    'Poli Anak',
    'Poli Gigi',
  ];

  final List<String> dokterList = [
    'dr. Darwan Triyono, Sp.M',
    'dr. Syaiful Anwar',
    'dr. Ahmad Fauzi',
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
            title: 'Antrian Pasien',
            showTitle: true,
            onBackPressed: () {
              context.pop();
            },
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius:
                    BorderRadius.circular(
                      24,
                    ),
                    child: Image.asset(
                      'lib/assets/images/antrian_illustration.png',
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),

                  const SizedBox(height: 16),

                  _buildFormCard(),

                  if (showResult) ...[
                    const SizedBox(height: 24),
                    _buildStatusCard(),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
        BorderRadius.circular(28),
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Info Antrian Pasien',
                  style: AppTextStyles.bold(
                    AppTextStyles.h2,
                  ),
                ),
              ),
              Text(
                '04-05-2026 17:51:22',
                style:
                AppTextStyles.medium(
                  AppTextStyles.body3,
                ).copyWith(
                  color:
                  const Color(0xFF9A9A9A),
                ),
              ),
            ],
          ),

          const SizedBox(height: 28),

          Text(
            'Pilih Poli',
            style: AppTextStyles.bold(
              AppTextStyles.body1,
            ),
          ),

          const SizedBox(height: 10),

          _buildPoliDropdown(),

          const SizedBox(height: 24),

          Text(
            'Pilih Dokter',
            style: AppTextStyles.bold(
              AppTextStyles.body1,
            ),
          ),

          const SizedBox(height: 10),

          _buildDokterDropdown(),

          const SizedBox(height: 28),

          SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  showResult = true;
                });
              },
              style:
              ElevatedButton.styleFrom(
                backgroundColor:
                AppColors.blue300,
                elevation: 0,
                shape:
                RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(
                    20,
                  ),
                ),
              ),
              child: Text(
                'Cek Antrian',
                style: AppTextStyles.bold(
                  AppTextStyles.h2,
                ).copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPoliDropdown() {
    return Container(
      padding:
      const EdgeInsets.symmetric(
        horizontal: 18,
      ),
      decoration: BoxDecoration(
        borderRadius:
        BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFFDADADA),
        ),
      ),
      child:
      DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedPoli,
          isExpanded: true,
          hint: const Text('Pilih'),
          icon: const Icon(
            Icons.keyboard_arrow_down,
          ),
          items: poliList.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedPoli = value;
            });
          },
        ),
      ),
    );
  }

  Widget _buildDokterDropdown() {
    return Container(
      padding:
      const EdgeInsets.symmetric(
        horizontal: 18,
      ),
      decoration: BoxDecoration(
        borderRadius:
        BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFFDADADA),
        ),
      ),
      child:
      DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedDokter,
          isExpanded: true,
          hint: const Text('Pilih'),
          icon: const Icon(
            Icons.keyboard_arrow_down,
          ),
          items: dokterList.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedDokter = value;
            });
          },
        ),
      ),
    );
  }

  Widget _buildStatusCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
        BorderRadius.circular(28),
        border: Border.all(
          color: const Color(0xFFBFD7FF),
        ),
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Status Kapasitas Antrian',
                  style: AppTextStyles.bold(
                    AppTextStyles.h2,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    showResult = false;
                  });
                },
                child: const Icon(
                  Icons.close,
                  color: Color(0xFF999999),
                ),
              ),
            ],
          ),

          const SizedBox(height: 4),

          Text(
            'Kapasitas harian: 1 pasien',
            style:
            AppTextStyles.medium(
              AppTextStyles.body1,
            ).copyWith(
              color:
              const Color(0xFF999999),
            ),
          ),

          const SizedBox(height: 24),

          SummaryCard(
            color: AppColors.blue300,
            icon: Icons.groups,
            value: '59',
            label: 'Total Antrian',
          ),

          const SizedBox(height: 12),

          SummaryCard(
            color: const Color(0xFF27AE60),
            icon: Icons.favorite_border,
            value: '55',
            label:
            'Antrian Telah Dilayani',
          ),

          const SizedBox(height: 12),

          SummaryCard(
            color: const Color(0xFFF39C12),
            icon: Icons.calendar_month,
            value: '4',
            label: 'Antrian Saat ini',
          ),

          const SizedBox(height: 24),

          Row(
            children: [
              Expanded(
                child: Text(
                  'Kapasitas terisi',
                  style:
                  AppTextStyles.medium(
                    AppTextStyles.body1,
                  ),
                ),
              ),
              Text(
                '55/59',
                style:
                AppTextStyles.medium(
                  AppTextStyles.body2,
                ).copyWith(
                  color:
                  const Color(0xFF999999),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          ClipRRect(
            borderRadius:
            BorderRadius.circular(
              100,
            ),
            child: LinearProgressIndicator(
              value: 55 / 59,
              minHeight: 16,
              backgroundColor:
              const Color(0xFFF0F0F0),
              valueColor:
              AlwaysStoppedAnimation(
                AppColors.blue300,
              ),
            ),
          ),

          const SizedBox(height: 24),

          _buildVisitInfo(),

          const SizedBox(height: 20),

          _buildInformationCard(),
        ],
      ),
    );
  }


  Widget _buildVisitInfo() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8F8),
        borderRadius:
        BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _buildInfoColumn(
                  'Tanggal Kunjungan',
                  'Selasa, 05 Mei 2026',
                ),
              ),
              Expanded(
                child: _buildInfoColumn(
                  'Poli',
                  'KLINIK MATA',
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: _buildInfoColumn(
                  'Dokter',
                  'dr. DARWAN TRIYONO, Sp.M',
                ),
              ),
              Expanded(
                child: _buildInfoColumn(
                  'Jam Praktik',
                  '09:00 - 11:00',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoColumn(
      String title,
      String value) {
    return Column(
      crossAxisAlignment:
      CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style:
          AppTextStyles.medium(
            AppTextStyles.body2,
          ).copyWith(
            color:
            const Color(0xFF999999),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          value,
          style:
          AppTextStyles.bold(
            AppTextStyles.body2,
          ),
        ),
      ],
    );
  }

  Widget _buildInformationCard() {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: const Color(0xFFEAF2FF),
        borderRadius:
        BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Informasi Penting',
                  style: AppTextStyles.bold(
                    AppTextStyles.h4,
                  ).copyWith(
                    color:
                    AppColors.blue300,
                  ),
                ),
              ),
              const Icon(
                Icons.info,
                color: AppColors.blue300,
              ),
            ],
          ),

          const SizedBox(height: 16),

          _bullet(
            'Waktu tunggu adalah estimasi dan dapat berubah',
          ),
          _bullet(
            'Harap datang 30 menit sebelum jam praktik dimulai',
          ),
          _bullet(
            'Bawa kartu identitas dan kartu BPJS (jika ada)',
          ),
          _bullet(
            'Data antrian diperbarui secara real-time',
          ),
        ],
      ),
    );
  }

  Widget _bullet(String text) {
    return Padding(
      padding:
      const EdgeInsets.only(
        bottom: 10,
      ),
      child: Row(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          const Text('• '),
          Expanded(
            child: Text(
              text,
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
    );
  }
}