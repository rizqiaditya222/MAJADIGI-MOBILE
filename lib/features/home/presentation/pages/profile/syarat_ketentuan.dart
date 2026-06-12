import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/auth_header_widget.dart';

class SyaratKetentuanPage extends StatelessWidget {
  const SyaratKetentuanPage({super.key});

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
              title: 'Syarat & Ketentuan',
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
                    'Syarat dan Ketentuan Penggunaan Aplikasi Majadigi',
                    style: AppTextStyles.bold(
                      AppTextStyles.h2,
                    ).copyWith(
                      color: AppColors.black,
                    ),
                  ),

                  const SizedBox(height: 32),

                  _buildSectionTitle(
                    'Pendahuluan',
                  ),

                  _buildParagraph(
                    'Selamat datang di Majadigi, aplikasi portal layanan resmi Provinsi Jawa Timur.',
                  ),

                  _buildParagraph(
                    'Dengan mengakses dan menggunakan aplikasi ini, pengguna dianggap telah membaca, memahami, dan menyetujui Syarat & Ketentuan yang berlaku. Jika pengguna tidak menyetujui ketentuan ini, disarankan untuk tidak menggunakan aplikasi Majadigi.',
                  ),

                  _buildSectionTitle(
                    'Ketentuan Pengguna',
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
                          '1. Pengguna harus memiliki akun yang terdaftar dan memberikan informasi yang akurat serta terbaru.',
                        ),
                        const SizedBox(height: 8),
                        _buildListItem(
                          '2. Pengguna bertanggung jawab atas keamanan akun, termasuk menjaga kerahasiaan kata sandi.',
                        ),
                        const SizedBox(height: 8),
                        _buildListItem(
                          '3. Dilarang menggunakan aplikasi ini untuk tujuan yang melanggar hukum atau merugikan pihak lain.',
                        ),
                      ],
                    ),
                  ),

                  _buildSectionTitle(
                    'Layanan yang Disediakan',
                  ),

                  _buildParagraph(
                    'Majadigi menyediakan berbagai layanan digital yang terkait dengan administrasi dan pelayanan publik di Provinsi Jawa Timur.',
                  ),

                  _buildParagraph(
                    'Pemerintah Provinsi Jawa Timur berhak menambah, mengubah, atau menghentikan layanan kapan saja tanpa pemberitahuan sebelumnya.',
                  ),

                  _buildSectionTitle(
                    'Penggunaan Data & Privasi',
                  ),

                  _buildParagraph(
                    'Majadigi mengelola data pengguna sesuai dengan Kebijakan Privasi yang berlaku.',
                  ),

                  _buildParagraph(
                    'Data pribadi pengguna akan digunakan hanya untuk kepentingan pelayanan publik dan tidak akan disalahgunakan.',
                  ),

                  _buildParagraph(
                    'Dengan menggunakan aplikasi ini, pengguna menyetujui pengumpulan dan pemrosesan data sesuai dengan kebijakan yang berlaku.',
                  ),

                  _buildSectionTitle(
                    'Hak Kekayaan Intelektual',
                  ),

                  _buildParagraph(
                    'Semua hak cipta, merek dagang, dan hak kekayaan intelektual lainnya dalam aplikasi ini dimiliki oleh Pemerintah Provinsi Jawa Timur.',
                  ),

                  _buildParagraph(
                    'Pengguna dilarang memperbanyak, mendistribusikan, atau menggunakan materi dalam aplikasi tanpa izin resmi.',
                  ),

                  _buildSectionTitle(
                    'Pembatasan Tanggung Jawab',
                  ),

                  _buildParagraph(
                    'Majadigi berupaya memberikan informasi dan layanan yang akurat, tetapi tidak menjamin bahwa semua informasi akan selalu bebas dari kesalahan atau gangguan teknis.',
                  ),

                  _buildParagraph(
                    'Pengguna setuju bahwa penggunaan aplikasi ini sepenuhnya merupakan tanggung jawab pribadi.',
                  ),

                  _buildSectionTitle(
                    'Perubahan Syarat & Ketentuan',
                  ),

                  _buildParagraph(
                    'Pemerintah Provinsi Jawa Timur dapat mengubah Syarat & Ketentuan ini sewaktu-waktu. Pengguna disarankan untuk selalu memeriksa pembaruan yang tersedia dalam aplikasi.',
                  ),

                  _buildSectionTitle(
                    'Hubungi Kami',
                  ),

                  _buildParagraph(
                    'Jika terdapat pertanyaan atau kendala terkait penggunaan aplikasi Majadigi, silakan menghubungi layanan bantuan melalui email atau kanal komunikasi resmi yang tersedia di aplikasi.',
                  ),

                  _buildParagraph(
                    'Dengan menggunakan aplikasi Majadigi, pengguna menyatakan telah memahami dan menyetujui seluruh ketentuan yang berlaku.',
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