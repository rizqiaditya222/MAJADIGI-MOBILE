import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';
import 'package:majadigi/core/widgets/auth_header_widget.dart';
import 'package:majadigi/core/widgets/primary_button.dart';

// Import entity untuk menangkap data lemparan
import 'package:majadigi/features/bapenda/domain/entities/info_pajak_entity.dart';

class DetailPajakBapenda extends StatefulWidget {
  // 1. Tangkap datanya melalui constructor
  final InfoPajakEntity data;
  const DetailPajakBapenda({super.key, required this.data});

  @override
  State<DetailPajakBapenda> createState() => _DetailPajakBapendaState();
}

class _DetailPajakBapendaState extends State<DetailPajakBapenda> {
  // Fungsi formatter angka ke Rupiah
  String formatRp(int amount) {
    String priceStr = amount.toString();
    String result = '';
    int count = 0;
    for (int i = priceStr.length - 1; i >= 0; i--) {
      result = priceStr[i] + result;
      count++;
      if (count % 3 == 0 && i != 0) {
        result = '.$result';
      }
    }
    return 'Rp $result';
  }

  // Fungsi potong format tanggal agar lebih rapi
  String formatTanggal(String rawDate) {
    if (rawDate.length > 10) return rawDate.substring(0, 10);
    return rawDate;
  }

  @override
  Widget build(BuildContext context) {
    // 2. Gunakan datanya di seluruh UI
    final info = widget.data;

    return Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        body: Column(
          children: [
            AuthHeaderWidget(
              imagePath: 'lib/assets/images/bapenda_background.png',
              showTitle: true,
              title: 'Info Pajak Kendaraan Bermotor (PKB)',
              onBackPressed: () => context.pop(),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    /// SUCCESS CARD
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEAF8EF),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: const Color(0xFFB6E6C4)),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 76,
                            height: 76,
                            decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFFAEE8C0)),
                            child: const Center(
                              child: CircleAvatar(
                                radius: 24,
                                backgroundColor: Color(0xFF27AE60),
                                child: Icon(Icons.check, color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Hasil Pencarian',
                                        style: AppTextStyles.bold(AppTextStyles.h3).copyWith(color: const Color(0xFF1E874B)),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                                      decoration: BoxDecoration(color: const Color(0xFFAEE8C0), borderRadius: BorderRadius.circular(20)),
                                      child: Text(
                                        'Aktif',
                                        style: AppTextStyles.semiBold(AppTextStyles.body2).copyWith(color: const Color(0xFF1E874B)),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Informasi pajak kendaraan berhasil ditemukan',
                                  style: AppTextStyles.medium(AppTextStyles.body1).copyWith(color: const Color(0xFF1E874B)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    /// VEHICLE CARD
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Column(
                        children: [
                          // Blue Header with plat nomor
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(colors: [Color(0xFF156BFF), Color(0xFF119DFF)]),
                              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                            ),
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  radius: 24,
                                  backgroundColor: Colors.white,
                                  child: Icon(Icons.directions_car, color: Color(0xFF156BFF)),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        info.brand.toUpperCase(),
                                        style: AppTextStyles.bold(AppTextStyles.h3).copyWith(color: Colors.white),
                                      ),
                                      Text(
                                        info.model,
                                        style: AppTextStyles.medium(AppTextStyles.body1).copyWith(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                // Plat Nomor badge
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                                  child: Text(
                                    info.licensePlateNumber,
                                    style: AppTextStyles.semiBold(AppTextStyles.body1).copyWith(color: AppColors.blue300),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Vehicle detail info: 2x2 grid
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(child: _buildVehicleInfo(icon: Icons.palette, label: 'Warna', value: info.color)),
                                    Expanded(child: _buildVehicleInfo(icon: Icons.calendar_month, label: 'Tahun Buat', value: info.year)),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  children: [
                                    Expanded(child: _buildVehicleInfo(icon: Icons.directions_car, label: 'Model', value: info.model)),
                                    Expanded(child: _buildVehicleInfo(icon: Icons.monetization_on_outlined, label: 'Masa Pajak', value: formatTanggal(info.taxPeriod))),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    /// BIAYA PENUH TAHUNAN CARD
                    _buildBiayaTahunanCard(info),

                    const SizedBox(height: 24),

                    /// ESTIMASI BIAYA 5 TAHUN CARD
                    _buildEstimasi5TahunCard(info),

                    const SizedBox(height: 24),

                    /// INFO BOX
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5FAFF),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: const Color(0xFF9BC3FF)),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            radius: 14,
                            backgroundColor: AppColors.blue300,
                            child: Icon(Icons.info, size: 16, color: Colors.white),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              'Data mengacu pada informasi SAMSAT dan bersifat sementara. Periksa kembali dengan dokumen fisik kendaraan Anda.',
                              style: AppTextStyles.medium(AppTextStyles.body1).copyWith(color: AppColors.blue300),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    PrimaryButton(
                      label: 'Kembali',
                      onPressed: () => context.pop(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  Widget _buildVehicleInfo({required IconData icon, required String label, required String value}) {
    return Row(
      children: [
        CircleAvatar(
          radius: 18,
          backgroundColor: const Color(0xFFE8F1FF),
          child: Icon(icon, size: 18, color: AppColors.blue300),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Color(0xFF888888)),
            ),
            Text(
              value,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }

  Widget _buildBiayaTahunanCard(InfoPajakEntity info) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 18,
                backgroundColor: Color(0xFFE8F1FF),
                child: Icon(Icons.search, size: 18, color: AppColors.blue300),
              ),
              const SizedBox(width: 12),
              Text(
                'Biaya Penuh Tahunan',
                style: AppTextStyles.bold(AppTextStyles.h4).copyWith(color: Colors.black87),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // 3. Render list biaya tahunan secara dinamis dari API
          if (info.annualFees.isEmpty)
            const Text('Tidak ada data biaya tahunan')
          else
            ...info.annualFees.map((fee) => _buildRow(fee.annotation, formatRp(fee.value))),

          const SizedBox(height: 8),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            decoration: BoxDecoration(color: AppColors.blue300, borderRadius: BorderRadius.circular(16)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'TOTAL PAJAK',
                  style: AppTextStyles.bold(AppTextStyles.body1).copyWith(color: Colors.white, letterSpacing: 0.5),
                ),
                Text(
                  formatRp(info.totalPajak),
                  style: AppTextStyles.bold(AppTextStyles.h3).copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEstimasi5TahunCard(InfoPajakEntity info) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Color(0xFFE8F1FF),
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.manage_search, color: AppColors.blue300),
                ),
                const SizedBox(width: 12),
                Text(
                  'Estimasi Biaya 5 Tahun',
                  style: AppTextStyles.bold(AppTextStyles.h4).copyWith(color: AppColors.blue300),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                // 4. Render list biaya 5 tahunan secara dinamis
                if (info.fiveYearFees.isEmpty)
                  const Text('Tidak ada data biaya 5 tahunan')
                else
                  ...info.fiveYearFees.map((fee) => _buildRow(fee.annotation, formatRp(fee.value))),

                const SizedBox(height: 8),

                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF3E0),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xFFFFCC80)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 14,
                        backgroundColor: Color(0xFFFF9800),
                        child: Icon(Icons.info, size: 16, color: Colors.white),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Text(
                          'Biaya ini merupakan PNBP (Penerimaan Negara Bukan Pajak) yang dikenakan setiap 5 tahun saat penggantian plat nomor kendaraan.',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFFE65100)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}