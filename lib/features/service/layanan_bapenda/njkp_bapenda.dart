import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:majadigi/core/router/app_router.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';
import 'package:majadigi/core/widgets/auth_header_widget.dart';
import 'package:majadigi/core/widgets/primary_button.dart';

class NjkpBapenda extends StatefulWidget {
  const NjkpBapenda({super.key});

  @override
  State<NjkpBapenda> createState() =>
      _NjkpBapendaState();
}

class _NjkpBapendaState
    extends State<NjkpBapenda> {
  bool isRobotChecked = false;

  String? selectedJenis;
  String? selectedModel;
  String? selectedMerk;
  String? selectedTipe;
  String? selectedTahun;

  final jenisList = [
    'Mobil',
    'Motor',
    'Bus',
    'Truk',
  ];

  final modelList = [
    'SUV',
    'Sedan',
    'MPV',
    'Hatchback',
  ];

  final merkList = [
    'Toyota',
    'Honda',
    'Suzuki',
    'Daihatsu',
  ];

  final tipeList = [
    'Automatic',
    'Manual',
  ];

  final tahunList = [
    '2025',
    '2024',
    '2023',
    '2022',
    '2021',
  ];

  Widget buildDropdown({
    required String label,
    required String hint,
    required String? value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Column(
      crossAxisAlignment:
      CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.semiBold(
            AppTextStyles.body1,
          ).copyWith(
            color: AppColors.black,
          ),
        ),

        const SizedBox(height: 8),

        DropdownButtonFormField<String>(
          value: value,

          style: AppTextStyles.medium(
            AppTextStyles.body1,
          ).copyWith(
            color: AppColors.black,
          ),

          dropdownColor: Colors.white,

          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppColors.dark300,
            size: 24,
          ),

          borderRadius:
          BorderRadius.circular(16),

          decoration: InputDecoration(
            hintText: hint,

            hintStyle: AppTextStyles.medium(
              AppTextStyles.body1,
            ).copyWith(
              color: AppColors.dark300,
            ),

            filled: true,
            fillColor: Colors.white,

            contentPadding:
            const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),

            enabledBorder:
            OutlineInputBorder(
              borderRadius:
              BorderRadius.circular(16),
              borderSide: BorderSide(
                color: AppColors.dark200,
              ),
            ),

            focusedBorder:
            OutlineInputBorder(
              borderRadius:
              BorderRadius.circular(16),
              borderSide: BorderSide(
                color: AppColors.blue300,
                width: 1.5,
              ),
            ),
          ),

          items: items.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: AppTextStyles.medium(
                  AppTextStyles.body1,
                ),
              ),
            );
          }).toList(),

          onChanged: onChanged,
        ),
      ],
    );
  }

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
            title:
            'Info Nilai Jual Kendaraan Bermotor (NJKB)',
            onBackPressed: () {
              context.pop();
            },
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  /// BANNER
                  ClipRRect(
                    borderRadius:
                    BorderRadius.circular(
                      20,
                    ),
                    child: Image.asset(
                      'lib/assets/images/bapenda_background.png',
                      width: double.infinity,
                      height: 140,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// FORM CARD
                  Container(
                    width: double.infinity,
                    padding:
                    const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.circular(
                        24,
                      ),
                    ),
                    child: Column(
                      children: [
                        buildDropdown(
                          label:
                          'Jenis Kendaraan',
                          hint: 'Pilih',
                          value: selectedJenis,
                          items: jenisList,
                          onChanged: (value) {
                            setState(() {
                              selectedJenis =
                                  value;
                            });
                          },
                        ),

                        const SizedBox(
                            height: 16),

                        buildDropdown(
                          label:
                          'Model Kendaraan',
                          hint: 'Pilih',
                          value: selectedModel,
                          items: modelList,
                          onChanged: (value) {
                            setState(() {
                              selectedModel =
                                  value;
                            });
                          },
                        ),

                        const SizedBox(
                            height: 16),

                        buildDropdown(
                          label:
                          'Merk Kendaraan',
                          hint: 'Pilih',
                          value: selectedMerk,
                          items: merkList,
                          onChanged: (value) {
                            setState(() {
                              selectedMerk =
                                  value;
                            });
                          },
                        ),

                        const SizedBox(
                            height: 16),

                        buildDropdown(
                          label:
                          'Tipe Kendaraan',
                          hint: 'Pilih',
                          value: selectedTipe,
                          items: tipeList,
                          onChanged: (value) {
                            setState(() {
                              selectedTipe =
                                  value;
                            });
                          },
                        ),

                        const SizedBox(
                            height: 16),

                        buildDropdown(
                          label:
                          'Tahun Kendaraan',
                          hint: 'Pilih',
                          value: selectedTahun,
                          items: tahunList,
                          onChanged: (value) {
                            setState(() {
                              selectedTahun =
                                  value;
                            });
                          },
                        ),

                        const SizedBox(
                            height: 20),

                        /// CAPTCHA
                        Container(
                          height: 62,
                          padding:
                          const EdgeInsets
                              .symmetric(
                            horizontal: 16,
                          ),
                          decoration:
                          BoxDecoration(
                            border: Border.all(
                              color:
                              AppColors.dark200,
                            ),
                            borderRadius:
                            BorderRadius
                                .circular(
                              12,
                            ),
                          ),
                          child: Row(
                            children: [
                              Checkbox(
                                value:
                                isRobotChecked,
                                onChanged:
                                    (value) {
                                  setState(() {
                                    isRobotChecked =
                                        value ??
                                            false;
                                  });
                                },
                              ),

                              const SizedBox(
                                  width: 8),

                              Expanded(
                                child: Text(
                                  'Saya bukan robot',
                                  style:
                                  AppTextStyles
                                      .medium(
                                    AppTextStyles
                                        .body1,
                                  ),
                                ),
                              ),

                              Image.asset(
                                'lib/assets/images/bapenda_background.png',
                                width: 28,
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(
                            height: 20),

                        PrimaryButton(
                          label: 'Submit',
                          onPressed: () {
                            context.push(Routes.detailNjkpBapenda);
                          },
                        ),
                      ],
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
}