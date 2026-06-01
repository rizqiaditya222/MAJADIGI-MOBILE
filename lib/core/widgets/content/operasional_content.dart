import 'package:flutter/material.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';

class OperasionalContent extends StatelessWidget {
  final String? linkUrl;
  final String? alamat;
  final Map<String, String>? jamOperasional;
  final List<Map<String, dynamic>>? mediaSosial;

  const OperasionalContent({
    super.key,
    this.linkUrl,
    this.alamat,
    this.jamOperasional,
    this.mediaSosial,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 4),

        /// Link Layanan
        if (linkUrl != null) ...[
          _sectionLabel('Link Layanan'),
          const SizedBox(height: 4),
          GestureDetector(
            onTap: () {
              // Handle URL open
            },
            child: Text(
              linkUrl!,
              style: AppTextStyles.regular(AppTextStyles.body2).copyWith(
                color: AppColors.blue300,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.blue300,
              ),
            ),
          ),
          const SizedBox(height: 12),
        ],

        /// Alamat
        if (alamat != null) ...[
          _sectionLabel('Alamat'),
          const SizedBox(height: 4),
          Text(
            alamat!,
            style: AppTextStyles.regular(AppTextStyles.body2)
                .copyWith(color: AppColors.dark400),
          ),
          const SizedBox(height: 12),
        ],

        /// Jam Operasional
        if (jamOperasional != null) ...[
          _sectionLabel('Jam Operasional'),
          const SizedBox(height: 8),
          _buildJamOperasional(jamOperasional!),
          const SizedBox(height: 12),
        ],

        /// Media Sosial
        if (mediaSosial != null && mediaSosial!.isNotEmpty) ...[
          _sectionLabel('Media Sosial'),
          const SizedBox(height: 8),
          Wrap(
            spacing: 12,
            runSpacing: 8,
            children: mediaSosial!
                .map((social) => _socialButton(social['icon'], social['label']))
                .toList(),
          ),
        ],
      ],
    );
  }

  Widget _buildJamOperasional(Map<String, String> jam) {
    final entries = jam.entries.toList();
    final leftItems = entries.sublist(0, (entries.length / 2).ceil());
    final rightItems = entries.sublist((entries.length / 2).ceil());

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              leftItems.length,
              (index) {
                final entry = leftItems[index];
                return Padding(
                  padding: EdgeInsets.only(bottom: index < leftItems.length - 1 ? 4 : 0),
                  child: _jamItem(entry.key, entry.value),
                );
              },
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              rightItems.length,
              (index) {
                final entry = rightItems[index];
                return Padding(
                  padding: EdgeInsets.only(bottom: index < rightItems.length - 1 ? 4 : 0),
                  child: _jamItem(entry.key, entry.value),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _sectionLabel(String text) {
    return Text(
      text,
      style: AppTextStyles.semiBold(AppTextStyles.body2)
          .copyWith(color: AppColors.dark500),
    );
  }

  Widget _jamItem(String day, String time) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '• ',
          style: AppTextStyles.regular(AppTextStyles.body2)
              .copyWith(color: AppColors.dark400),
        ),
        Expanded(
          child: Text(
            '$day ($time)',
            style: AppTextStyles.regular(AppTextStyles.body2)
                .copyWith(color: AppColors.dark400),
          ),
        ),
      ],
    );
  }

  Widget _socialButton(IconData icon, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 18, color: AppColors.blue300),
        const SizedBox(width: 4),
        Text(
          label,
          style: AppTextStyles.medium(AppTextStyles.body2)
              .copyWith(color: AppColors.blue300),
        ),
      ],
    );
  }
}

