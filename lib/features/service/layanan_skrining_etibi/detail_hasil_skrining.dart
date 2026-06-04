import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/auth_header_widget.dart';
import 'package:majadigi/injection_container.dart';
import 'package:majadigi/features/skrining_etibi/domain/entities/etibi_entity.dart';
import 'package:majadigi/features/skrining_etibi/presentation/bloc/etibi_bloc.dart';

enum RiskLevel { rendah, sedang, tinggi }

class DetailHasilSkrining extends StatelessWidget {
  final int questionnaireId;
  const DetailHasilSkrining({super.key, required this.questionnaireId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => s1<EtibiBloc>()..add(FetchDetailHistory(questionnaireId)),
      child: const _DetailHasilSkriningView(),
    );
  }
}

class _DetailHasilSkriningView extends StatelessWidget {
  const _DetailHasilSkriningView();

  RiskData _getRiskData(String riskLevelStr) {
    if (riskLevelStr.contains('Rendah')) {
      return RiskData(
        label: 'Risiko Rendah', title: 'Risiko Anda : Rendah',
        description: 'Gejala yang Anda alami masih minim dan belum mengarah kuat ke TBC.',
        description2: 'Tetap jaga pola hidup sehat dan lakukan pemeriksaan apabila gejala muncul atau berlanjut.',
        badgeColor: const Color(0xFF27AE60), image: 'lib/assets/images/etibi_background.png',
        suggestions: ['Terapkan pola hidup sehat dan seimbang', 'Pastikan ventilasi rumah baik dan sinar matahari masuk', 'Gunakan masker saat batuk atau pilek', 'Periksa ke fasilitas kesehatan bila gejala berlanjut'],
      );
    } else if (riskLevelStr.contains('Sedang')) {
      return RiskData(
        label: 'Risiko Sedang', title: 'Risiko Anda: Sedang',
        description: 'Terdapat beberapa gejala yang perlu diperiksa lebih lanjut.',
        description2: 'Disarankan untuk melakukan pemeriksaan di fasilitas kesehatan terdekat.',
        badgeColor: const Color(0xFFFFA91A), image: 'lib/assets/images/etibi_background.png',
        suggestions: ['Lakukan pemeriksaan lebih lanjut', 'Perhatikan kondisi tubuh secara berkala', 'Jaga pola makan dan istirahat cukup', 'Gunakan masker saat batuk'],
      );
    } else {
      return RiskData(
        label: 'Risiko Tinggi', title: 'Risiko Anda: Tinggi',
        description: 'Gejala yang Anda alami cukup mengarah pada TBC.',
        description2: 'Segera lakukan pemeriksaan di fasilitas kesehatan untuk mendapatkan penanganan yang tepat.',
        badgeColor: const Color(0xFFFF0054), image: 'lib/assets/images/etibi_background.png',
        suggestions: ['Segera periksa ke fasilitas kesehatan', 'Hindari kontak dekat sementara waktu', 'Gunakan masker dan jaga kebersihan diri', 'Periksa ke fasilitas kesehatan bila gejala berlanjut'],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          AuthHeaderWidget(
            imagePath: 'lib/assets/images/etibi_background.png',
            showTitle: true, title: 'Detail Hasil',
            onBackPressed: () => context.pop(),
          ),
          Expanded(
            child: BlocBuilder<EtibiBloc, EtibiState>(
              builder: (context, state) {
                if (state.isLoading) return const Center(child: CircularProgressIndicator());
                if (state.error != null) return Center(child: Text(state.error!, style: const TextStyle(color: Colors.red)));
                if (state.detailData == null) return const SizedBox();

                final detail = state.detailData!;
                final data = _getRiskData(detail.riskLevel);
                final int tidakCount = detail.answers.where((a) => !a.isYa).length;

                return SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      // ── Kartu Utama ──
                      Container(
                        padding: const EdgeInsets.all(32),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(32)),
                        child: Column(
                          children: [
                            Container(
                              width: 220, height: 220,
                              decoration: BoxDecoration(shape: BoxShape.circle, color: data.badgeColor.withOpacity(0.15)),
                              child: Padding(padding: const EdgeInsets.all(34), child: Image.asset(data.image, fit: BoxFit.contain)),
                            ),
                            const SizedBox(height: 28),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 14),
                              decoration: BoxDecoration(color: data.badgeColor, borderRadius: BorderRadius.circular(100)),
                              child: Text(data.label, style: AppTextStyles.bold(AppTextStyles.body1).copyWith(color: Colors.white)),
                            ),
                            const SizedBox(height: 40),
                            Text(data.title, textAlign: TextAlign.center, style: AppTextStyles.bold(AppTextStyles.h2)),
                            const SizedBox(height: 20),
                            Text(data.description, textAlign: TextAlign.center, style: AppTextStyles.medium(AppTextStyles.body1)),
                            const SizedBox(height: 28),
                            Text(data.description2, textAlign: TextAlign.center, style: AppTextStyles.medium(AppTextStyles.body1)),
                            const SizedBox(height: 40),
                            _buildSuggestionCard(data),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      // ── Kartu Ringkasan Jawaban ──
                      _buildRingkasanCard(detail.yesCount, tidakCount),
                      const SizedBox(height: 16),
                      // ── Kartu Jawaban Anda ──
                      _buildJawabanCard(detail.answers),
                      const SizedBox(height: 16),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuggestionCard(RiskData data) {
    return Container(
      width: double.infinity, padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: const Color(0xFFEAF1FF), borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Saran untuk anda', style: AppTextStyles.bold(AppTextStyles.h4).copyWith(color: AppColors.blue300)),
          const SizedBox(height: 24),
          ...data.suggestions.map((item) => Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.health_and_safety, size: 28, color: Color(0xFF555555)),
                const SizedBox(width: 16),
                Expanded(child: Text(item, style: AppTextStyles.medium(AppTextStyles.body1).copyWith(height: 1.6))),
              ],
            ),
          )),
        ],
      ),
    );
  }

