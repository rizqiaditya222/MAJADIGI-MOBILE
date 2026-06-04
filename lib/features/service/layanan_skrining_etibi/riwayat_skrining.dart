import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:majadigi/core/router/app_router.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';
import 'package:majadigi/core/widgets/auth_header_widget.dart';

// Sesuaikan import path
import 'package:majadigi/injection_container.dart';
import 'package:majadigi/features/skrining_etibi/domain/entities/etibi_entity.dart';
import 'package:majadigi/features/skrining_etibi/presentation/bloc/etibi_bloc.dart';

class RiwayatSkrining extends StatelessWidget {
  const RiwayatSkrining({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => s1<EtibiBloc>()..add(FetchHistory()),
      child: const _RiwayatSkriningView(),
    );
  }
}

class _RiwayatSkriningView extends StatelessWidget {
  const _RiwayatSkriningView();

  Color _getRiskColor(String risk) {
    if (risk.contains('Rendah')) return const Color(0xFF27AE60);
    if (risk.contains('Sedang')) return const Color(0xFFFFA91A);
    return const Color(0xFFFF0054);
  }

  String _formatDate(String isoDate) {
    try {
      final date = DateTime.parse(isoDate).toLocal();
      return "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}";
    } catch (e) {
      return isoDate.length >= 10 ? isoDate.substring(0, 10) : isoDate;
    }
  }

  String _formatTime(String isoDate) {
    try {
      final date = DateTime.parse(isoDate).toLocal();
      return "${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}";
    } catch (e) {
      return "-";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark100,
      body: Column(
        children: [
          AuthHeaderWidget(
            imagePath: 'lib/assets/images/etibi_background.png',
            showTitle: true,
            title: 'Riwayat Skrining',
            onBackPressed: () => context.pop(),
          ),
          Expanded(
            child: BlocBuilder<EtibiBloc, EtibiState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state.error != null) {
                  return Center(
                    child: Text(state.error!, style: const TextStyle(color: Colors.red)),
                  );
                }
                if (state.historyList.isEmpty) {
                  return const Center(child: Text("Belum ada riwayat skrining."));
                }

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  itemCount: state.historyList.length,
                  itemBuilder: (context, index) {
                    final item = state.historyList[index];
                    final color = _getRiskColor(item.riskLevel);

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: GestureDetector(
                        onTap: () {
                    
                         context.push(Routes.detailSkriningEtibi, extra: item.id);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(color: const Color(0xFFEAEAEA)),
                          ),
                          child: Row(
                            children: [
                              /// IMAGE
                              Container(
                                width: 64,
                                height: 64,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: color.withOpacity(0.15),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Image.asset('lib/assets/images/etibi_background.png', fit: BoxFit.contain),
                                ),
                              ),
                              const SizedBox(width: 16),
                              /// CONTENT
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          _formatDate(item.date),
                                          style: AppTextStyles.medium(AppTextStyles.body3).copyWith(color: AppColors.dark300),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 8),
                                          child: Text('•', style: TextStyle(color: Color(0xFFBDBDBD))),
                                        ),
                                        Text(
                                          _formatTime(item.date),
                                          style: AppTextStyles.medium(AppTextStyles.body3).copyWith(color: AppColors.dark300),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      item.riskLevel,
                                      style: AppTextStyles.bold(AppTextStyles.h3).copyWith(color: color),
                                    ),
                                  ],
                                ),
                              ),
                              const Icon(Icons.chevron_right_rounded, size: 32, color: Color(0xFF9A9A9A)),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}