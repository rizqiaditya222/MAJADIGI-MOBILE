import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:majadigi/core/router/app_router.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';
import 'package:majadigi/core/widgets/auth_header_widget.dart';
import 'package:majadigi/core/widgets/labeled_text_field.dart';
import 'package:majadigi/core/widgets/primary_button.dart';
import 'package:majadigi/injection_container.dart';
import 'package:majadigi/features/skrining_etibi/domain/entities/etibi_entity.dart';
import 'package:majadigi/features/skrining_etibi/presentation/bloc/etibi_bloc.dart';

class FormSkriningEtibi extends StatelessWidget {
  const FormSkriningEtibi({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => s1<EtibiBloc>()..add(FetchKota()),
      child: const _FormSkriningEtibiView(),
    );
  }
}

class _FormSkriningEtibiView extends StatefulWidget {
  const _FormSkriningEtibiView();

  @override
  State<_FormSkriningEtibiView> createState() => _FormSkriningEtibiViewState();
}

class _FormSkriningEtibiViewState extends State<_FormSkriningEtibiView> {
  int currentStep = 1;

  final TextEditingController namaController = TextEditingController();
  final TextEditingController nikController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController birthController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController pekerjaanController = TextEditingController();
  final TextEditingController beratController = TextEditingController();
  final TextEditingController tinggiController = TextEditingController();

  final Map<int, bool?> answers = {};

  final List<String> allQuestions = [
    'Batuk lebih dari 2 minggu?',
    'Batuk berdarah?',
    'Mudah lelah atau lemas?',
    'Berat badan menurun?',
    'Demam atau meriang malam hari?',
    'Berkeringat di malam hari?',
    'Nafsu makan menurun?',
    'Nyeri dada atau sesak napas?',
    'Pernah kontak dengan penderita TBC?',
    'Tinggal serumah dengan penderita TBC?'
  ];

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

