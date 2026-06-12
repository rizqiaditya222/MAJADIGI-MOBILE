import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';
import 'package:majadigi/core/widgets/auth_header_widget.dart';

import '../../../../../core/router/app_router.dart';

class DataDiriPage extends StatefulWidget {
  const DataDiriPage({super.key});

  @override
  State<DataDiriPage> createState() => _DataDiriPageState();
}

class _DataDiriPageState extends State<DataDiriPage> {
  String namaLengkap = 'Andrian Faikha';
  String email = 'andrian@gmail.com';
  String nik = '';
  String alamat = '';
  String noHp = '';

  Future<void> _navigateToEdit({
    required String title,
    required String label,
    required String hint,
    required String value,
    TextInputType keyboardType = TextInputType.text,
    required Function(String) onSaved,
  }) async {
    final result = await context.push(
      Routes.editData,
      extra: {
        'title': title,
        'label': label,
        'hint': hint,
        'value': value,
        'keyboardType': keyboardType,
      },
    );

    if (result != null && result is String) {
      setState(() {
        onSaved(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark100,
      body: Column(
        children: [
          AuthHeaderWidget(
            imagePath: 'lib/assets/images/wayang_image.png',
            showTitle: true,
            title: 'Data Diri',
            onBackPressed: () {
              context.pop();
            },
          ),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 24,
              ),
              children: [
                _buildMenuItem(
                  title: 'Nama Lengkap',
                  value: namaLengkap,
                  onTap: () {
                    _navigateToEdit(
                      title: 'Ubah Nama Lengkap',
                      label: 'Nama Lengkap',
                      hint: 'Masukkan nama lengkap',
                      value: namaLengkap,
                      keyboardType: TextInputType.name,
                      onSaved: (value) {
                        namaLengkap = value;
                      },
                    );
                  },
                ),

                _buildMenuItem(
                  title: 'Email',
                  value: email,
                  onTap: () {
                    _navigateToEdit(
                      title: 'Ubah Email',
                      label: 'Email',
                      hint: 'Masukkan email',
                      value: email,
                      keyboardType:
                      TextInputType.emailAddress,
                      onSaved: (value) {
                        email = value;
                      },
                    );
                  },
                ),

                _buildMenuItem(
                  title: 'NIK',
                  value: nik.isEmpty
                      ? 'Belum Terisi'
                      : nik,
                  onTap: () {
                    _navigateToEdit(
                      title: 'Ubah NIK',
                      label: 'NIK',
                      hint: 'Masukkan NIK',
                      value: nik,
                      keyboardType:
                      TextInputType.number,
                      onSaved: (value) {
                        nik = value;
                      },
                    );
                  },
                ),

                _buildMenuItem(
                  title: 'Alamat',
                  value: alamat.isEmpty
                      ? 'Belum Terisi'
                      : alamat,
                  onTap: () {
                    _navigateToEdit(
                      title: 'Ubah Alamat',
                      label: 'Alamat',
                      hint: 'Masukkan alamat',
                      value: alamat,
                      keyboardType:
                      TextInputType.streetAddress,
                      onSaved: (value) {
                        alamat = value;
                      },
                    );
                  },
                ),

                _buildMenuItem(
                  title: 'No HP',
                  value: noHp.isEmpty
                      ? 'Belum Terisi'
                      : noHp,
                  onTap: () {
                    _navigateToEdit(
                      title: 'Ubah No HP',
                      label: 'No HP',
                      hint: 'Masukkan nomor handphone',
                      value: noHp,
                      keyboardType:
                      TextInputType.phone,
                      onSaved: (value) {
                        noHp = value;
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required String title,
    required String value,
    required VoidCallback onTap,
  }) {
    final isEmpty = value == 'Belum Terisi';

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 24,
        ),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColors.dark150,
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Text(
                title,
                style: AppTextStyles.medium(
                  AppTextStyles.body1,
                ).copyWith(
                  color: AppColors.dark500,
                ),
              ),
            ),

            Expanded(
              flex: 5,
              child: Text(
                value,
                textAlign: TextAlign.end,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.regular(
                  AppTextStyles.body1,
                ).copyWith(
                  color: isEmpty
                      ? AppColors.dark300
                      : AppColors.dark400,
                ),
              ),
            ),

            const SizedBox(width: 12),

            const Icon(
              Icons.chevron_right,
              color: AppColors.dark300,
            ),
          ],
        ),
      ),
    );
  }
}