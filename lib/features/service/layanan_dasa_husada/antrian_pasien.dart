import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

// Import UI Core
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';
import 'package:majadigi/core/widgets/auth_header_widget.dart';
import 'widget/summary_card.dart';

// Import BLoC dan Entity dengan Absolute Path 
import 'package:majadigi/injection_container.dart';
import 'package:majadigi/features/daha_husada/presentation/bloc/antrian_bloc.dart';
import 'package:majadigi/features/daha_husada/domain/entities/daha_husada_entity.dart';

class AntrianPasienPage extends StatelessWidget {
  const AntrianPasienPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => s1<AntrianBloc>()..add(FetchPoliklinik()),
      child: const AntrianPasienView(),
    );
  }
}

class AntrianPasienView extends StatefulWidget {
  const AntrianPasienView({super.key});

  @override
  State<AntrianPasienView> createState() => _AntrianPasienViewState();
}

class _AntrianPasienViewState extends State<AntrianPasienView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark100,
      body: Column(
        children: [
          AuthHeaderWidget(
            imagePath: 'lib/assets/images/daha_husada_background.png',
            title: 'Antrian Pasien',
            showTitle: true,
            onBackPressed: () => context.pop(),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: BlocBuilder<AntrianBloc, AntrianState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Image.asset(
                          'lib/assets/images/antrian_illustration.png',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          errorBuilder: (c, e, s) => Container(
                              height: 120, color: Colors.grey.shade300, child: const Icon(Icons.image)),
                        ),
                      ),
                      const SizedBox(height: 16),

                      _buildFormCard(context, state),

                      if (state.isLoading)
                        const Padding(
                          padding: EdgeInsets.only(top: 24),
                          child: CircularProgressIndicator(),
                        ),

                      if (state.error != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 24),
                          child: Text(state.error!, style: const TextStyle(color: Colors.red)),
                        ),

                      if (state.antrianData != null && !state.isLoading) ...[
                        const SizedBox(height: 24),
                        _buildStatusCard(context, state.antrianData!),
                      ],
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormCard(BuildContext context, AntrianState state) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text('Info Antrian Pasien', style: AppTextStyles.bold(AppTextStyles.h2)),
              ),
              Text(
                'Sekarang',
                style: AppTextStyles.medium(AppTextStyles.body3).copyWith(color: const Color(0xFF9A9A9A)),
              ),
            ],
          ),
          const SizedBox(height: 28),
          
          Text('Pilih Poli', style: AppTextStyles.bold(AppTextStyles.body1)),
          const SizedBox(height: 10),
          _buildPoliDropdown(context, state),
          
          const SizedBox(height: 24),
          
          Text('Pilih Dokter', style: AppTextStyles.bold(AppTextStyles.body1)),
          const SizedBox(height: 10),
          _buildDokterDropdown(context, state),
          
          const SizedBox(height: 28),
          
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton(
              onPressed: (state.selectedPoli != null && state.selectedDokter != null)
                  ? () => context.read<AntrianBloc>().add(FetchInfoAntrian())
                  : null, 
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.blue300,
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
              child: Text(
                'Cek Antrian',
                style: AppTextStyles.bold(AppTextStyles.h2).copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPoliDropdown(BuildContext context, AntrianState state) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFDADADA)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<PoliklinikEntity>(
          value: state.selectedPoli,
          isExpanded: true,
          hint: const Text('Pilih Poli'),
          icon: const Icon(Icons.keyboard_arrow_down),
          items: state.poliList.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item.name),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) context.read<AntrianBloc>().add(ChangePoli(value));
          },
        ),
      ),
    );
  }

  Widget _buildDokterDropdown(BuildContext context, AntrianState state) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFDADADA)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<DokterEntity>(
          value: state.selectedDokter,
          isExpanded: true,
          hint: Text(state.selectedPoli == null ? 'Pilih poli terlebih dahulu' : 'Pilih Dokter'),
          icon: const Icon(Icons.keyboard_arrow_down),
          items: state.dokterList.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item.name),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) context.read<AntrianBloc>().add(ChangeDokter(value));
          },
        ),
      ),
    );
  }

  Widget _buildStatusCard(BuildContext context, AntrianEntity data) {
    double progress = data.totalQueue > 0 ? (data.served / data.totalQueue) : 0.0;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: const Color(0xFFBFD7FF)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text('Status Kapasitas Antrian', style: AppTextStyles.bold(AppTextStyles.h2)),
              ),
              InkWell(
                onTap: () => context.read<AntrianBloc>().add(ResetAntrian()),
                child: const Icon(Icons.close, color: Color(0xFF999999)),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            'Kapasitas harian: ${data.dailyCapacity} pasien',
            style: AppTextStyles.medium(AppTextStyles.body1).copyWith(color: const Color(0xFF999999)),
          ),
          const SizedBox(height: 24),

          SummaryCard(color: AppColors.blue300, icon: Icons.groups, value: data.totalQueue.toString(), label: 'Total Antrian'),
          const SizedBox(height: 12),
          SummaryCard(color: const Color(0xFF27AE60), icon: Icons.favorite_border, value: data.served.toString(), label: 'Antrian Telah Dilayani'),
          const SizedBox(height: 12),
          SummaryCard(color: const Color(0xFFF39C12), icon: Icons.calendar_month, value: data.queueNumber.toString(), label: 'Antrian Saat ini'),
          const SizedBox(height: 24),

          Row(
            children: [
              Expanded(child: Text('Kapasitas terisi', style: AppTextStyles.medium(AppTextStyles.body1))),
              Text('${data.served}/${data.totalQueue}',
                  style: AppTextStyles.medium(AppTextStyles.body2).copyWith(color: const Color(0xFF999999))),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 16,
              backgroundColor: const Color(0xFFF0F0F0),
              valueColor: const AlwaysStoppedAnimation(AppColors.blue300),
            ),
          ),
          const SizedBox(height: 24),
          
          _buildVisitInfo(data),
          
          const SizedBox(height: 20),
          _buildInformationCard(),
        ],
      ),
    );
  }

  Widget _buildVisitInfo(AntrianEntity data) {
    String tanggalSingkat = data.date.length > 15 ? data.date.substring(0, 15) : data.date;
    
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: const Color(0xFFF8F8F8), borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: _buildInfoColumn('Tanggal Kunjungan', tanggalSingkat)),
              Expanded(child: _buildInfoColumn('Poli', data.polychlinicName)),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(child: _buildInfoColumn('Dokter', data.doctorName)),
              Expanded(child: _buildInfoColumn('Jam Praktik', data.practiceTime)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoColumn(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.medium(AppTextStyles.body2).copyWith(color: const Color(0xFF999999))),
        const SizedBox(height: 6),
        Text(value, style: AppTextStyles.bold(AppTextStyles.body2)),
      ],
    );
  }

  Widget _buildInformationCard() {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(color: const Color(0xFFEAF2FF), borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text('Informasi Penting',
                    style: AppTextStyles.bold(AppTextStyles.h4).copyWith(color: AppColors.blue300)),
              ),
              const Icon(Icons.info, color: AppColors.blue300),
            ],
          ),
          const SizedBox(height: 16),
          _bullet('Waktu tunggu adalah estimasi dan dapat berubah'),
          _bullet('Harap datang 30 menit sebelum jam praktik dimulai'),
          _bullet('Bawa kartu identitas dan kartu BPJS (jika ada)'),
          _bullet('Data antrian diperbarui secara real-time'),
        ],
      ),
    );
  }

  Widget _bullet(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• '),
          Expanded(
            child: Text(text, style: AppTextStyles.medium(AppTextStyles.body1).copyWith(color: AppColors.blue300)),
          ),
        ],
      ),
    );
  }
}