  Widget _buildRingkasanCard(int yaCount, int tidakCount) {
    return Container(
      width: double.infinity, padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Ringkasan Jawaban', style: AppTextStyles.bold(AppTextStyles.h4).copyWith(color: AppColors.blue300)),
          const SizedBox(height: 20),
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(child: Column(children: [Text('Ya', style: AppTextStyles.medium(AppTextStyles.body1).copyWith(color: const Color(0xFF333333))), const SizedBox(height: 8), Text(yaCount.toString(), style: AppTextStyles.bold(AppTextStyles.h2).copyWith(color: const Color(0xFF27AE60)))] )),
                VerticalDivider(color: Colors.grey.shade200, thickness: 1),
                Expanded(child: Column(children: [Text('Tidak', style: AppTextStyles.medium(AppTextStyles.body1).copyWith(color: const Color(0xFF333333))), const SizedBox(height: 8), Text(tidakCount.toString(), style: AppTextStyles.bold(AppTextStyles.h2).copyWith(color: const Color(0xFFFF0054)))] )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildJawabanCard(List<EtibiAnswerEntity> answers) {
    return Container(
      width: double.infinity, padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Jawaban Anda', style: AppTextStyles.bold(AppTextStyles.h4).copyWith(color: AppColors.blue300)),
          const SizedBox(height: 16),
          ...answers.asMap().entries.map((entry) {
            final isYa = entry.value.isYa;
            final badgeColor = isYa ? const Color(0xFF27AE60) : const Color(0xFFFF0054);
            return Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: Row(
                children: [
                  Expanded(child: Text('${entry.key + 1}. ${entry.value.question}', style: AppTextStyles.medium(AppTextStyles.body1).copyWith(color: const Color(0xFF333333)))),
                  const SizedBox(width: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(color: badgeColor.withOpacity(0.12), borderRadius: BorderRadius.circular(20)),
                    child: Text(isYa ? 'Ya' : 'Tidak', style: AppTextStyles.medium(AppTextStyles.body2).copyWith(color: badgeColor)),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}

class RiskData {
  final String label;
  final String title;
  final String description;
  final String description2;
  final Color badgeColor;
  final String image;
  final List<String> suggestions;

  RiskData({required this.label, required this.title, required this.description, required this.description2, required this.badgeColor, required this.image, required this.suggestions});
}