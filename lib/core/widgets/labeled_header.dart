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

  final bool showFilterButton;
  final VoidCallback? onFilterPressed;

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
    this.showFilterButton = false,
    this.onFilterPressed,
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
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF0090FF),
                    Color(0xFF005699),
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
              ),
              child: Image.asset(
                backgroundImage,
                fit: BoxFit.cover,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(
              left: 12,
              right: 12,
              top: 48,
              bottom: 24,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed:
                      onBackPressed ?? () {},
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: Padding(
                        padding:
                        const EdgeInsets.only(
                          top: 8,
                        ),
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment
                              .start,
                          children: [
                            Text(
                              title,
                              style: AppTextStyles
                                  .semiBold(
                                AppTextStyles.h2,
                              ).copyWith(
                                color:
                                Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              description,
                              style: AppTextStyles
                                  .regular(
                                AppTextStyles
                                    .body1,
                              ).copyWith(
                                color:
                                Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    IconButton(
                      icon: const Icon(
                        Icons.bookmark_add,
                        color: Colors.white,
                      ),
                      onPressed:
                      onBookmarkPressed ??
                              () {},
                    ),
                  ],
                ),

                if (showSearch &&
                    searchController != null) ...[
                  const SizedBox(height: 16),

                  Padding(
                    padding:
                    const EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 52,
                            decoration:
                            BoxDecoration(
                              color:
                              Colors.white,
                              borderRadius:
                              BorderRadius
                                  .circular(
                                28,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors
                                      .black
                                      .withOpacity(
                                    0.15,
                                  ),
                                  blurRadius:
                                  10,
                                  offset:
                                  const Offset(
                                    0,
                                    4,
                                  ),
                                ),
                              ],
                            ),
                            child: TextField(
                              controller:
                              searchController,
                              decoration:
                              InputDecoration(
                                hintText:
                                searchHintText,
                                border:
                                InputBorder
                                    .none,
                                prefixIcon:
                                const Icon(
                                  Icons.search,
                                ),
                                contentPadding:
                                const EdgeInsets
                                    .symmetric(
                                  vertical: 14,
                                ),
                              ),
                            ),
                          ),
                        ),

                        if (showFilterButton) ...[
                          const SizedBox(
                            width: 12,
                          ),

                          Material(
                            color:
                            Colors.white,
                            elevation: 4,
                            borderRadius:
                            BorderRadius
                                .circular(
                              100,
                            ),
                            child: InkWell(
                              borderRadius:
                              BorderRadius
                                  .circular(
                                100,
                              ),
                              onTap:
                              onFilterPressed,
                              child: Container(
                                width: 52,
                                height: 52,
                                alignment:
                                Alignment
                                    .center,
                                child:
                                const Icon(
                                  Icons.tune,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ],
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