  void _submitForm(EtibiState state) {
    final List<Map<String, String>> formattedAnswers = [];
    
    for (int i = 0; i < allQuestions.length; i++) {
      final isYa = answers[i + 1] ?? false; // Default 'tidak' jika belum diisi
      formattedAnswers.add({
        "question": allQuestions[i],
        "answer": isYa ? "iya" : "tidak"
      });
    }
    final now = DateTime.now().toUtc();

    final formData = {
      "name": namaController.text,
      "nik": nikController.text,
      "number": phoneController.text,
      "date_of_birth": birthController.text,
      "address": alamatController.text,
      "city_id": state.selectedKota?.id,
      "district_id": state.selectedKecamatan?.id,
      "village_id": state.selectedKelurahan?.id,
      "job": pekerjaanController.text,
      "weight": int.tryParse(beratController.text) ?? 0,
      "height": int.tryParse(tinggiController.text) ?? 0,
      "date":
      "${now.year.toString().padLeft(4, '0')}-"
          "${now.month.toString().padLeft(2, '0')}-"
          "${now.day.toString().padLeft(2, '0')}T"
          "${now.hour.toString().padLeft(2, '0')}:"
          "${now.minute.toString().padLeft(2, '0')}:"
          "${now.second.toString().padLeft(2, '0')}Z",
      "answers": formattedAnswers
    };

    context.read<EtibiBloc>().add(SubmitEtibiForm(formData));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EtibiBloc, EtibiState>(
      listener: (context, state) {
        if (state.error != null) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error!), backgroundColor: Colors.red));
        }
        if (state.isSuccessSubmit) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Skrining berhasil disimpan!'), backgroundColor: Colors.green));
          context.push(Routes.hasilSkriningEtibi);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xFFF5F5F5),
          body: Stack(
            children: [
              Column(
                children: [
                  AuthHeaderWidget(
                    imagePath: 'lib/assets/images/etibi_background.png',
                    showTitle: true,
                    title: 'Form Skrining',
                    onBackPressed: () => context.pop(),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(24),
                      child: Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(32)),
                        child: Column(
                          children: [
                            _buildProgress(),
                            const SizedBox(height: 32),
                            
                            if (currentStep == 1) _buildStep1(),
                            if (currentStep == 2) _buildStep2(state),
                            if (currentStep == 3) _buildStep3(),
                            if (currentStep == 4) _buildStep4(),
                            
                            const SizedBox(height: 40),
                            PrimaryButton(
                              label: currentStep == 4 ? 'Lihat Hasil' : 'Lanjut',
                              onPressed: () {
                                // VALIDASI STEP 1
                                if (currentStep == 1) {
                                  // Regex untuk memastikan format YYYY-MM-DD
                                  final dobRegex = RegExp(r'^\d{4}-\d{2}-\d{2}$');
                                  // Regex untuk memastikan nomor telepon hanya angka (10-15 digit)
                                  final phoneRegex = RegExp(r'^[0-9]{10,15}$');

                                  if (namaController.text.isEmpty || 
                                      nikController.text.length != 16 || 
                                      !phoneRegex.hasMatch(phoneController.text) || 
                                      !dobRegex.hasMatch(birthController.text)) {
                                    
                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                      content: Text('Pastikan NIK 16 digit, No. HP Valid, & Tgl Lahir YYYY-MM-DD!'), 
                                      backgroundColor: Colors.red
                                    ));
                                    return; // Hentikan eksekusi
                                  }
                                } 
                                // VALIDASI STEP 2
                                else if (currentStep == 2) {
                                  if (alamatController.text.isEmpty || state.selectedKelurahan == null || pekerjaanController.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                      content: Text('Harap lengkapi Alamat, Pekerjaan, dan Lokasi Anda!'), 
                                      backgroundColor: Colors.red
                                    ));
                                    return; // Hentikan eksekusi
                                  }
                                }

                                // LOGIKA PINDAH STEP ATAU SUBMIT
                                if (currentStep < 4) {
                                  setState(() => currentStep++);
                                } else {
                                  _submitForm(state);
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
              
              // Loading Overlay
              if (state.isLoading)
                Container(
                  color: Colors.black.withOpacity(0.3),
                  child: const Center(child: CircularProgressIndicator()),
                )
            ],
          ),
        );
      },
    );
  }

  Widget _buildProgress() {
    return Column(
      children: [
        Stack(
          children: [
            Container(height: 12, decoration: BoxDecoration(color: const Color(0xFFD8F0E2), borderRadius: BorderRadius.circular(100))),
            FractionallySizedBox(
              widthFactor: currentStep / 4,
              child: Container(height: 12, decoration: BoxDecoration(color: const Color(0xFF27AE60), borderRadius: BorderRadius.circular(100))),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Align(alignment: Alignment.centerRight, child: Text('$currentStep of 4', style: AppTextStyles.bold(AppTextStyles.body1))),
      ],
    );
  }

  Widget _buildStep1() {
    return Column(
      children: [
        Text('Detail Identitas Anda', style: AppTextStyles.bold(AppTextStyles.h2)),
        const SizedBox(height: 32),
        LabeledTextField(label: 'Nama', hintText: 'Nama Anda', controller: namaController),
        const SizedBox(height: 16),
        LabeledTextField(label: 'NIK', hintText: 'NIK harus 16 Digit Angka', keyboardType: TextInputType.number, controller: nikController),
        const SizedBox(height: 16),
        LabeledTextField(label: 'Nomor Telepon', hintText: '08XXXXX', controller: phoneController),
        const SizedBox(height: 16),
        LabeledTextField(label: 'Tanggal Lahir', hintText: 'YYYY-MM-DD (Contoh: 2000-12-31)', controller: birthController, suffixIcon: const Icon(Icons.calendar_month)),
      ],
    );
  }

  Widget _buildStep2(EtibiState state) {
    return Column(
      children: [
        Text('Detail Identitas Anda', style: AppTextStyles.bold(AppTextStyles.h2)),
        const SizedBox(height: 32),
        LabeledTextField(label: 'Alamat Domisili', hintText: 'Alamat Domisili', controller: alamatController),
        const SizedBox(height: 16),
        
        _buildDropdown(
          label: 'Kabupaten/Kota', 
          hint: 'Pilih Kabupaten/Kota',
          value: state.selectedKota,
          items: state.listKota,
          onChanged: (val) {
            if (val != null) context.read<EtibiBloc>().add(ChangeKota(val));
          }
        ),
        const SizedBox(height: 16),
        
        _buildDropdown(
          label: 'Kecamatan', 
          hint: 'Pilih Kecamatan',
          value: state.selectedKecamatan,
          items: state.listKecamatan,
          onChanged: (val) {
            if (val != null) context.read<EtibiBloc>().add(ChangeKecamatan(val));
          }
        ),
        const SizedBox(height: 16),
        
        _buildDropdown(
          label: 'Kelurahan/Desa', 
          hint: 'Pilih Kelurahan/Desa',
          value: state.selectedKelurahan,
          items: state.listKelurahan,
          onChanged: (val) {
            if (val != null) context.read<EtibiBloc>().add(ChangeKelurahan(val));
          }
        ),
        const SizedBox(height: 16),
        
        LabeledTextField(label: 'Pekerjaan', hintText: 'Pekerjaan Anda', controller: pekerjaanController),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(child: LabeledTextField(label: 'Berat Anda', hintText: 'Kg', controller: beratController, keyboardType: TextInputType.number)),
            const SizedBox(width: 16),
            Expanded(child: LabeledTextField(label: 'Tinggi Anda', hintText: 'Cm', controller: tinggiController, keyboardType: TextInputType.number)),
          ],
        ),
      ],
    );
  }

  Widget _buildStep3() {
    return _buildQuestionStep(title: 'Keluhan Anda', questions: allQuestions.sublist(0, 5), startNumber: 1);
  }

  Widget _buildStep4() {
    return _buildQuestionStep(title: 'Keluhan Anda', questions: allQuestions.sublist(5, 10), startNumber: 6);
  }

  Widget _buildQuestionStep({required String title, required List<String> questions, required int startNumber}) {
    return Column(
      children: [
        Text(title, style: AppTextStyles.bold(AppTextStyles.h2)),
        const SizedBox(height: 32),
        ...List.generate(
          questions.length,
          (index) {
            final number = startNumber + index;
            return Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('$number. ${questions[index]}', style: AppTextStyles.bold(AppTextStyles.h4)),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(child: _answerButton(label: 'Ya', selected: answers[number] == true, value: true, number: number)),
                      const SizedBox(width: 16),
                      Expanded(child: _answerButton(label: 'Tidak', selected: answers[number] == false, value: false, number: number)),
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

  Widget _answerButton({required String label, required bool selected, required bool value, required int number}) {
    return GestureDetector(
      onTap: () => setState(() => answers[number] = value),
      child: Container(
        height: 48,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? AppColors.blue300 : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.blue300),
        ),
        child: Text(label, style: AppTextStyles.bold(AppTextStyles.body1).copyWith(color: selected ? Colors.white : AppColors.blue300)),
      ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required String hint,
    required EtibiLocationEntity? value,
    required List<EtibiLocationEntity> items,
    required Function(EtibiLocationEntity?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.semiBold(AppTextStyles.body1)),
        const SizedBox(height: 8),
        DropdownButtonFormField<EtibiLocationEntity>(
          value: value,
          isExpanded: true,
          decoration: InputDecoration(hintText: hint, border: OutlineInputBorder(borderRadius: BorderRadius.circular(16))),
          items: items.map((e) => DropdownMenuItem(value: e, child: Text(e.name))).toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}