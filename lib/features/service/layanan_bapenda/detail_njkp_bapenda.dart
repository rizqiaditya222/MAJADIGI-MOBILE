import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';
import 'package:majadigi/core/widgets/auth_header_widget.dart';
import 'package:majadigi/core/widgets/primary_button.dart';

// Import entity
import 'package:majadigi/features/bapenda/domain/entities/njkb_entity.dart';

class DetailNjkpBapenda extends StatelessWidget {
  // Tangkap data dari router
  final NjkbResultEntity data;
  const DetailNjkpBapenda({super.key, required this.data});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        body: Column(
          children: [
            AuthHeaderWidget(
              imagePath: 'lib/assets/images/bapenda_background.png',
              showTitle: true,
              title: 'Info Nilai Jual Kendaraan Bermotor (NJKB)',
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
                      decoration: BoxDecoration(color: const Color(0xFFEAF8EF), borderRadius: BorderRadius.circular(24), border: Border.all(color: const Color(0xFFB6E6C4))),
                      child: Row(
                        children: [
                          Container(
                            width: 76, height: 76,
                            decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFFAEE8C0)),
                            child: const Center(
                              child: CircleAvatar(radius: 24, backgroundColor: Color(0xFF27AE60), child: Icon(Icons.check, color: Colors.white)),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(child: Text('Hasil Pencarian', style: AppTextStyles.bold(AppTextStyles.h3).copyWith(color: const Color(0xFF1E874B)))),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                                      decoration: BoxDecoration(color: const Color(0xFFAEE8C0), borderRadius: BorderRadius.circular(20)),
                                      child: Text('Aktif', style: AppTextStyles.semiBold(AppTextStyles.body2).copyWith(color: const Color(0xFF1E874B))),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text('Informasi NJKB berhasil ditemukan', style: AppTextStyles.medium(AppTextStyles.body1).copyWith(color: const Color(0xFF1E874B))),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    /// VEHICLE CARD
                    Container(
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(colors: [Color(0xFF156BFF), Color(0xFF119DFF)]),
                              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                            ),
                            child: Row(
                              children: [
                                const CircleAvatar(radius: 24, backgroundColor: Colors.white, child: Icon(Icons.directions_car, color: Color(0xFF156BFF))),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(data.brand.toUpperCase(), style: AppTextStyles.bold(AppTextStyles.h3).copyWith(color: Colors.white)),
                                      Text(data.typeCode, style: AppTextStyles.medium(AppTextStyles.body1).copyWith(color: Colors.white)),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                                  child: Text(data.year, style: AppTextStyles.semiBold(AppTextStyles.body1).copyWith(color: AppColors.blue300)),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      const CircleAvatar(radius: 18, backgroundColor: Color(0xFFE8F1FF), child: Icon(Icons.directions_car, size: 18, color: AppColors.blue300)),
                                      const SizedBox(width: 6),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Kode Model', style: AppTextStyles.medium(AppTextStyles.body1)),
                                          Text(data.typeCode, style: AppTextStyles.semiBold(AppTextStyles.body2)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    /// DETAIL CARD (Dinamis dari list 'details')
                    _buildDetailCard(data.details),
                    const SizedBox(height: 24),

                    /// PNBP CARD (Dinamis dari list 'pnbp')
                    _buildPnbpCard(data.pnbp),
                    const SizedBox(height: 24),

                    /// INFO BOX
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(color: const Color(0xFFF5FAFF), borderRadius: BorderRadius.circular(20), border: Border.all(color: const Color(0xFF9BC3FF))),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CircleAvatar(radius: 14, backgroundColor: AppColors.blue300, child: Icon(Icons.info, size: 16, color: Colors.white)),
                          const SizedBox(width: 16),
                          Expanded(child: Text('Data mengacu pada informasi SAMSAT dan bersifat sementara. Periksa kembali dengan dokumen fisik kendaraan Anda.', style: AppTextStyles.medium(AppTextStyles.body1).copyWith(color: AppColors.blue300))),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    PrimaryButton(label: 'Kembali', onPressed: () => context.pop()),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  Widget _buildRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Expanded(child: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
          Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }

  Widget _buildDetailCard(List<NjkbFeeItem> details) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
      child: Column(
        children: details.map((item) => _buildRow(item.annotation, formatRp(item.value))).toList(),
      ),
    );
  }

  Widget _buildPnbpCard(List<NjkbFeeItem> pnbpList) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(color: Color(0xFFE8F1FF), borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
            child: Row(
              children: [
                const CircleAvatar(backgroundColor: Colors.white, child: Icon(Icons.account_balance, color: AppColors.blue300)),
                const SizedBox(width: 12),
                Text('Penerimaan Negara Bukan Pajak', style: AppTextStyles.bold(AppTextStyles.h4).copyWith(color: AppColors.blue300)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: pnbpList.map((item) => _buildRow(item.annotation, formatRp(item.value))).toList(),
            ),
          ),
        ],
      ),
    );
  }
}