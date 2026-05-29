import 'package:flutter/material.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';
import 'package:majadigi/core/widgets/index.dart';
import 'package:majadigi/core/widgets/labeled_header.dart';

class DasaHusadaPage extends StatefulWidget {
  const DasaHusadaPage({super.key});

  @override
  State<DasaHusadaPage> createState() => _DasaHusadaPage();
}

class _DasaHusadaPage extends State<DasaHusadaPage> {
  final TextEditingController searchController = TextEditingController();

  final List<Map<String, String>> layananList = [
    {
      'title': 'Jadwal Operasi',
      'description':
      'Info jadwal tindakan operasi RSUD Daha Husada',
      'image': 'lib/assets/images/wisata_sample.png',
    },
    {
      'title': 'Ketersediaan Kamar',
      'description':
      'Informasi jumlah kamar rawat inap yang tersedia',
      'image': 'lib/assets/images/wisata_sample.png',
    },
    {
      'title': 'Jadwal Dokter',
      'description':
      'Informasi jadwal praktik dokter spesialis dan umum',
      'image': 'lib/assets/images/wisata_sample.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark100,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [

          // HEADER
          LabeledHeader(
            title: 'RSUD Daha Husada',
            description:
            'Info ketersediaan kamar rawat RSUD Daha Husada Batu',
            backgroundImage: 'lib/assets/images/background_wisata.png',
            searchController: searchController,
            onBackPressed: () {
              Navigator.pop(context);
            },
            onBookmarkPressed: () {},
            showSearch: false,
          ),

          // CONTENT
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                itemCount: layananList.length,
                itemBuilder: (context, index) {
                  final layanan = layananList[index];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.04),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          // IMAGE
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24),
                            ),
                            child: Image.asset(
                              layanan['image']!,
                              width: double.infinity,
                              height: 160,
                              fit: BoxFit.cover,
                            ),
                          ),

                          // CONTENT
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 24,
                            ),
                            child: Column(
                              children: [

                                // TITLE
                                Text(
                                  layanan['title']!,
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.semiBold(
                                    AppTextStyles.h2,
                                  ).copyWith(
                                    color: AppColors.black,
                                  ),
                                ),

                                const SizedBox(height: 4),

                                // DESCRIPTION
                                Text(
                                  layanan['description']!,
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.regular(
                                    AppTextStyles.body2,
                                  ).copyWith(
                                    color: AppColors.dark300,
                                  ),
                                ),

                                const SizedBox(height: 24),

                                // BUTTON
                                PrimaryButton(label: 'CEK', onPressed: (){})
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}