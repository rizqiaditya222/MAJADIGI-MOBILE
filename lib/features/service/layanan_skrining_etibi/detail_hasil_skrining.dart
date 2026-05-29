import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/auth_header_widget.dart';
import '../../../core/widgets/primary_button.dart';

enum RiskLevel {
  rendah,
  sedang,
  tinggi,
}



class AnswerItem {
  final String question;
  final bool isYa;

  const AnswerItem({
    required this.question,
    required this.isYa,
  });
}

class FaskesData {
  final String name;
  final String city;
  final String phone;

  const FaskesData({
    required this.name,
    required this.city,
    required this.phone,
  });
}

class DetailHasilSkrining extends StatefulWidget {
  final RiskLevel riskLevel;
  final List<AnswerItem> answers;
  final FaskesData? selectedFaskes;

  const DetailHasilSkrining({
    super.key,
    this.riskLevel = RiskLevel.tinggi,
    this.answers = const [
      AnswerItem(
        question: 'Batuk lebih dari 2 minggu?',
        isYa: false,
      ),
      AnswerItem(
        question: 'Batuk berdarah?',
        isYa: false,
      ),
      AnswerItem(
        question: 'Mudah lelah atau lemas?',
        isYa: true,
      ),
      AnswerItem(
        question: 'Berat badan menurun?',
        isYa: true,
      ),
      AnswerItem(
        question: 'Demam atau meriang malam hari?',
        isYa: true,
      ),
      AnswerItem(
        question: 'Berkeringat di malam hari?',
        isYa: false,
      ),
      AnswerItem(
        question: 'Nafsu makan menurun?',
        isYa: false,
      ),
      AnswerItem(
        question: 'Nyeri dada atau sesak napas?',
        isYa: false,
      ),
      AnswerItem(
        question: 'Pernah kontak dengan penderita TBC?',
        isYa: false,
      ),
      AnswerItem(
        question: 'Tinggal serumah dengan penderita TBC?',
        isYa: false,
      ),
    ],
    this.selectedFaskes = const FaskesData(
      name: 'PUSKESMAS KEDUNGKANDANG',
      city: 'Kota Malang',
      phone: '-',
    ),
  });

  @override
  State<DetailHasilSkrining> createState() => _DetailHasilSkriningState();
}

class _DetailHasilSkriningState extends State<DetailHasilSkrining> {
  RiskData get riskData {
    switch (widget.riskLevel) {
      case RiskLevel.rendah:
        return RiskData(
          label: 'Risiko Rendah',
          title: 'Risiko Anda : Rendah',
          description:
          'Gejala yang Anda alami masih minim dan belum mengarah kuat ke TBC.',
          description2:
          'Tetap jaga pola hidup sehat dan lakukan pemeriksaan apabila gejala muncul atau berlanjut.',
          badgeColor: const Color(0xFF27AE60),
          image: 'lib/assets/images/etibi_background.png',
          buttonText: 'Selesai',
          suggestions: [
            'Terapkan pola hidup sehat dan seimbang',
            'Pastikan ventilasi rumah baik dan sinar matahari masuk',
            'Gunakan masker saat batuk atau pilek',
            'Periksa ke fasilitas kesehatan bila gejala berlanjut',
          ],
        );

      case RiskLevel.sedang:
        return RiskData(
          label: 'Risiko Sedang',
          title: 'Risiko Anda: Sedang',
          description:
          'Terdapat beberapa gejala yang perlu diperiksa lebih lanjut.',
          description2:
          'Disarankan untuk melakukan pemeriksaan di fasilitas kesehatan terdekat.',
          badgeColor: const Color(0xFFFFA91A),
          image: 'lib/assets/images/etibi_background.png',
          buttonText: 'Selesai',
          suggestions: [
            'Lakukan pemeriksaan lebih lanjut',
            'Perhatikan kondisi tubuh secara berkala',
            'Jaga pola makan dan istirahat cukup',
            'Gunakan masker saat batuk',
          ],
        );

      case RiskLevel.tinggi:
        return RiskData(
          label: 'Risiko Tinggi',
          title: 'Risiko Anda: Tinggi',
          description: 'Gejala yang Anda alami cukup mengarah pada TBC.',
          description2:
          'Segera lakukan pemeriksaan di fasilitas kesehatan untuk mendapatkan penanganan yang tepat.',
          badgeColor: const Color(0xFFFF0054),
          image: 'lib/assets/images/etibi_background.png',
          buttonText: 'Pilih Faskes Tujuan Anda',
          suggestions: [
            'Segera periksa ke fasilitas kesehatan',
            'Hindari kontak dekat sementara waktu',
            'Gunakan masker dan jaga kebersihan diri',
            'Periksa ke fasilitas kesehatan bila gejala berlanjut',
          ],
        );
    }

  }

