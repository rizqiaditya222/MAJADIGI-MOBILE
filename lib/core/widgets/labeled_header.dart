import 'package:flutter/material.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';

class LabeledHeader extends StatelessWidget {
  final String title;
  final String description;
  final String backgroundImage;
  final VoidCallback? onBackPressed;
  final VoidCallback? onBookmarkPressed;
  final TextEditingController? searchController;
  final bool showSearch;
  final String searchHintText;

  const LabeledHeader({
    super.key,
    required this.title,
    required this.description,
    required this.backgroundImage,
    this.onBackPressed,
    this.onBookmarkPressed,
    this.searchController,
    this.showSearch = false,
    this.searchHintText = 'Cari...',
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(24),
        bottomRight: Radius.circular(24),
      ),
      child: Stack(
        children: [
          // background
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF0090FF), Color(0xFF005699)],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
              ),
              child: Image.asset(
                backgroundImage,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          // konten
          Padding(
            padding: const EdgeInsets.only(
              left: 12,
              right: 12,
              top: 48,      // safe area / status bar
              bottom: 24,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: onBackPressed ?? () {},
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: AppTextStyles.semiBold(AppTextStyles.h2)
                                  .copyWith(color: AppColors.white),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              description,
                              style: AppTextStyles.regular(AppTextStyles.body1)
                                  .copyWith(color: AppColors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    IconButton(
                      icon: const Icon(Icons.bookmark_add, color: Colors.white),
                      onPressed: onBookmarkPressed ?? () {},
                    ),
                  ],
                ),
                if (showSearch && searchController != null) ...[
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: searchHintText,
                        hintStyle: AppTextStyles.medium(AppTextStyles.body1)
                            .copyWith(color: AppColors.dark300),
                        prefixIcon: Icon(Icons.search, color: AppColors.dark300),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: BorderSide(color: AppColors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: BorderSide(
                            color: AppColors.blue300,
                            width: 1.5,
                          ),
                        ),
                        filled: true,
                        fillColor: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
