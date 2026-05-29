import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:majadigi/core/router/app_router.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';
import 'package:majadigi/core/widgets/auth_header_widget.dart';
import 'package:majadigi/core/widgets/labeled_text_field.dart';
import 'package:majadigi/core/widgets/primary_button.dart';

class PesananIslamicCenter extends StatefulWidget {
  const PesananIslamicCenter({super.key});

  @override
  State<PesananIslamicCenter> createState() =>
      _PesananIslamicCenterState();
}

class _PesananIslamicCenterState
    extends State<PesananIslamicCenter> {
  final TextEditingController namaController =
  TextEditingController();

  final TextEditingController emailController =
  TextEditingController();

  final TextEditingController phoneController =
  TextEditingController();

  final TextEditingController purposeController =
  TextEditingController();

  final TextEditingController dateController =
  TextEditingController();

  final TextEditingController timeController =
  TextEditingController();

  Future<void> _selectDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      dateController.text =
      "${picked.day}/${picked.month}/${picked.year}";
    }
  }

  Future<void> _selectTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      timeController.text = picked.format(context);
    }
  }

  @override
  void dispose() {
    namaController.dispose();
    emailController.dispose();
    phoneController.dispose();
    purposeController.dispose();
    dateController.dispose();
    timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),

      body: Column(
        children: [
          AuthHeaderWidget(
            imagePath: 'lib/assets/images/islamic_background.png',
            showTitle: true,
            title: 'Pemesanan',
            onBackPressed: () {
              context.pop();
            },
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  /// CARD AULA
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius:
                          BorderRadius.circular(16),
                          child: Image.asset(
                            'lib/assets/images/islamic_sample.png',
                            width: 95,
                            height: 95,
                            fit: BoxFit.cover,
                          ),
                        ),

                        const SizedBox(width: 16),

                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Asrama',
                                style:
                                AppTextStyles.bold(
                                  AppTextStyles.h2,
                                ).copyWith(
                                  color:
                                  AppColors.black,
                                ),
                              ),

                              const SizedBox(height: 10),

                              Row(
                                children: [
                                  const Icon(
                                    Icons.people,
                                    size: 18,
                                    color: Colors.blue,
                                  ),
                                  const SizedBox(
                                      width: 6),
                                  Text(
                                    '2000 orang',
                                    style:
                                    AppTextStyles
                                        .regular(
                                      AppTextStyles
                                          .body2,
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 6),

                              Row(
                                children: [
                                  const Icon(
                                    Icons.payments,
                                    size: 18,
                                    color:
                                    Colors.green,
                                  ),
                                  const SizedBox(
                                      width: 6),
                                  Text(
                                    'Mulai dari 10.000.000',
                                    style:
                                    AppTextStyles
                                        .regular(
                                      AppTextStyles
                                          .body2,
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

                  const SizedBox(height: 16),

                  /// FORM
                  Container(
                    width: double.infinity,
                    padding:
                    const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.circular(
                        24,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Masukkan detail data untuk\nmelanjutkan pemesanan anda',
                          style:
                          AppTextStyles.bold(
                            AppTextStyles.h3,
                          ),
                        ),

                        const SizedBox(height: 24),

                        LabeledTextField(
                          label: 'Nama',
                          hintText: 'Andi',
                          controller:
                          namaController,
                        ),

                        const SizedBox(height: 16),

                        LabeledTextField(
                          label: 'Alamat Email',
                          hintText:
                          'name@email.com',
                          keyboardType:
                          TextInputType
                              .emailAddress,
                          controller:
                          emailController,
                        ),

                        const SizedBox(height: 16),

                        LabeledTextField(
                          label:
                          'Nomor Telepon',
                          hintText:
                          '08XXXXXX',
                          keyboardType:
                          TextInputType
                              .phone,
                          controller:
                          phoneController,
                        ),

                        const SizedBox(height: 16),

                        LabeledTextField(
                          label:
                          'Keperluan Peminjaman',
                          hintText: '...',
                          controller:
                          purposeController,
                        ),

                        const SizedBox(height: 16),

                        TextField(
                          controller: dateController,
                          readOnly: true,
                          onTap: _selectDate,
                          style: AppTextStyles.medium(
                            AppTextStyles.body1,
                          ).copyWith(
                            color: AppColors.dark300,
                          ),
                          decoration: InputDecoration(
                            labelText: 'Tanggal Peminjaman',
                            hintText: 'XX/XX/26',

                            hintStyle: AppTextStyles.medium(
                              AppTextStyles.body1,
                            ).copyWith(
                              color: AppColors.dark300,
                            ),

                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 16,
                            ),

                            suffixIcon: IconButton(
                              icon: const Icon(Icons.calendar_month),
                              onPressed: _selectDate,
                            ),

                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                color: AppColors.dark200,
                              ),
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                color: AppColors.blue300,
                                width: 1.5,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        TextField(
                          controller: timeController,
                          readOnly: true,
                          onTap: _selectTime,
                          style: AppTextStyles.medium(
                            AppTextStyles.body1,
                          ).copyWith(
                            color: AppColors.dark300,
                          ),
                          decoration: InputDecoration(
                            labelText: 'Waktu Peminjaman',
                            hintText: '00:00',

                            hintStyle: AppTextStyles.medium(
                              AppTextStyles.body1,
                            ).copyWith(
                              color: AppColors.dark300,
                            ),

                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 16,
                            ),

                            suffixIcon: IconButton(
                              icon: const Icon(Icons.access_time),
                              onPressed: _selectTime,
                            ),

                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                color: AppColors.dark200,
                              ),
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                color: AppColors.blue300,
                                width: 1.5,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  PrimaryButton(
                    label: 'Pesan',
                    onPressed: () {
                      context.push(
                        Routes.pembayaranIslamicCenter,
                      );
                    },
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