  int get yaCount => widget.answers.where((a) => a.isYa).length;
  int get tidakCount => widget.answers.where((a) => !a.isYa).length;

  @override
  Widget build(BuildContext context) {
    final data = riskData;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          AuthHeaderWidget(
            imagePath: 'lib/assets/images/etibi_background.png',
            showTitle: true,
            title: 'Detail Hasil',
            onBackPressed: () {
              context.pop();
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  // ── Kartu Utama ──
                  Container(
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 12),

                        // Lingkaran Gambar
                        Container(
                          width: 220,
                          height: 220,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: data.badgeColor.withOpacity(0.15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(34),
                            child: Image.asset(
                              data.image,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),

                        const SizedBox(height: 28),

                        // Badge Risiko
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 36,
                            vertical: 14,
                          ),
                          decoration: BoxDecoration(
                            color: data.badgeColor,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Text(
                            data.label,
                            style: AppTextStyles.bold(AppTextStyles.body1)
                                .copyWith(color: Colors.white),
                          ),
                        ),

                        const SizedBox(height: 40),

                        // Judul
                        Text(
                          data.title,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.bold(AppTextStyles.h2),
                        ),

                        const SizedBox(height: 20),

                        // Deskripsi 1
                        Text(
                          data.description,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.medium(AppTextStyles.body1),
                        ),

                        const SizedBox(height: 28),

                        // Deskripsi 2
                        Text(
                          data.description2,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.medium(AppTextStyles.body1),
                        ),

                        const SizedBox(height: 40),

                        // Kartu Saran
                        _buildSuggestionCard(data),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // ── Kartu Faskes (hanya risiko tinggi & ada data faskes) ──
                  if (widget.riskLevel == RiskLevel.tinggi &&
                      widget.selectedFaskes != null)
                    _buildFaskesCard(widget.selectedFaskes!, data.badgeColor),

                  if (widget.riskLevel == RiskLevel.tinggi &&
                      widget.selectedFaskes != null)
                    const SizedBox(height: 16),

                  // ── Kartu Ringkasan Jawaban ──
                  if (widget.answers.isNotEmpty) ...[
                    _buildRingkasanCard(),
                    const SizedBox(height: 16),

                    // ── Kartu Jawaban Anda ──
                    _buildJawabanCard(),
                    const SizedBox(height: 16),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Widget Kartu Saran ──
  Widget _buildSuggestionCard(RiskData data) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFEAF1FF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Saran untuk anda',
            style: AppTextStyles.bold(AppTextStyles.h4)
                .copyWith(color: AppColors.blue300),
          ),
          const SizedBox(height: 24),
          ...data.suggestions.map(
                (item) => Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.health_and_safety,
                    size: 28,
                    color: Color(0xFF555555),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      item,
                      style: AppTextStyles.medium(AppTextStyles.body1)
                          .copyWith(height: 1.6),
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

  // ── Widget Kartu Faskes ──
  Widget _buildFaskesCard(FaskesData faskes, Color accentColor) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          // Ikon Faskes
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: accentColor.withOpacity(0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.local_hospital_rounded,
              color: accentColor,
              size: 24,
            ),
          ),

          const SizedBox(width: 16),

          // Detail Faskes
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  faskes.name,
                  style: AppTextStyles.bold(AppTextStyles.body1),
                ),
                const SizedBox(height: 2),
                Text(
                  faskes.city,
                  style: AppTextStyles.medium(AppTextStyles.body2)
                      .copyWith(color: const Color(0xFF888888)),
                ),
                const SizedBox(height: 2),
                Text(
                  'Telp : ${faskes.phone}',
                  style: AppTextStyles.medium(AppTextStyles.body2)
                      .copyWith(color: const Color(0xFF888888)),
                ),
              ],
            ),
          ),

