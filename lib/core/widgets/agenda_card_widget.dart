import 'package:flutter/material.dart';

import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';

class AgendaCardWidget extends StatelessWidget {
  final String image;
  final String date;
  final String title;
  final String location;

  final VoidCallback onTap;

  const AgendaCardWidget({
    super.key,

    required this.image,
    required this.date,
    required this.title,
    required this.location,

    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        width: double.infinity,

        padding: const EdgeInsets.all(
          20,
        ),

        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius:
          BorderRadius.circular(
            16,
          ),
        ),

        child: Row(
          children: [

            /// IMAGE
            Image.asset(
              image,
              width: 42,
              height: 42,
            ),

            const SizedBox(width: 16),

            /// CONTENT
            Expanded(
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  /// DATE
                  Row(
                    children: [

                      const Icon(
                        Icons
                            .calendar_today_rounded,
                        size: 10,
                        color: Color(
                          0xFF27AE60,
                        ),
                      ),

                      const SizedBox(width: 6),

                      Expanded(
                        child: Text(
                          date,

                          style:
                          AppTextStyles.medium(
                            AppTextStyles
                                .body3,
                          ).copyWith(
                            color:
                            AppColors
                                .dark300,
                          ),

                          maxLines: 1,

                          overflow:
                          TextOverflow
                              .ellipsis,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 6),

                  /// TITLE
                  Text(
                    title,

                    style:
                    AppTextStyles
                        .semiBold(
                      AppTextStyles.h3,
                    ).copyWith(
                      color:
                      AppColors.dark500,
                    ),
                  ),

                  const SizedBox(height: 6),

                  /// LOCATION
                  Row(
                    children: [

                      const Icon(
                        Icons
                            .location_on_rounded,
                        size: 12,
                        color:
                        AppColors
                            .blue300,
                      ),

                      const SizedBox(width: 4),

                      Expanded(
                        child: Text(
                          location,

                          style:
                          AppTextStyles
                              .medium(
                            AppTextStyles
                                .body2,
                          ).copyWith(
                            color:
                            AppColors
                                .blue300,
                          ),

                          maxLines: 1,

                          overflow:
                          TextOverflow
                              .ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(width: 6),

            /// ARROW
            Icon(
              Icons.chevron_right_rounded,
              size: 24,
              color: Colors.black.withOpacity(
                0.35,
              ),
            ),
          ],
        ),
      ),
    );
  }
}