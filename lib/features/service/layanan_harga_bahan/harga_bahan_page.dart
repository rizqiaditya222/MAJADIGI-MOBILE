import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:majadigi/core/router/app_router.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';
import 'package:majadigi/core/widgets/custom_tab_bar.dart';
import 'package:majadigi/core/widgets/labeled_header.dart';

class HargaBahanPokokPage
    extends StatefulWidget {
  const HargaBahanPokokPage({
    super.key,
  });

  @override
  State<HargaBahanPokokPage> createState() =>
      _HargaBahanPokokPageState();
}

class _HargaBahanPokokPageState
    extends State<HargaBahanPokokPage>
    with SingleTickerProviderStateMixin {
  final TextEditingController
  searchController =
  TextEditingController();


  late TabController _tabController;
  late PageController _pageController;

  int currentPage = 0;

  final List<HargaItem> items =
  List.generate(
    12,
        (index) => HargaItem(
      image:
      'lib/assets/images/bawang_merah.png',
      title: index.isEven
          ? 'Bawang Merah / kg'
          : 'Bawang Putih / kg',
      price: 'Rp 36.429',
      isUp: index % 3 != 0,
    ),
  );

  void _showFilterSheet() {
    String selectedSort = 'A-Z';
    String selectedRegion = 'Malang';

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              padding: const EdgeInsets.fromLTRB(
                24,
                20,
                24,
                32,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(32),
                ),
              ),
              child: SafeArea(
                top: false,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      /// HEADER
                      Row(
                        children: [
                          const Spacer(),

                          Text(
                            'Filter',
                            style: AppTextStyles.bold(
                              AppTextStyles.h1,
                            ),
                          ),

                          const Spacer(),

                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.close,
                              size: 30,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 28),

                      /// SORT
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Urutkan berdasarkan abjad',
                          style: AppTextStyles.medium(
                            AppTextStyles.body1,
                          ),
                        ),
                      ),

                      const SizedBox(height: 8),

                      RadioListTile<String>(
                        value: 'A-Z',
                        groupValue: selectedSort,
                        activeColor: AppColors.blue300,
                        title: const Text('A-Z'),
                        onChanged: (value) {
                          setModalState(() {
                            selectedSort = value!;
                          });
                        },
                      ),

                      RadioListTile<String>(
                        value: 'Z-A',
                        groupValue: selectedSort,
                        activeColor: AppColors.blue300,
                        title: const Text('Z-A'),
                        onChanged: (value) {
                          setModalState(() {
                            selectedSort = value!;
                          });
                        },
                      ),

                      Divider(
                        color: Colors.grey.shade300,
                      ),

                      const SizedBox(height: 16),

                      /// TANGGAL
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Tanggal',
                          style: AppTextStyles.medium(
                            AppTextStyles.body1,
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      Container(
                        height: 58,
                        padding:
                        const EdgeInsets.symmetric(
                          horizontal: 18,
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(
                            16,
                          ),
                          border: Border.all(
                            color: const Color(
                              0xFFD9D9D9,
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                '9 Apr 2026',
                                style:
                                AppTextStyles.medium(
                                  AppTextStyles.body1,
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.calendar_month,
                              color:
                              Color(0xFF999999),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),

                      /// DAERAH
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Daerah',
                          style: AppTextStyles.medium(
                            AppTextStyles.body1,
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      Container(
                        height: 58,
                        padding:
                        const EdgeInsets.symmetric(
                          horizontal: 18,
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(
                            16,
                          ),
                          border: Border.all(
                            color: const Color(
                              0xFFD9D9D9,
                            ),
                          ),
                        ),
                        child:
                        DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedRegion,
                            isExpanded: true,
                            icon: const Icon(
                              Icons
                                  .keyboard_arrow_down,
                            ),
                            items: const [
                              DropdownMenuItem(
                                value: 'Malang',
                                child: Text('Malang'),
                              ),
                              DropdownMenuItem(
                                value: 'Surabaya',
                                child: Text('Surabaya'),
                              ),
                              DropdownMenuItem(
                                value: 'Kediri',
                                child: Text('Kediri'),
                              ),
                            ],
                            onChanged: (value) {
                              setModalState(() {
                                selectedRegion =
                                value!;
                              });
                            },
                          ),
                        ),
                      ),

                      const SizedBox(height: 32),

                      /// BUTTON
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.pop(
                                  context,
                                );
                              },
                              style:
                              OutlinedButton
                                  .styleFrom(
                                minimumSize:
                                const Size(
                                  double.infinity,
                                  56,
                                ),
                                side: BorderSide(
                                  color: AppColors
                                      .blue300,
                                ),
                                shape:
                                RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius
                                      .circular(
                                    16,
                                  ),
                                ),
                              ),
                              child: Text(
                                'Cancel',
                                style:
                                AppTextStyles
                                    .bold(
                                  AppTextStyles
                                      .body1,
                                ).copyWith(
                                  color: AppColors
                                      .blue300,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(width: 12),

                          Expanded(
                            flex: 2,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(
                                  context,
                                );
                              },
                              style:
                              ElevatedButton
                                  .styleFrom(
                                minimumSize:
                                const Size(
                                  double.infinity,
                                  56,
                                ),
                                backgroundColor:
                                AppColors
                                    .blue300,
                                elevation: 0,
                                shape:
                                RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius
                                      .circular(
                                    16,
                                  ),
                                ),
                              ),
                              child: Text(
                                'Apply',
                                style:
                                AppTextStyles
                                    .bold(
                                  AppTextStyles
                                      .body1,
                                ).copyWith(
                                  color:
                                  Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();

    _tabController =
        TabController(length: 2, vsync: this);

    _pageController = PageController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    searchController.dispose();
    super.dispose();
  }

  List<List<HargaItem>> get pages {
    List<List<HargaItem>> result = [];

    for (
    int i = 0;
    i < items.length;
    i += 6
    ) {
      result.add(
        items.sublist(
          i,
          i + 6 > items.length
              ? items.length
              : i + 6,
        ),
      );
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
      AppColors.dark100,

      body: Column(
        children: [
          LabeledHeader(
            title: 'Harga Bahan Pokok',
            description:
            'Informasi harian seputar harga bahan pokok',
            backgroundImage:
            'lib/assets/images/bahan_background.png',
            searchController: searchController,
            showSearch: true,
            showFilterButton: true,
            searchHintText: 'Cari data bahan pokok',
            onFilterPressed: _showFilterSheet,
          ),

          CustomTabBar(
            tabController:
            _tabController,
            tabs: const [
              'Layanan',
              'Tentang',
            ],
          ),

          Expanded(
            child: TabBarView(
              controller:
              _tabController,
              children: [
                _buildLayananTab(),
                const Center(
                  child: Text(
                    'Tentang Harga Bahan Pokok',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLayananTab() {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller:
            _pageController,
            itemCount:
            pages.length,
            onPageChanged:
                (index) {
              setState(() {
                currentPage =
                    index;
              });
            },
            itemBuilder:
                (context, pageIndex) {
              final pageItems =
              pages[pageIndex];

              return Padding(
                padding:
                const EdgeInsets
                    .symmetric(horizontal: 16),
                child:
                GridView.builder(
                  physics:
                  const NeverScrollableScrollPhysics(),
                  itemCount:
                  pageItems.length,
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                    2,
                    crossAxisSpacing:
                    12,
                    mainAxisSpacing:
                    12,
                    childAspectRatio:
                    1,
                  ),
                  itemBuilder:
                      (context,
                      index) {
                    return _buildCard(
                      pageItems[
                      index],
                    );
                  },
                ),
              );
            },
          ),
        ),

        Padding(
          padding:
          const EdgeInsets.only(
            bottom: 16,
          ),
          child: Row(
            mainAxisAlignment:
            MainAxisAlignment
                .center,
            children:
            List.generate(
              pages.length,
                  (index) =>
                  AnimatedContainer(
                    duration:
                    const Duration(
                      milliseconds:
                      250,
                    ),
                    margin:
                    const EdgeInsets
                        .symmetric(
                      horizontal:
                      4,
                    ),
                    width:
                    currentPage ==
                        index
                        ? 8
                        : 6,
                    height:
                    currentPage ==
                        index
                        ? 8
                        : 6,
                    decoration:
                    BoxDecoration(
                      shape: BoxShape
                          .circle,
                      color: currentPage ==
                          index
                          ? AppColors
                          .blue300
                          : const Color(
                        0xFFD9D9D9,
                      ),
                    ),
                  ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCard(
      HargaItem item) {
    return GestureDetector(
      onTap: () {
        context.push(
          Routes.detailHargaBahanPokok,
        );
      },
      child: Container(
        padding:
        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration:
        BoxDecoration(
          color: Colors.white,
          borderRadius:
          BorderRadius.circular(
            20,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              item.image,
              width: 84,
              height: 84,
              fit: BoxFit.contain,
            ),

            const SizedBox(height: 4),

            Text(
              item.title,
              textAlign:
              TextAlign.center,
              style:
              AppTextStyles.medium(
                AppTextStyles
                    .body3,
              ),
            ),

            const SizedBox(height: 4),

            Row(
              mainAxisAlignment:
              MainAxisAlignment
                  .center,
              children: [
                Icon(
                  item.isUp
                      ? Icons
                      .arrow_drop_up
                      : Icons
                      .arrow_drop_down,
                  color: item.isUp
                      ? const Color(
                    0xFFFF0054,
                  )
                      : const Color(
                    0xFF27AE60,
                  ),
                ),

                Text(
                  item.price,
                  style:
                  AppTextStyles
                      .bold(
                    AppTextStyles
                        .body2,
                  ).copyWith(
                    color: item.isUp
                        ? const Color(
                      0xFFFF0054,
                    )
                        : const Color(
                      0xFF27AE60,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HargaItem {
  final String image;
  final String title;
  final String price;
  final bool isUp;

  HargaItem({
    required this.image,
    required this.title,
    required this.price,
    required this.isUp,
  });
}