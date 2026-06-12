import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/auth_header_widget.dart';

class KebijakanPrivasiPage extends StatelessWidget {
  const KebijakanPrivasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark100,
      body: SingleChildScrollView(
        child: Column(
          children: [
            AuthHeaderWidget(
              imagePath: 'lib/assets/images/wayang_image.png',
              showTitle: true,
              title: 'Kebijakan Privasi',
              onBackPressed: () {
                context.pop();
              },
            ),

            Container(
              width: double.infinity,
              color: AppColors.white,
              padding: const EdgeInsets.symmetric(
                vertical: 32,
              ),
              child: Center(
                child: Image.asset(
                  'lib/assets/images/logo_majadigi.png',
                  width: 220,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(
                24,
                32,
                24,
                40,
              ),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    'Kebijakan Privasi Aplikasi Majadigi',
                    style: AppTextStyles.bold(
                      AppTextStyles.h2,
                    ).copyWith(
                      color: AppColors.black,
                    ),
                  ),

                  const SizedBox(height: 32),

                  _buildParagraph(
                    'Majadigi adalah aplikasi portal layanan resmi Provinsi Jawa Timur yang berkomitmen untuk melindungi privasi pengguna. Kebijakan Privasi ini menjelaskan bagaimana kami mengumpulkan, menggunakan, mengungkapkan, dan melindungi informasi pribadi Anda saat menggunakan aplikasi Majadigi.',
                  ),

                  _buildSectionTitle(
                    'Informasi yang Dikumpulkan',
                  ),

                  _buildParagraph(
                    'Kami dapat mengumpulkan informasi berikut:',
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      bottom: 24,
                    ),
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        _buildListItem(
                          '• Informasi Identitas: Nama, alamat email, nomor telepon, dan data lain yang diperlukan untuk pendaftaran.',
                        ),
                        const SizedBox(height: 8),
                        _buildListItem(
                          '• Informasi Perangkat: Jenis perangkat, sistem operasi, dan alamat IP.',
                        ),
                        const SizedBox(height: 8),
                        _buildListItem(
                          '• Data Penggunaan: Aktivitas pengguna di dalam aplikasi, termasuk layanan yang diakses.',
                        ),
                        const SizedBox(height: 8),
                        _buildListItem(
                          '• Data Lokasi: Jika diizinkan oleh pengguna, untuk menyediakan layanan berbasis lokasi.',
                        ),
                      ],
                    ),
                  ),

                  _buildSectionTitle(
                    'Penggunaan Informasi',
                  ),

                  _buildParagraph(
                    'Informasi yang dikumpulkan digunakan untuk:',
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      bottom: 24,
                    ),
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        _buildListItem(
                          '• Menyediakan dan meningkatkan layanan dalam aplikasi.',
                        ),
                        const SizedBox(height: 8),
                        _buildListItem(
                          '• Memproses permohonan dan transaksi pengguna.',
                        ),
                        const SizedBox(height: 8),
                        _buildListItem(
                          '• Mengirimkan notifikasi, pembaruan, dan informasi layanan.',
                        ),
                        const SizedBox(height: 8),
                        _buildListItem(
                          '• Memastikan keamanan dan kepatuhan terhadap hukum.',
                        ),
                      ],
                    ),
                  ),

                  _buildSectionTitle(
                    'Perlindungan Data Pengguna',
                  ),

                  _buildParagraph(
                    'Kami menerapkan langkah-langkah keamanan untuk melindungi informasi pengguna dari akses yang tidak sah, kehilangan, atau penyalahgunaan. Namun, pengguna juga bertanggung jawab untuk menjaga keamanan akun mereka.',
                  ),

                  _buildSectionTitle(
                    'Berbagi Informasi dengan Pihak Ketiga',
                  ),

                  _buildParagraph(
                    'Kami tidak menjual atau menyewakan informasi pribadi pengguna kepada pihak ketiga. Namun, kami dapat membagikan informasi dengan:',
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      bottom: 24,
                    ),
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        _buildListItem(
                          '• Instansi pemerintah terkait untuk kepentingan layanan publik.',
                        ),
                        const SizedBox(height: 8),
                        _buildListItem(
                          '• Penyedia layanan pihak ketiga yang membantu dalam operasional aplikasi.',
                        ),
                        const SizedBox(height: 8),
                        _buildListItem(
                          '• Pihak yang berwenang jika diwajibkan oleh hukum.',
                        ),
                      ],
                    ),
                  ),

                  _buildSectionTitle(
                    'Hak Pengguna',
                  ),

                  _buildParagraph(
                    'Pengguna memiliki hak untuk:',
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      bottom: 24,
                    ),
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        _buildListItem(
                          '• Mengakses dan memperbarui informasi pribadi mereka.',
                        ),
                        const SizedBox(height: 8),
                        _buildListItem(
                          '• Meminta penghapusan akun dan data pribadi mereka sesuai ketentuan yang berlaku.',
                        ),
                        const SizedBox(height: 8),
                        _buildListItem(
                          '• Mengelola preferensi terkait notifikasi dan penggunaan data.',
                        ),
                      ],
                    ),
                  ),

                  _buildSectionTitle(
                    'Perubahan Kebijakan Privasi',
                  ),

                  _buildParagraph(
                    'Kebijakan ini dapat diperbarui dari waktu ke waktu. Kami akan memberitahukan pengguna mengenai perubahan signifikan melalui aplikasi atau media resmi lainnya.',
                  ),

                  _buildSectionTitle(
                    'Hubungi Kami',
                  ),

                  _buildParagraph(
                    'Jika terdapat pertanyaan terkait kebijakan privasi ini, pengguna dapat menghubungi layanan bantuan melalui email atau kontak resmi yang tersedia di aplikasi Majadigi.',
                  ),

                  _buildParagraph(
                    'Dengan menggunakan aplikasi Majadigi, pengguna dianggap telah membaca, memahami, dan menyetujui Kebijakan Privasi ini.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 12,
      ),
      child: Text(
        title,
        style: AppTextStyles.bold(
          AppTextStyles.h3,
        ).copyWith(
          color: AppColors.black,
        ),
      ),
    );
  }

  Widget _buildParagraph(String text) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 24,
      ),
      child: Text(
        text,
        textAlign: TextAlign.justify,
        style: AppTextStyles.regular(
          AppTextStyles.body1,
        ).copyWith(
          color: AppColors.dark400,
          height: 1.8,
        ),
      ),
    );
  }

  Widget _buildListItem(String text) {
    return Text(
      text,
      textAlign: TextAlign.justify,
      style: AppTextStyles.regular(
        AppTextStyles.body1,
      ).copyWith(
        color: AppColors.dark400,
        height: 1.8,
      ),
    );
  }
}