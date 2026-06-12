import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';
import 'package:majadigi/core/widgets/auth_header_widget.dart';
import 'package:majadigi/core/widgets/labeled_text_field.dart';

class EditDataDiriPage extends StatefulWidget {
  final String title;
  final String fieldLabel;
  final String hintText;
  final String initialValue;
  final TextInputType keyboardType;

  const EditDataDiriPage({
    super.key,
    required this.title,
    required this.fieldLabel,
    required this.hintText,
    required this.initialValue,
    this.keyboardType = TextInputType.text,
  });

  @override
  State<EditDataDiriPage> createState() =>
      _EditDataDiriPageState();
}

class _EditDataDiriPageState
    extends State<EditDataDiriPage> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(
      text: widget.initialValue,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  String _getDescription() {
    switch (widget.fieldLabel) {
      case 'Nama Lengkap':
        return 'Masukan nama lengkap kamu, dan pastikan data yang kamu masukan sudah sesuai dengan KTP';

      case 'Email':
        return 'Masukan alamat email aktif yang dapat digunakan untuk menerima informasi akun';

      case 'NIK':
        return 'Masukan Nomor Induk Kependudukan sesuai dengan KTP';

      case 'Alamat':
        return 'Masukan alamat lengkap sesuai domisili saat ini';

      case 'No HP':
        return 'Masukan nomor handphone yang aktif dan dapat dihubungi';

      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark100,
      body: Column(
        children: [
          AuthHeaderWidget(
            imagePath:
            'lib/assets/images/wayang_image.png',
            showTitle: true,
            title: widget.title,
            onBackPressed: () {
              context.pop();
            },
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    _getDescription(),
                    style: AppTextStyles.regular(
                      AppTextStyles.body1,
                    ).copyWith(
                      color: AppColors.dark500,
                    ),
                  ),

                  const SizedBox(height: 32),

                  LabeledTextField(
                    label: widget.fieldLabel,
                    hintText: widget.hintText,
                    controller: controller,
                    keyboardType:
                    widget.keyboardType,
                  ),

                  const SizedBox(height: 40),

                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        context.pop(controller.text);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                        AppColors.blue300,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(
                            20,
                          ),
                        ),
                      ),
                      child: Text(
                        'Simpan',
                        style: AppTextStyles.semiBold(
                          AppTextStyles.body1,
                        ).copyWith(
                          color: AppColors.white,
                        ),
                      ),
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