import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:majadigi/core/router/app_router.dart';
import 'package:majadigi/core/widgets/auth_header_widget.dart';
import 'package:majadigi/core/widgets/labeled_text_field.dart';
import 'package:majadigi/core/widgets/primary_button.dart';

import 'package:majadigi/injection_container.dart';
import 'package:majadigi/features/bapenda/presentation/bloc/info_pajak_bloc.dart';

class InfoPajakBapenda extends StatelessWidget {
  const InfoPajakBapenda({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => s1<InfoPajakBloc>(),
      child: const InfoPajakView(),
    );
  }
}

class InfoPajakView extends StatefulWidget {
  const InfoPajakView({super.key});

  @override
  State<InfoPajakView> createState() => _InfoPajakViewState();
}

class _InfoPajakViewState extends State<InfoPajakView> {
  final plateController = TextEditingController();
  final chassisController = TextEditingController();
  bool isRobotChecked = false;

  @override
  void dispose() {
    plateController.dispose();
    chassisController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: BlocConsumer<InfoPajakBloc, InfoPajakState>(
        listener: (context, state) {
          if (state is InfoPajakLoaded) {
            context.push(Routes.detailPajakBapenda, extra: state.data);
          } else if (state is InfoPajakError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message, style: const TextStyle(color: Colors.white)), backgroundColor: Colors.red));
          }
        },
        builder: (context, state) {
          return Column(
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
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset('lib/assets/images/bapenda_background.png', width: double.infinity, height: 160, fit: BoxFit.cover),
                        ),
                        const SizedBox(height: 24),

                        LabeledTextField(
                          label: 'Plat Nomor Kendaraan',
                          hintText: 'Masukkan Nomor Polisi',
                          controller: plateController,
                        ),
                        const SizedBox(height: 20),

                        LabeledTextField(
                          label: '5 Digit Terakhir Nomor Rangka',
                          hintText: 'Masukkan Nomor',
                          controller: chassisController,
                          keyboardType: TextInputType.text,
                        ),
                        const SizedBox(height: 20),

                        Container(
                          height: 58,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(border: Border.all(color: const Color(0xFFD9D9D9)), borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            children: [
                              Checkbox(value: isRobotChecked, onChanged: (v) => setState(() => isRobotChecked = v ?? false)),
                              const SizedBox(width: 8),
                              const Expanded(child: Text('Saya bukan robot', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
                              Image.asset('lib/assets/images/bapenda_background.png', width: 32, height: 32),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),

                        if (state is InfoPajakLoading)
                          const Center(child: CircularProgressIndicator())
                        else
                          PrimaryButton(
                            label: 'Submit',
                            onPressed: () {
                              if (plateController.text.isEmpty || chassisController.text.isEmpty || !isRobotChecked) return;
                              context.read<InfoPajakBloc>().add(FetchInfoPajak(
                                platNomor: plateController.text,
                                nomorRangka: chassisController.text,
                              ));
                            },
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}