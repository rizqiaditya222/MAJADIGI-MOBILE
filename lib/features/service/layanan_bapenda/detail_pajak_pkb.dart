import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';
import 'package:majadigi/core/widgets/auth_header_widget.dart';
import 'package:majadigi/core/widgets/primary_button.dart';

class DetailPajakBapenda extends StatefulWidget {
  const DetailPajakBapenda({super.key});

  @override
  State<DetailPajakBapenda> createState() =>
      _DetailPajakBapendaState();
}

class _DetailPajakBapendaState
    extends State<DetailPajakBapenda> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        body: Column(
          children: [
            AuthHeaderWidget(
              imagePath:
              'lib/assets/images/bapenda_background.png',
              showTitle: true,
              title: 'Info Pajak Kendaraan Bermotor (PKB)',
              onBackPressed: () {
                context.pop();
              },
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
                        borderRadius:
                        BorderRadius.circular(24),
                        border: Border.all(
                          color: const Color(0xFFB6E6C4),
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 76,
                            height: 76,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFAEE8C0),
                            ),
                            child: const Center(
                              child: CircleAvatar(
                                radius: 24,
                                backgroundColor:
                                Color(0xFF27AE60),
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(width: 16),

                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Hasil Pencarian',
                                        style:
                                        AppTextStyles.bold(
                                          AppTextStyles.h3,
                                        ).copyWith(
                                          color:
                                          const Color(
                                            0xFF1E874B,
                                          ),
                                        ),
                                      ),
                                    ),

                                    Container(
                                      padding:
                                      const EdgeInsets
                                          .symmetric(
                                        horizontal: 16,
                                        vertical: 4,
                                      ),
                                      decoration:
                                      BoxDecoration(
                                        color:
                                        const Color(
                                          0xFFAEE8C0,
                                        ),
                                        borderRadius:
                                        BorderRadius
                                            .circular(
                                          20,
                                        ),
                                      ),
                                      child: Text(
                                        'Aktif',
                                        style:
                                        AppTextStyles
                                            .semiBold(
                                          AppTextStyles
                                              .body2,
                                        ).copyWith(
                                          color:
                                          const Color(
                                            0xFF1E874B,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 8),

                                Text(
                                  'Informasi pajak kendaraan berhasil ditemukan',
                                  style:
                                  AppTextStyles.medium(
                                    AppTextStyles.body1,
                                  ).copyWith(
                                    color: const Color(
                                      0xFF1E874B,
                                    ),
                                  ),
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
                        borderRadius:
                        BorderRadius.circular(24),
                      ),
                      child: Column(
                        children: [
                          // Blue Header with plat nomor
                          Container(
                            padding:
                            const EdgeInsets.all(20),
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFF156BFF),
                                  Color(0xFF119DFF),
                                ],
                              ),
                              borderRadius:
                              BorderRadius.vertical(
                                top: Radius.circular(24),
                              ),
                            ),
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  radius: 24,
                                  backgroundColor:
                                  Colors.white,
                                  child: Icon(
                                    Icons.directions_car,
                                    color:
                                    Color(0xFF156BFF),
                                  ),
                                ),

                                const SizedBox(width: 16),

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text(
                                        'TOYOTA',
                                        style:
                                        AppTextStyles
                                            .bold(
                                          AppTextStyles
                                              .h3,
                                        ).copyWith(
                                          color:
                                          Colors.white,
                                        ),
                                      ),
                                      Text(
                                        'Kijang Innova',
                                        style:
                                        AppTextStyles
                                            .medium(
                                          AppTextStyles
                                              .body1,
                                        ).copyWith(
                                          color:
                                          Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // Plat Nomor badge
                                Container(
                                  padding:
                                  const EdgeInsets
                                      .symmetric(
                                    horizontal: 18,
                                    vertical: 8,
                                  ),
                                  decoration:
                                  BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                    BorderRadius
                                        .circular(20),
                                  ),
                                  child: Text(
                                    'AG 1260 XG',
                                    style:
                                    AppTextStyles
                                        .semiBold(
                                      AppTextStyles
                                          .body1,
                                    ).copyWith(
                                      color:
                                      AppColors
                                          .blue300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Vehicle detail info: 2x2 grid
                          Padding(
                            padding:
                            const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: _buildVehicleInfo(
                                        icon: Icons.palette,
                                        label: 'Warna',
                                        value: 'Hitam Metalic',
                                      ),
                                    ),
                                    Expanded(
                                      child: _buildVehicleInfo(
                                        icon: Icons.calendar_month,
                                        label: 'Tahun Buat',
                                        value: '2023',
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  children: [
                                    Expanded(
                                      child: _buildVehicleInfo(
                                        icon: Icons.directions_car,
                                        label: 'Model',
                                        value: 'Minibus',
                                      ),
                                    ),
                                    Expanded(
                                      child: _buildVehicleInfo(
                                        icon: Icons.monetization_on_outlined,
                                        label: 'Masa Pajak',
                                        value: '12-02-2027',
                                      ),
                                    ),
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
                    _buildBiayaTahunanCard(),

                    const SizedBox(height: 24),

                    /// ESTIMASI BIAYA 5 TAHUN CARD
                    _buildEstimasi5TahunCard(),

                    const SizedBox(height: 24),

                    /// INFO BOX
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5FAFF),
                        borderRadius:
                        BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color(0xFF9BC3FF),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            radius: 14,
                            backgroundColor:
                            AppColors.blue300,
                            child: Icon(
                              Icons.info,
                              size: 16,
                              color: Colors.white,
                            ),
                          ),

                          const SizedBox(width: 16),

                          Expanded(
                            child: Text(
                              'Data mengacu pada informasi SAMSAT dan bersifat sementara. Periksa kembali dengan dokumen fisik kendaraan Anda.',
                              style:
                              AppTextStyles.medium(
                                AppTextStyles.body1,
                              ).copyWith(
                                color: AppColors.blue300,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    PrimaryButton(
                      label: 'Kembali',
                      onPressed: () {
                        context.pop();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

// Vehicle info item with icon, label, and value
Widget _buildVehicleInfo({
  required IconData icon,
  required String label,
  required String value,
}) {
  return Row(
    children: [
      CircleAvatar(
        radius: 18,
        backgroundColor: const Color(0xFFE8F1FF),
        child: Icon(
          icon,
          size: 18,
          color: AppColors.blue300,
        ),
      ),
      const SizedBox(width: 8),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Color(0xFF888888),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
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
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    ),
  );
}

Widget _buildBiayaTahunanCard() {
  return Container(
    padding: const EdgeInsets.all(24),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(24),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section header
        Row(
          children: [
            const CircleAvatar(
              radius: 18,
              backgroundColor: Color(0xFFE8F1FF),
              child: Icon(
                Icons.search,
                size: 18,
                color: AppColors.blue300,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              'Biaya Penuh Tahunan',
              style: AppTextStyles.bold(
                AppTextStyles.h4,
              ).copyWith(
                color: Colors.black87,
              ),
            ),
          ],
        ),

        const SizedBox(height: 20),

        _buildRow('PKB Pokok', 'Rp 3.000.000'),
        _buildRow('Opsen PKB', 'Rp 1.500.000'),
        _buildRow('SWDKLLJ', 'Rp 150.000'),
        _buildRow('Parkir Berlangganan', 'Rp 50.000'),

        const SizedBox(height: 8),

        // Total Pajak banner
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 14,
          ),
          decoration: BoxDecoration(
            color: AppColors.blue300,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'TOTAL PAJAK',
                style: AppTextStyles.bold(
                  AppTextStyles.body1,
                ).copyWith(
                  color: Colors.white,
                  letterSpacing: 0.5,
                ),
              ),
              Text(
                'Rp 4.700.000',
                style: AppTextStyles.bold(
                  AppTextStyles.h3,
                ).copyWith(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildEstimasi5TahunCard() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(24),
    ),
    child: Column(
      children: [
        // Card header
        Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Color(0xFFE8F1FF),
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(24),
            ),
          ),
          child: Row(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.manage_search,
                  color: AppColors.blue300,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'Estimasi Biaya 5 Tahun',
                style: AppTextStyles.bold(
                  AppTextStyles.h4,
                ).copyWith(
                  color: AppColors.blue300,
                ),
              ),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              _buildRow('Cetak STNK', 'Rp 3.000.000'),
              _buildRow('Cetak TNKB', 'Rp 1.500.000'),

              const SizedBox(height: 8),

              // Orange info box
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF3E0),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: const Color(0xFFFFCC80),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 14,
                      backgroundColor: Color(0xFFFF9800),
                      child: Icon(
                        Icons.info,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        'Biaya ini merupakan PNBP (Penerimaan Negara Bukan Pajak) yang dikenakan setiap 5 tahun saat penggantian plat nomor kendaraan.',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFE65100),
                        ),
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