import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:majadigi/core/router/app_router.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';
import 'package:majadigi/core/widgets/recommendation_card_widget.dart';

import '../../../../core/widgets/bottom_sheet_layanan.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int _selectedCategoryIndex = 0;

  final TextEditingController searchController =
  TextEditingController();

  final String searchHintText = 'Cari Layanan';

  final List<Map<String, dynamic>> categories = [
    {
      'label': 'UNTUK ANDA',
      'icon': Icons.auto_awesome_rounded,
      'hasIcon': true,
    },
    {
      'label': 'EKONOMI',
      'icon': null,
      'hasIcon': false,
    },
    {
      'label': 'KESEHATAN',
      'icon': null,
      'hasIcon': false,
    },
    {
      'label': 'PARIWISATA',
      'icon': null,
      'hasIcon': false,
    },
  ];

  final List<Map<String, dynamic>> gridItems = [
    {
      'label': 'Islamic Center',
      'image': 'lib/assets/images/jatim_icon.png',
    },
    {
      'label': 'Harga Bahan Pokok',
      'image': 'lib/assets/images/jatim_icon.png',
    },
    {
      'label': 'Skrining E-Tibi',
      'image': 'lib/assets/images/jatim_icon.png',
    },
    {
      'label': 'RSUD Hada Husada',
      'image': 'lib/assets/images/jatim_icon.png',
    },
    {
      'label': '',
      'image': null,
    },
    {
      'label': '',
      'image': null,
    },
    {
      'label': '',
      'image': null,
    },
    {
      'label': 'lainnya',
      'image': null,
    },
  ];

  final List<Map<String, dynamic>> statisticItems = [
    {
      'icon': Icons.groups_rounded,
      'iconColor': Color(0xFF1565FF),
      'title': 'Jumlah\nPenduduk',
      'value': '42.089.271',
    },
    {
      'icon': Icons.trending_up_rounded,
      'iconColor': Color(0xFF27AE60),
      'title': 'Pertumbuhan\nPenduduk',
      'value': '0,73%',
    },
    {
      'icon': Icons.home_rounded,
      'iconColor': Color(0xFFFF0B57),
      'title': 'Presentase\nPenduduk Miskin',
      'value': '9,56%',
    },
    {
      'icon': Icons.volunteer_activism_rounded,
      'iconColor': Color(0xFFFF0B57),
      'title': 'Keluarga Penerima\nManfaat',
      'value': '11.990.432',
    },
    {
      'icon': Icons.home_rounded,
      'iconColor': Color(0xFFFF0B57),
      'title': 'Presentase\nPenduduk Miskin',
      'value': '9,56%',
    },
    {
      'icon': Icons.volunteer_activism_rounded,
      'iconColor': Color(0xFFFF0B57),
      'title': 'Keluarga Penerima\nManfaat',
      'value': '11.990.432',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark100,

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [

            /// HEADER + SEARCH
            Stack(
              clipBehavior: Clip.none,
              children: [

                /// HEADER
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: 216,
                    child: Stack(
                      children: [

                        /// BACKGROUND
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
                              'lib/assets/images/wayang_image.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        /// CONTENT
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 24,
                              right: 24,
                              top: 24,
                            ),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween,
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              children: [

                                /// LEFT SECTION
                                Row(
                                  children: [

                                    /// PROFILE IMAGE
                                    Container(
                                      width: 48,
                                      height: 48,
                                      decoration:
                                      BoxDecoration(
                                        shape:
                                        BoxShape.circle,
                                        border:
                                        Border.all(
                                          color:
                                          Colors.white,
                                          width: 1,
                                        ),
                                        image:
                                        const DecorationImage(
                                          image:
                                          AssetImage(
                                            'lib/assets/images/social_icon.png',
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),

                                    const SizedBox(
                                      width: 16,
                                    ),

                                    /// TEXT
                                    Column(
                                      mainAxisSize:
                                      MainAxisSize
                                          .min,
                                      crossAxisAlignment:
                                      CrossAxisAlignment
                                          .start,
                                      children: [

                                        Text(
                                          'Selamat Datang',
                                          style:
                                          AppTextStyles
                                              .bold(
                                            AppTextStyles
                                                .h2,
                                          ).copyWith(
                                            color:
                                            AppColors
                                                .white,
                                          ),
                                        ),

                                        const SizedBox(
                                          height: 2,
                                        ),

                                        Text(
                                          'Pengunjung',
                                          style:
                                          AppTextStyles
                                              .medium(
                                            AppTextStyles
                                                .body1,
                                          ).copyWith(
                                            color:
                                            AppColors
                                                .white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                /// NOTIFICATION
                                Container(
                                  width: 48,
                                  height: 48,
                                  decoration:
                                  BoxDecoration(
                                    color: Colors.white
                                        .withOpacity(0),
                                    shape:
                                    BoxShape.circle,
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      context.push(Routes.notification);
                                    },
                                    icon: const Icon(
                                      Icons
                                          .notifications_none_rounded,
                                      color:
                                      Colors.white,
                                      size: 28,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                /// FLOATING SEARCH BAR
                Positioned(
                  left: 24,
                  right: 24,
                  bottom: -28,
                  child: Material(
                    borderRadius:
                    BorderRadius.circular(32),
                    elevation: 8,
                    shadowColor:
                    Colors.black.withOpacity(0.1),
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: searchHintText,

                        hintStyle:
                        AppTextStyles.medium(
                          AppTextStyles.body1,
                        ).copyWith(
                          color:
                          AppColors.dark300,
                        ),

                        prefixIcon: Icon(
                          Icons.search,
                          color:
                          AppColors.dark300,
                          size: 28,
                        ),

                        contentPadding:
                        const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 16,
                        ),

                        enabledBorder:
                        OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(
                            32,
                          ),
                          borderSide:
                          BorderSide.none,
                        ),

                        focusedBorder:
                        OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(
                            32,
                          ),
                          borderSide: BorderSide(
                            color:
                            AppColors.blue300,
                            width: 1.5,
                          ),
                        ),

                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            /// MAIN CONTENT
            Padding(
              padding: const EdgeInsets.fromLTRB(
                24,
                56,
                24,
                0,
              ),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [

                  /// CATEGORY
                  ClipRRect(
                    borderRadius:
                    BorderRadius.circular(20),
                    child: SingleChildScrollView(
                      scrollDirection:
                      Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          categories.length,
                              (index) => Padding(
                            padding: EdgeInsets.only(
                              right:
                              index <
                                  categories
                                      .length -
                                      1
                                  ? 12
                                  : 0,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedCategoryIndex =
                                      index;
                                });
                              },
                              child: Container(
                                padding:
                                const EdgeInsets.symmetric(
                                  horizontal: 12,
                                ),
                                height: 30,
                                decoration:
                                BoxDecoration(
                                  color:
                                  _selectedCategoryIndex ==
                                      index
                                      ? AppColors
                                      .blue300
                                      : AppColors
                                      .blue150,
                                  borderRadius:
                                  BorderRadius.circular(
                                    20,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize:
                                  MainAxisSize.min,
                                  children: [

                                    if (categories[index]
                                    ['hasIcon']
                                    as bool) ...[
                                      Icon(
                                        categories[index]
                                        ['icon']
                                        as IconData,
                                        color:
                                        _selectedCategoryIndex ==
                                            index
                                            ? Colors
                                            .white
                                            : AppColors
                                            .blue300,
                                        size: 18,
                                      ),

                                      const SizedBox(
                                        width: 6,
                                      ),
                                    ],

                                    Text(
                                      categories[index]
                                      ['label']
                                      as String,
                                      style:
                                      AppTextStyles
                                          .semiBold(
                                        AppTextStyles
                                            .body1,
                                      ).copyWith(
                                        color:
                                        _selectedCategoryIndex ==
                                            index
                                            ? Colors
                                            .white
                                            : AppColors
                                            .blue300,
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

                  /// GRID MENU
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 14,
                      crossAxisSpacing: 12,
                      childAspectRatio: 0.80,
                    ),
                    itemCount: gridItems.length,
                    itemBuilder: (context, index) {
                      final item = gridItems[index];

                      final hasImage = item['image'] != null;

                      final hasLabel =
                          item['label'].toString().isNotEmpty;

                      return GestureDetector(
                        onTap: () {
                          /// tombol +
                          if (!hasImage) {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (_) =>
                              const ServiceMenuBottomSheet(),
                            );
                            return;
                          }

                          /// menu biasa
                          switch (item['label']) {
                            case 'Islamic Center':
                              // context.push(Routes.islamicCenter);
                              break;

                            case 'Harga Bahan Pokok':
                              break;

                            case 'Skrining E-Tibi':
                              break;

                            case 'RSUD Hada Husada':
                              break;
                          }
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 56,
                              height: 56,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.blue150,
                                border: Border.all(
                                  color: Colors.white,
                                ),
                              ),
                              child: hasImage
                                  ? ClipOval(
                                child: Padding(
                                  padding:
                                  const EdgeInsets.all(12),
                                  child: Image.asset(
                                    item['image'] as String,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              )
                                  : Center(
                                child: Icon(
                                  Icons.add_rounded,
                                  color: AppColors.blue300,
                                  size: 32,
                                ),
                              ),
                            ),

                            if (hasLabel) ...[
                              const SizedBox(height: 8),

                              Text(
                                item['label'] as String,
                                textAlign: TextAlign.center,
                                style: AppTextStyles.regular(
                                  AppTextStyles.body2,
                                ).copyWith(
                                  color: AppColors.dark400,
                                  height: 1,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ],
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 12),

                  /// BANNER
                  ClipRRect(
                    borderRadius:
                    BorderRadius.circular(20),
                    child: Container(
                      width: double.infinity,
                      decoration:
                      const BoxDecoration(
                        gradient: LinearGradient(
                          begin:
                          Alignment.centerLeft,
                          end:
                          Alignment.centerRight,
                          colors: [
                            Color(0xFF0065FF),
                            Color(0xFF0090FF),
                          ],
                        ),
                      ),
                      child: Stack(
                        children: [

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

                          Padding(
                            padding:
                            const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 24,
                            ),
                            child: Align(
                              alignment:
                              Alignment.centerLeft,
                              child:
                              ConstrainedBox(
                                constraints:
                                const BoxConstraints(
                                  maxWidth: 200,
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start,
                                  mainAxisSize:
                                  MainAxisSize
                                      .min,
                                  children: [

                                    Text(
                                      'Aplikasi layanan terbaik untuk warga jawa timur',
                                      style:
                                      AppTextStyles
                                          .semiBold(
                                        AppTextStyles
                                            .h4,
                                      ).copyWith(
                                        color:
                                        AppColors
                                            .white,
                                      ),
                                    ),

                                    const SizedBox(
                                      height: 8,
                                    ),

                                    FilledButton(
                                      style:
                                      FilledButton.styleFrom(
                                        backgroundColor:
                                        AppColors
                                            .white,
                                        shape:
                                        RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(
                                            56,
                                          ),
                                        ),
                                      ),
                                      onPressed:
                                          () {},
                                      child: Text(
                                        'Cari layanan untuk anda',
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

                  const SizedBox(height: 32),

                  /// REKOMENDASI TITLE
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(
                      horizontal: 6,
                    ),
                    child: Row(
                      children: [

                        Image.asset(
                          'lib/assets/images/recommendation_icon.png',
                          width: 18,
                        ),

                        const SizedBox(width: 12),

                        Text(
                          'Rekomendasi Cepat Untuk Anda',
                          style:
                          AppTextStyles
                              .semiBold(
                            AppTextStyles.h4,
                          ).copyWith(
                            color:
                            AppColors.dark500,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  RecommendationCardWidget(
                    image:
                    'lib/assets/images/recommendation_cepat.png',
                    subtitle: 'Akses Mudah',
                    title: 'Layanan Cepat',
                    description:
                    'Mulai coba layanan yang mempermudah anda.',
                    onTap: () {
                      context.push(Routes.layananCepat);
                    },
                  ),

                  const SizedBox(height: 12),

                  RecommendationCardWidget(
                    image:
                    'lib/assets/images/recommendation_kesehatan.png',
                    subtitle:
                    'Kesehatan Yang Utama',
                    title:
                    'Cek Kesehatan Anda',
                    description:
                    'Bukti anda peduli dengan kesehatan anda.',
                    onTap: () {
                      context.push(Routes.layananCepatKesehatan);
                    },
                  ),

                  const SizedBox(height: 12),

                  RecommendationCardWidget(
                    image:
                    'lib/assets/images/recommendation_wisata.png',
                    subtitle:
                    'Layanan Wisata',
                    title:
                    'Wisata Jadi Mudah',
                    description:
                    'Lagi wisata di Jawa Timur? yuk coba layanan ini.',
                    onTap: () {
                      context.push(Routes.layananCepatWisata);
                    },
                  ),
                ],
              ),
            ),

            /// STATISTIC SECTION
            const SizedBox(height: 42),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: Row(
                children: [

                  Image.asset(
                    'lib/assets/images/statistic_icon.png',
                    width: 18,
                  ),

                  const SizedBox(width: 12),

                  Text(
                    'Jawa Timur Dalam Angka',
                    style: AppTextStyles.semiBold(
                      AppTextStyles.h4,
                    ).copyWith(
                      color: AppColors.dark500,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              height: 360,
              child: GridView.builder(
                padding:
                const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: statisticItems.length,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                ),
                itemBuilder: (context, index) {
                  final item =
                  statisticItems[index];

                  return Container(
                    width: 160,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.circular(
                        28,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black
                              .withOpacity(0.04),
                          blurRadius: 12,
                          offset:
                          const Offset(0, 4),
                        ),
                      ],
                    ),

                    child: Column(
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      children: [

                        Icon(
                          item['icon']
                          as IconData,
                          size: 48,
                          color:
                          item['iconColor']
                          as Color,
                        ),

                        const SizedBox(
                          height: 8,
                        ),

                        Text(
                          item['title']
                          as String,
                          textAlign:
                          TextAlign.center,
                          style:
                          AppTextStyles
                              .medium(
                            AppTextStyles.h4,
                          ).copyWith(
                            color:
                            AppColors
                                .dark300,
                            height: 1.3,
                          ),
                        ),

                        const SizedBox(
                          height: 8,
                        ),

                        Text(
                          item['value']
                          as String,
                          textAlign:
                          TextAlign.center,
                          style:
                          AppTextStyles
                              .bold(
                            AppTextStyles.h2,
                          ).copyWith(
                            color:
                            AppColors
                                .dark500,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 42),

            /// AGENDA SECTION
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment
                    .spaceBetween,
                children: [

                  Row(
                    children: [

                      Image.asset(
                        'lib/assets/images/agenda_icon.png',
                        width: 18,
                      ),

                      const SizedBox(width: 12),

                      Text(
                        'Agenda Jawa Timur',
                        style:
                        AppTextStyles
                            .semiBold(
                          AppTextStyles.h4,
                        ).copyWith(
                          color:
                          AppColors.dark500,
                        ),
                      ),
                    ],
                  ),

                  GestureDetector(
                    onTap: () {
                      context.push(Routes.agenda);
                    },
                    child: Text(
                      'Lihat Semua',
                      style:
                      AppTextStyles.medium(
                        AppTextStyles.body1,
                      ).copyWith(
                        color:
                        AppColors.blue300,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Padding(
              padding:
              const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Column(
                children: List.generate(
                  3,
                      (index) => Padding(
                    padding:
                    const EdgeInsets.only(
                      bottom: 8,
                    ),
                    child: Container(
                      width: double.infinity,
                      padding:
                      const EdgeInsets.all(
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

                          Image.asset(
                            'lib/assets/images/jatim_icon.png',
                            width: 42,
                            height: 42,
                          ),

                          const SizedBox(
                            width: 16,
                          ),

                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,
                              children: [

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

                                    const SizedBox(
                                      width: 6,
                                    ),

                                    Expanded(
                                      child: Text(
                                        'Kamis, 01 Januari 2026 | 00:00 - 12:00',
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

                                const SizedBox(
                                  height: 6,
                                ),

                                Text(
                                  'Bahana Bersahaja',
                                  style:
                                  AppTextStyles
                                      .semiBold(
                                    AppTextStyles
                                        .h3,
                                  ).copyWith(
                                    color:
                                    AppColors
                                        .dark500,
                                  ),
                                ),

                                const SizedBox(
                                  height: 6,
                                ),

                                Row(
                                  children: [

                                    const Icon(
                                      Icons
                                          .location_on_rounded,
                                      size: 12,
                                      color: AppColors
                                          .blue300,
                                    ),

                                    const SizedBox(
                                      width: 4,
                                    ),

                                    Text(
                                      'Kabupaten Madiun',
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
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(width: 6),

                          Icon(
                            Icons
                                .chevron_right_rounded,
                            size: 24,
                            color: Colors.black
                                .withOpacity(0.35),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 42),

            /// BERITA SECTION
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment
                    .spaceBetween,
                children: [

                  Row(
                    children: [

                      Image.asset(
                        'lib/assets/images/berita_icon.png',
                        width: 18,
                      ),

                      const SizedBox(width: 12),

                      Text(
                        'Berita Jawa Timur',
                        style:
                        AppTextStyles
                            .semiBold(
                          AppTextStyles.h4,
                        ).copyWith(
                          color:
                          AppColors.dark500,
                        ),
                      ),
                    ],
                  ),

                  GestureDetector(
                    onTap: () {
                      context.push(Routes.berita);
                    },
                    child: Text(
                      'Lihat Semua',
                      style:
                      AppTextStyles.medium(
                        AppTextStyles.body1,
                      ).copyWith(
                        color:
                        AppColors.blue300,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              height: 216,
              child: ListView.separated(
                padding:
                const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                separatorBuilder:
                    (_, __) =>
                const SizedBox(width: 16),
                itemBuilder: (context, index) {
                  return Container(
                    width: 216,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.circular(
                        24,
                      ),
                    ),

                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [

                        ClipRRect(
                          borderRadius:
                          const BorderRadius.only(
                            topLeft:
                            Radius.circular(
                              24,
                            ),
                            topRight:
                            Radius.circular(
                              24,
                            ),
                          ),
                          child: Image.asset(
                            'lib/assets/images/wisata_sample.png',
                            width: double.infinity,
                            height: 122,
                            fit: BoxFit.cover,
                          ),
                        ),

                        Expanded(
                          child: Padding(
                            padding:
                            const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 14,
                            ),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,
                              children: [

                                Row(
                                  children: [
                                    const Icon(
                                      Icons
                                          .calendar_today_rounded,
                                      size: 12,
                                      color: Color(
                                        0xFF27AE60,
                                      ),
                                    ),

                                    const SizedBox(
                                      width: 6,
                                    ),

                                    Text(
                                      'Kamis, 01 Januari 2026',
                                      style:
                                      AppTextStyles
                                          .medium(
                                        AppTextStyles
                                            .body3,
                                      ).copyWith(
                                        color:
                                        AppColors
                                            .dark300,
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(
                                  height: 10,
                                ),

                                Expanded(
                                  child: Text(
                                    'Gunung Raung Erupsi, Puluhan Pendaki Putar Balik',
                                    maxLines: 2,
                                    overflow:
                                    TextOverflow
                                        .ellipsis,
                                    style:
                                    AppTextStyles
                                        .regular(
                                      AppTextStyles
                                          .h4,
                                    ).copyWith(
                                      color:
                                      AppColors
                                          .dark500,
                                      height: 1.3,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}