          // Badge Terpilih
          GestureDetector(
            onTap: () {
              context.push(
                Routes.faskesEtibi,
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: accentColor.withOpacity(0.12),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Terpilih',
                style: AppTextStyles.medium(
                  AppTextStyles.body2,
                ).copyWith(
                  color: accentColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Widget Kartu Ringkasan Jawaban ──
  Widget _buildRingkasanCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ringkasan Jawaban',
            style: AppTextStyles.bold(AppTextStyles.h4)
                .copyWith(color: AppColors.blue300),
          ),
          const SizedBox(height: 20),
          IntrinsicHeight(
            child: Row(
              children: [
                // Kolom Ya
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'ya',
                        style: AppTextStyles.medium(AppTextStyles.body1)
                            .copyWith(color: const Color(0xFF333333)),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        yaCount.toString(),
                        style: AppTextStyles.bold(AppTextStyles.h2)
                            .copyWith(color: const Color(0xFF27AE60)),
                      ),
                    ],
                  ),
                ),

                // Garis Pemisah
                VerticalDivider(
                  color: Colors.grey.shade200,
                  thickness: 1,
                ),

                // Kolom Tidak
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Tidak',
                        style: AppTextStyles.medium(AppTextStyles.body1)
                            .copyWith(color: const Color(0xFF333333)),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        tidakCount.toString(),
                        style: AppTextStyles.bold(AppTextStyles.h2)
                            .copyWith(color: const Color(0xFFFF0054)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── Widget Kartu Jawaban Anda ──
  Widget _buildJawabanCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Jawaban Anda',
            style: AppTextStyles.bold(AppTextStyles.h4)
                .copyWith(color: AppColors.blue300),
          ),
          const SizedBox(height: 16),
          ...widget.answers.asMap().entries.map((entry) {
            final index = entry.key;
            final item = entry.value;
            return _buildAnswerRow(index + 1, item);
          }),
        ],
      ),
    );
  }

  // ── Baris Jawaban ──
  Widget _buildAnswerRow(int number, AnswerItem item) {
    final isYa = item.isYa;
    final badgeColor =
    isYa ? const Color(0xFF27AE60) : const Color(0xFFFF0054);

    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        children: [
          // Nomor + Pertanyaan
          Expanded(
            child: Text(
              '$number. ${item.question}',
              style: AppTextStyles.medium(AppTextStyles.body1)
                  .copyWith(color: const Color(0xFF333333)),
            ),
          ),

          const SizedBox(width: 12),

          // Badge Ya / Tidak
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: badgeColor.withOpacity(0.12),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              isYa ? 'Ya' : 'Tidak',
              style: AppTextStyles.medium(AppTextStyles.body2)
                  .copyWith(color: badgeColor),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Model Data Risiko ──
class RiskData {
  final String label;
  final String title;
  final String description;
  final String description2;
  final Color badgeColor;
  final String image;
  final String buttonText;
  final List<String> suggestions;

  RiskData({
    required this.label,
    required this.title,
    required this.description,
    required this.description2,
    required this.badgeColor,
    required this.image,
    required this.buttonText,
    required this.suggestions,
  });
}