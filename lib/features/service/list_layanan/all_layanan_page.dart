import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';

import '../../../core/router/app_router.dart';

class AllLayananPage extends StatefulWidget {
  const AllLayananPage({super.key});

  @override
  State<AllLayananPage> createState() => _AllLayananPageState();
}

class _AllLayananPageState extends State<AllLayananPage> {
  int _selectedCategoryIndex = 0;

  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> categories = [
    {
      'label': 'UNTUK ANDA',
      'icon': Icons.auto_awesome_rounded,
      'hasIcon': true,
    },
    {'label': 'EKONOMI', 'icon': null, 'hasIcon': false},
    {'label': 'KESEHATAN', 'icon': null, 'hasIcon': false},
    {'label': 'PARIWISATA', 'icon': null, 'hasIcon': false},
  ];

  final List<Map<String, dynamic>> layananList = [
    {
      'category': 'KESEHATAN',
      'title': 'Skrining ETIBI',
      'description': 'Skrining risiko TBC secara mandiri.',
      'image': 'lib/assets/images/jatim_icon.png',
      'route': Routes.layananEtibi,
    },
    {
      'category': 'KESEHATAN',
      'title': 'Dasa Husada',
      'description': 'Layanan kesehatan masyarakat.',
      'image': 'lib/assets/images/jatim_icon.png',
      'route': Routes.layananDasaHusada,
    },
    {
    'category': 'KESEHATAN',
    'title': 'Karsa Husada',
    'description': 'Layanan kesehatan masyarakat.',
    'image': 'lib/assets/images/jatim_icon.png',
    'route': Routes.layananKarsaHusada,
    },
    {
      'category': 'PARIWISATA',
      'title': 'Destinasi Wisata',
      'description': 'Temukan destinasi wisata terbaik.',
      'image': 'lib/assets/images/jatim_icon.png',
      'route': Routes.layananDestinasiWisata,
    },
    {
      'category': 'TRANSPORTASI',
      'title': 'Trans Jatim',
      'description': 'Informasi rute dan tiket Trans Jatim.',
      'image': 'lib/assets/images/jatim_icon.png',
      'route': Routes.layananTransjatim,
    },
    {
      'category': 'SOSIAL',
      'title': 'Islamic Center',
      'description': 'Pemesanan aula dan fasilitas Islamic Center.',
      'image': 'lib/assets/images/jatim_icon.png',
      'route': Routes.layananIslamicCenter,
    },
    {
      'category': 'EKONOMI',
      'title': 'Bapenda',
      'description': 'Informasi pajak dan NJKP.',
      'image': 'lib/assets/images/jatim_icon.png',
      'route': Routes.layananBapenda,
    },
    {
      'category': 'SOSIAL',
      'title': 'Klinik Hoaks',
      'description': 'Laporkan dan lacak informasi hoaks.',
      'image': 'lib/assets/images/jatim_icon.png',
      'route': Routes.layananKlinikHoaks,
    },
    {
      'category': 'SOSIAL',
      'title': 'Nomor Darurat',
      'description': 'Panggil nomor ini dalam keadaan darurat.',
      'image': 'lib/assets/images/jatim_icon.png',
      'route': Routes.layananNomorDarurat,
    },
    {
      'category': 'EKONOMI',
      'title': 'Harga Bahan Pokok',
      'description': 'Daftar harga bahan pokok saat ini.',
      'image': 'lib/assets/images/jatim_icon.png',
      'route': Routes.layananHargaBahanPokok,
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Widget buildOptionCard({
    required String imagePath,
    required String category,
    required String title,
    required String description,
    required VoidCallback onTap,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 2),
        GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.dark150, width: 1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: SizedBox(
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      imagePath,
                      width: 56,
                      height: 56,
                      fit: BoxFit.contain,
                    ),

                    const SizedBox(width: 20),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            category,
                            style: AppTextStyles.regular(
                              AppTextStyles.body4,
                            ).copyWith(color: AppColors.blue300),
                          ),

                          const SizedBox(height: 2),

                          Text(
                            title,
                            style: AppTextStyles.semiBold(
                              AppTextStyles.h4,
                            ).copyWith(color: AppColors.black),
                          ),

                          const SizedBox(height: 4),

                          Text(
                            description,
                            style: AppTextStyles.regular(
                              AppTextStyles.body3,
                            ).copyWith(color: AppColors.dark300),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 12),

                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColors.dark300,
                      size: 18,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 2),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          /// HEADER
          SizedBox(
            height: 216,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF0090FF), Color(0xFF005699)],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                      ),
                    ),
                    child: Image.asset(
                      'lib/assets/images/wayang_image.png',
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),

                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 12,
                          right: 12,
                          top: 24,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 12, top: 8, right: 12),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Semua Layanan Majadigi',
                                          style: AppTextStyles.semiBold(
                                            AppTextStyles.h2,
                                          ).copyWith(color: AppColors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 16),

                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              child: TextField(
                                controller: _searchController,
                                decoration: InputDecoration(
                                  hintText: 'Cari layanan...',
                                  hintStyle: AppTextStyles.medium(
                                    AppTextStyles.body1,
                                  ).copyWith(color: AppColors.dark300),
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: AppColors.dark300,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 14,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(28),
                                    borderSide: BorderSide(
                                      color: AppColors.white,
                                    ),
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
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// CONTENT
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// CATEGORY CHIP
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          categories.length,
                          (index) => Padding(
                            padding: EdgeInsets.only(
                              right: index < categories.length - 1 ? 12 : 0,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedCategoryIndex = index;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                ),
                                height: 30,
                                decoration: BoxDecoration(
                                  color: _selectedCategoryIndex == index
                                      ? AppColors.blue300
                                      : AppColors.blue150,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if (categories[index]['hasIcon']
                                        as bool) ...[
                                      Icon(
                                        categories[index]['icon'] as IconData,
                                        color: _selectedCategoryIndex == index
                                            ? Colors.white
                                            : AppColors.blue300,
                                        size: 18,
                                      ),

                                      const SizedBox(width: 6),
                                    ],

                                    Text(
                                      categories[index]['label'] as String,
                                      style:
                                          AppTextStyles.semiBold(
                                            AppTextStyles.body1,
                                          ).copyWith(
                                            color:
                                                _selectedCategoryIndex == index
                                                ? Colors.white
                                                : AppColors.blue300,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  /// BANNER
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Color(0xFF0065FF), Color(0xFF0090FF)],
                        ),
                      ),
                      child: Stack(
                        children: [
                          /// BACKGROUND IMAGE
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Opacity(
                              opacity: 0.9,
                              child: Image.asset(
                                'lib/assets/images/jatim_char.png',
                                width: 164,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),

                          /// CONTENT
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 24,
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: ConstrainedBox(
                                constraints: const BoxConstraints(
                                  maxWidth: 200,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Layanan Khusus Anda',
                                      style: AppTextStyles.semiBold(
                                        AppTextStyles.h3,
                                      ).copyWith(color: AppColors.white),
                                    ),

                                    SizedBox(height: 8,),

                                    Text(
                                      'Rekomendasi dari kami yang mungkin cocok berdasarkan kebutuhan layanan anda',
                                      style: AppTextStyles.regular(
                                        AppTextStyles.body3,
                                      ).copyWith(color: AppColors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  /// LIST LAYANAN
                  Column(
                    children: List.generate(layananList.length, (index) {
                      final layanan = layananList[index];

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: buildOptionCard(
                          imagePath: layanan['image'],
                          category: layanan['category'],
                          title: layanan['title'],
                          description: layanan['description'],
                          onTap: () {
                            context.push(
                              layanan['route'] as String,
                            );
                          },
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
