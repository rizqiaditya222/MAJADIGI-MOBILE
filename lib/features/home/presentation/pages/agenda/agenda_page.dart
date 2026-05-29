import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:majadigi/core/router/app_router.dart';

import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';

import 'package:majadigi/core/widgets/auth_header_widget.dart';
import 'package:majadigi/core/widgets/agenda_card_widget.dart';

class AgendaPage extends StatefulWidget {
  const AgendaPage({super.key});

  @override
  State<AgendaPage> createState() =>
      _AgendaPageState();
}

class _AgendaPageState
    extends State<AgendaPage>
    with SingleTickerProviderStateMixin {

  late TabController _tabController;

  final TextEditingController
  _dateController =
  TextEditingController(
    text: '9 Apr 2026',
  );

  final List<Map<String, dynamic>>
  agendaItems = [
    {
      'title': 'Bahana Bersahaja',
      'date':
      'Kamis, 01 Januari 2026 | 00:00 - 12:00',
      'location': 'Kabupaten Madiun',
      'image':
      'lib/assets/images/jatim_icon.png',
    },
    {
      'title':
      'Festival Budaya Nusantara',
      'date':
      'Jumat, 02 Januari 2026 | 09:00 - 15:00',
      'location': 'Kota Surabaya',
      'image':
      'lib/assets/images/jatim_icon.png',
    },
    {
      'title':
      'Jatim UMKM Expo 2026',
      'date':
      'Sabtu, 03 Januari 2026 | 08:00 - 18:00',
      'location': 'Kabupaten Malang',
      'image':
      'lib/assets/images/jatim_icon.png',
    },
    {
      'title':
      'Konser Musik Rakyat',
      'date':
      'Minggu, 04 Januari 2026 | 19:00 - 22:00',
      'location': 'Kabupaten Kediri',
      'image':
      'lib/assets/images/jatim_icon.png',
    },
    {
      'title':
      'Pameran UMKM Nasional',
      'date':
      'Senin, 05 Januari 2026 | 10:00 - 16:00',
      'location': 'Kota Batu',
      'image':
      'lib/assets/images/jatim_icon.png',
    },
  ];

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    _dateController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark100,

      body: Column(
        children: [

          /// HEADER
          AuthHeaderWidget(
            imagePath:
            'lib/assets/images/wayang_image.png',

            showTitle: true,
            title: 'Agenda Jawa Timur',

            onBackPressed: () {
              context.pop();
            },
          ),

          /// TAB BAR
          TabBar(
            controller: _tabController,

            dividerColor: Colors.transparent,

            indicatorColor:
            const Color(0xFF27AE60),

            indicatorWeight: 4,

            labelColor:
            AppColors.dark500,

            unselectedLabelColor:
            AppColors.dark300,

            labelStyle:
            AppTextStyles.semiBold(
              AppTextStyles.h4,
            ),

            unselectedLabelStyle:
            AppTextStyles.medium(
              AppTextStyles.h4,
            ),

            tabs: const [
              Tab(
                text: 'Terdekat',
              ),

              Tab(
                text: 'Terlewat',
              ),
            ],
          ),

          /// CONTENT
          Expanded(
            child: SingleChildScrollView(
              padding:
              const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 20,
              ),

              child: Column(
                children: [

                  /// DATE FIELD
                  Container(
                    height: 52,

                    decoration: BoxDecoration(
                      color: Colors.white,

                      borderRadius:
                      BorderRadius.circular(
                        16,
                      ),

                      border: Border.all(
                        color:
                        const Color(
                          0xFFE5E5E5,
                        ),
                      ),
                    ),

                    child: TextField(
                      controller:
                      _dateController,

                      readOnly: true,

                      decoration:
                      InputDecoration(
                        border:
                        InputBorder.none,

                        contentPadding:
                        const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),

                        suffixIcon: const Icon(
                          Icons
                              .calendar_today_rounded,
                          color:
                          AppColors
                              .dark300,
                          size: 22,
                        ),

                        hintStyle:
                        AppTextStyles
                            .medium(
                          AppTextStyles
                              .body1,
                        ).copyWith(
                          color:
                          AppColors
                              .dark300,
                        ),
                      ),

                      style:
                      AppTextStyles.medium(
                        AppTextStyles.body1,
                      ).copyWith(
                        color:
                        AppColors
                            .dark500,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// LIST
                  Column(
                    children: List.generate(
                      agendaItems.length,
                          (index) {
                        final item =
                        agendaItems[index];

                        return Padding(
                          padding:
                          const EdgeInsets.only(
                            bottom: 12,
                          ),

                          child:
                          AgendaCardWidget(
                            image:
                            item['image']
                            as String,

                            date:
                            item['date']
                            as String,

                            title:
                            item['title']
                            as String,

                            location:
                            item['location']
                            as String,

                            onTap: () {
                              context.push(Routes.agendaDetail);
                            },
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}