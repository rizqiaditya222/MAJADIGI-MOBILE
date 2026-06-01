import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:majadigi/core/router/app_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/auth_header_widget.dart';

class FaskesEtibiPage extends StatefulWidget {
  const FaskesEtibiPage({super.key});

  @override
  State<FaskesEtibiPage> createState() => _FaskesEtibiPageState();
}

class _FaskesEtibiPageState extends State<FaskesEtibiPage> {
  final TextEditingController searchController =
  TextEditingController();

  String selectedType = 'Semua Tipe';
  String selectedCity = 'Kota Malang';

  final List<Map<String, String>> faskesList = [
    {
      'name': 'PUSKESMAS KEDUNGKANDANG',
      'city': 'Kota Malang',
    },
    {
      'name': 'PUSKESMAS GRIBIG',
      'city': 'Kota Malang',
    },
    {
      'name': 'PUSKESMAS ARJOWINANGUN',
      'city': 'Kota Malang',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      body: Column(
        children: [
          AuthHeaderWidget(
            imagePath:
            'lib/assets/images/etibi_background.png',
            showTitle: true,
            title: 'Pilih Faskes',
            onBackPressed: () {
              context.pop();
            },
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildWarningCard(),

                  const SizedBox(height: 12),

                  _buildPatientCard(),

                  const SizedBox(height: 24),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Pilih Faskes tujuan',
                      style: AppTextStyles.bold(
                        AppTextStyles.h3,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  _buildFilterSection(),

                  const SizedBox(height: 20),

                  ...faskesList.map(
                        (item) => Padding(
                      padding:
                      const EdgeInsets.only(bottom: 12),
                      child: _buildFaskesCard(item),
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

  Widget _buildWarningCard() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        color: const Color(0xFFFFE8EE),
        child: Stack(
          children: [
            /// IMAGE BACKGROUND
            Positioned(
              right: 0,
              bottom: 0,
              child: Image.asset(
                'lib/assets/images/faskes_char.png',
                height: 120,
                fit: BoxFit.contain,
              ),
            ),

            /// CONTENT
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Yuk, Segera periksa\nke faskes terdekat!',
                            style: AppTextStyles.bold(
                              AppTextStyles.body1,
                            ).copyWith(
                              color: const Color(0xFFFF0054),
                            ),
                          ),

                          const SizedBox(height: 8),

                          Text(
                            'Hasil skrining anda\nmenunjukkan risiko dari\npenyakit TBC.',
                            style: AppTextStyles.medium(
                              AppTextStyles.body3,
                            ).copyWith(
                              color: const Color(0xFFD44A73),
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// ruang kosong agar text tidak tertutup image
                    const SizedBox(width: 110),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPatientCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFEAEAEA),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 70,
                child: Text(
                  'Nama',
                  style: AppTextStyles.medium(
                    AppTextStyles.body2,
                  ).copyWith(
                    color: const Color(0xFF9A9A9A),
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'Andrian Faikha Ilham',
                  style: AppTextStyles.bold(
                    AppTextStyles.body2,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Row(
            children: [
              SizedBox(
                width: 70,
                child: Text(
                  'Waktu',
                  style: AppTextStyles.medium(
                    AppTextStyles.body2,
                  ).copyWith(
                    color: const Color(0xFF9A9A9A),
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  '21 Mei 2026, 14:57',
                  style: AppTextStyles.bold(
                    AppTextStyles.body2,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFilterSection() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildDropdown(
                title: 'Tipe Faskes',
                value: selectedType,
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: _buildDropdown(
                title: 'Kabupaten/Kota',
                value: selectedCity,
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        Row(
          children: [
            Expanded(
              child: Container(
                height: 46,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.circular(100),
                  border: Border.all(
                    color: const Color(0xFFE0E0E0),
                  ),
                ),
                child: TextField(
                  controller: searchController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Cari Nama Faskes',
                  ),
                ),
              ),
            ),

            const SizedBox(width: 12),

            SizedBox(
              width: 110,
              height: 46,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                  const Color(0xFFFF0054),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(100),
                  ),
                ),
                child: Text(
                  'Reset',
                  style: AppTextStyles.bold(
                    AppTextStyles.body2,
                  ).copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDropdown({
    required String title,
    required String value,
  }) {
    return Column(
      crossAxisAlignment:
      CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.bold(
            AppTextStyles.body3,
          ),
        ),

        const SizedBox(height: 8),

        Container(
          height: 46,
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
            BorderRadius.circular(100),
            border: Border.all(
              color: const Color(0xFFE0E0E0),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  value,
                  style: AppTextStyles.medium(
                    AppTextStyles.body2,
                  ),
                ),
              ),
              const Icon(
                Icons.keyboard_arrow_down,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFaskesCard(
      Map<String, String> item) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
        BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: const BoxDecoration(
              color: Color(0xFFFFE5EE),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.local_hospital,
              color: Color(0xFFFF0054),
              size: 22,
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(
                  item['name']!,
                  style: AppTextStyles.bold(
                    AppTextStyles.body1,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  item['city']!,
                  style: AppTextStyles.medium(
                    AppTextStyles.body3,
                  ).copyWith(
                    color: const Color(0xFF9A9A9A),
                  ),
                ),

                Text(
                  'Telp : -',
                  style: AppTextStyles.medium(
                    AppTextStyles.body3,
                  ).copyWith(
                    color: const Color(0xFF9A9A9A),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            width: 82,
            height: 34,
            child: ElevatedButton(
              onPressed: () {
                context.push(Routes.faskesChoiceEtibi);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                AppColors.blue300,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(
                    100,
                  ),
                ),
              ),
              child: Text(
                'Pilih',
                style: AppTextStyles.bold(
                  AppTextStyles.body3,
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
}