import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class ServiceMenuBottomSheet extends StatefulWidget {
  const ServiceMenuBottomSheet({super.key});

  @override
  State<ServiceMenuBottomSheet> createState() =>
      _ServiceMenuBottomSheetState();
}

class _ServiceMenuBottomSheetState
    extends State<ServiceMenuBottomSheet> {
  int selectedCategory = 0;

  final categories = [
    'EKONOMI',
    'KESEHATAN',
    'PARIWISATA',
    'SOSIAL',
  ];

  final services = [
    {
      'title': 'Islamic\nCenter',
      'image': 'lib/assets/images/jatim_icon.png',
    },
    {
      'title': 'Harga\nBahan Pokok',
      'image': 'lib/assets/images/jatim_icon.png',
    },
    {
      'title': 'Skrining\nE-Tibi',
      'image': 'lib/assets/images/jatim_icon.png',
    },
    {
      'title': 'RSUD Hada\nHusada',
      'image': 'lib/assets/images/jatim_icon.png',
    },
    {
      'title': 'Islamic\nCenter',
      'image': 'lib/assets/images/jatim_icon.png',
    },
    {
      'title': 'Harga\nBahan Pokok',
      'image': 'lib/assets/images/jatim_icon.png',
    },
    {
      'title': 'Skrining\nE-Tibi',
      'image': 'lib/assets/images/jatim_icon.png',
    },
    {
      'title': 'RSUD Hada\nHusada',
      'image': 'lib/assets/images/jatim_icon.png',
    },
  ];

  Widget buildServiceGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: services.length,
      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 12,
        mainAxisSpacing: 16,
        childAspectRatio: .78,
      ),
      itemBuilder: (context, index) {
        final item = services[index];

        return Column(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.blue150,
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Image.asset(
                  item['image']!,
                ),
              ),
            ),

            const SizedBox(height: 8),

            Text(
              item['title']!,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.regular(
                AppTextStyles.body2,
              ).copyWith(
                color: AppColors.dark400,
                height: 1.1,
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .88,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(28),
        ),
      ),
      child: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              24,
              12,
              24,
              24,
            ),
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 64,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius:
                      BorderRadius.circular(20),
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                Text(
                  'Rekomendasi Layanan',
                  style: AppTextStyles.bold(
                    AppTextStyles.h3,
                  ),
                ),

                const SizedBox(height: 24),

                buildServiceGrid(),

                const SizedBox(height: 40),

                Text(
                  'Berdasarkan Kategori',
                  style: AppTextStyles.bold(
                    AppTextStyles.h3,
                  ),
                ),

                const SizedBox(height: 24),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      categories.length,
                          (index) {
                        final selected =
                            selectedCategory ==
                                index;

                        return Padding(
                          padding:
                          const EdgeInsets.only(
                            right: 12,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedCategory =
                                    index;
                              });
                            },
                            child: Container(
                              height: 32,
                              padding:
                              const EdgeInsets
                                  .symmetric(
                                horizontal: 16,
                              ),
                              decoration:
                              BoxDecoration(
                                color: selected
                                    ? AppColors
                                    .blue300
                                    : AppColors
                                    .blue150,
                                borderRadius:
                                BorderRadius
                                    .circular(
                                  20,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  categories[index],
                                  style:
                                  AppTextStyles
                                      .semiBold(
                                    AppTextStyles
                                        .body2,
                                  ).copyWith(
                                    color: selected
                                        ? Colors
                                        .white
                                        : AppColors
                                        .blue300,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                buildServiceGrid(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}