import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:majadigi/core/router/app_router.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';
import 'package:majadigi/core/widgets/auth_header_widget.dart';
import 'package:majadigi/core/widgets/labeled_text_field.dart';
import 'package:majadigi/core/widgets/primary_button.dart';

class FormSkriningEtibi extends StatefulWidget {
  const FormSkriningEtibi({super.key});

  @override
  State<FormSkriningEtibi> createState() =>
      _FormSkriningEtibiState();
}

class _FormSkriningEtibiState
    extends State<FormSkriningEtibi> {
  int currentStep = 1;

  final TextEditingController namaController =
  TextEditingController();
  final TextEditingController nikController =
  TextEditingController();
  final TextEditingController phoneController =
  TextEditingController();
  final TextEditingController birthController =
  TextEditingController();

  final TextEditingController alamatController =
  TextEditingController();
  final TextEditingController pekerjaanController =
  TextEditingController();
  final TextEditingController beratController =
  TextEditingController();
  final TextEditingController tinggiController =
  TextEditingController();

  String? selectedKabupaten;
  String? selectedKecamatan;
  String? selectedKelurahan;

  final Map<int, bool?> answers = {};

  @override
  void dispose() {
    namaController.dispose();
    nikController.dispose();
    phoneController.dispose();
    birthController.dispose();
    alamatController.dispose();
    pekerjaanController.dispose();
    beratController.dispose();
    tinggiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          AuthHeaderWidget(
            imagePath:
            'lib/assets/images/etibi_background.png',
            showTitle: true,
            title: 'Form Skrining',
            onBackPressed: () => context.pop(),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.circular(32),
                ),
                child: Column(
                  children: [
                    _buildProgress(),

                    const SizedBox(height: 32),

                    if (currentStep == 1) _buildStep1(),
                    if (currentStep == 2) _buildStep2(),
                    if (currentStep == 3) _buildStep3(),
                    if (currentStep == 4) _buildStep4(),

                    const SizedBox(height: 40),

                    PrimaryButton(
                      label: currentStep == 4
                          ? 'Lihat Hasil'
                          : 'Lanjut',
                      onPressed: () {
                        if (currentStep < 4) {
                          setState(() {
                            currentStep++;
                          });
                        } else {
                          context.push(
                            Routes.hasilSkriningEtibi,
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgress() {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 12,
              decoration: BoxDecoration(
                color: const Color(0xFFD8F0E2),
                borderRadius:
                BorderRadius.circular(100),
              ),
            ),
            FractionallySizedBox(
              widthFactor: currentStep / 4,
              child: Container(
                height: 12,
                decoration: BoxDecoration(
                  color: const Color(0xFF27AE60),
                  borderRadius:
                  BorderRadius.circular(100),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            '$currentStep of 4',
            style: AppTextStyles.bold(
              AppTextStyles.body1,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStep1() {
    return Column(
      children: [
        Text(
          'Detail Identitas Anda',
          style: AppTextStyles.bold(
            AppTextStyles.h2,
          ),
        ),

        const SizedBox(height: 32),

        LabeledTextField(
          label: 'Nama',
          hintText: 'Nama Anda',
          controller: namaController,
        ),

        const SizedBox(height: 16),

        LabeledTextField(
          label: 'NIK',
          hintText: 'NIK harus 16 Digit Angka',
          keyboardType: TextInputType.number,
          controller: nikController,
        ),

        const SizedBox(height: 16),

        LabeledTextField(
          label: 'Nomor Telepon',
          hintText: '08XXXXX',
          controller: phoneController,
        ),

        const SizedBox(height: 16),

        LabeledTextField(
          label: 'Tanggal Lahir',
          hintText: 'DD/MM/YY',
          controller: birthController,
          suffixIcon: const Icon(
            Icons.calendar_month,
          ),
        ),
      ],
    );
  }

  Widget _buildStep2() {
    return Column(
      children: [
        Text(
          'Detail Identitas Anda',
          style: AppTextStyles.bold(
            AppTextStyles.h2,
          ),
        ),

        const SizedBox(height: 32),

        LabeledTextField(
          label: 'Alamat Domisili',
          hintText: 'Alamat Domisili',
          controller: alamatController,
        ),

        const SizedBox(height: 16),

        _buildDropdown(
          'Kabupaten/Kota',
          'Pilih Kabupaten/Kota',
        ),

        const SizedBox(height: 16),

        _buildDropdown(
          'Kecamatan',
          'Pilih Kecamatan',
        ),

        const SizedBox(height: 16),

        _buildDropdown(
          'Kelurahan/Desa',
          'Pilih Kelurahan/Desa',
        ),

        const SizedBox(height: 16),

        LabeledTextField(
          label: 'Pekerjaan',
          hintText: 'Pekerjaan Anda',
          controller: pekerjaanController,
        ),

        const SizedBox(height: 16),

        Row(
          children: [
            Expanded(
              child: LabeledTextField(
                label: 'Berat Anda',
                hintText: 'Kg',
                controller: beratController,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: LabeledTextField(
                label: 'Tinggi Anda',
                hintText: 'Cm',
                controller: tinggiController,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStep3() {
    return _buildQuestionStep(
      title: 'Keluhan Anda',
      questions: const [
        'Batuk lebih dari 2 minggu?',
        'Batuk berdarah?',
        'Mudah lelah atau lemas?',
        'Berat badan menurun?',
        'Demam atau meriang malam hari?',
      ],
      startNumber: 1,
    );
  }

  Widget _buildStep4() {
    return _buildQuestionStep(
      title: 'Keluhan Anda',
      questions: const [
        'Berkeringat di malam hari?',
        'Nafsu makan menurun?',
        'Nyeri dada atau sesak napas?',
        'Pernah kontak dengan penderita TBC?',
        'Tinggal serumah dengan penderita TBC?',
      ],
      startNumber: 6,
    );
  }

  Widget _buildQuestionStep({
    required String title,
    required List<String> questions,
    required int startNumber,
  }) {
    return Column(
      children: [
        Text(
          title,
          style: AppTextStyles.bold(
            AppTextStyles.h2,
          ),
        ),

        const SizedBox(height: 32),

        ...List.generate(
          questions.length,
              (index) {
            final number = startNumber + index;

            return Padding(
              padding:
              const EdgeInsets.only(bottom: 24),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    '$number. ${questions[index]}',
                    style: AppTextStyles.bold(
                      AppTextStyles.h4,
                    ),
                  ),

                  const SizedBox(height: 16),

                  Row(
                    children: [
                      Expanded(
                        child: _answerButton(
                          label: 'Ya',
                          selected:
                          answers[number] == true,
                          value: true,
                          number: number,
                        ),
                      ),

                      const SizedBox(width: 16),

                      Expanded(
                        child: _answerButton(
                          label: 'Tidak',
                          selected:
                          answers[number] == false,
                          value: false,
                          number: number,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _answerButton({
    required String label,
    required bool selected,
    required bool value,
    required int number,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          answers[number] = value;
        });
      },
      child: Container(
        height: 48,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected
              ? AppColors.blue300
              : Colors.white,
          borderRadius:
          BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.blue300,
          ),
        ),
        child: Text(
          label,
          style: AppTextStyles.bold(
            AppTextStyles.body1,
          ).copyWith(
            color: selected
                ? Colors.white
                : AppColors.blue300,
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown(
      String label,
      String hint,
      ) {
    return Column(
      crossAxisAlignment:
      CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.semiBold(
            AppTextStyles.body1,
          ),
        ),

        const SizedBox(height: 8),

        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius:
              BorderRadius.circular(16),
            ),
          ),
          items: const [],
          onChanged: (value) {},
        ),
      ],
    );
  }
}