import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';
import 'package:majadigi/features/home/presentation/pages/aktivitas/aktivitas_page.dart';

import 'package:majadigi/features/home/presentation/pages/home_page.dart';
import 'package:majadigi/features/service/list_layanan/all_layanan_page.dart';

import '../../home/presentation/pages/profile/profile_page.dart';

class MainNavigationPage extends StatefulWidget {
  final int currentIndex;

  const MainNavigationPage({
    super.key,
    this.currentIndex = 0,
  });

  @override
  State<MainNavigationPage> createState() =>
      _MainNavigationPageState();
}

class _MainNavigationPageState
    extends State<MainNavigationPage> {

  late int _selectedIndex;

  final List<Widget> _pages = [
    const HomePage(),
    const AllLayananPage(),
    const ActivityPage(),
    const ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.currentIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),

      bottomNavigationBar: Container(
        height: 78,

        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Color(0x14000000),
              offset: Offset(0, -4),
            ),
          ],
        ),

        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,

          backgroundColor: Colors.white,
          elevation: 0,

          type: BottomNavigationBarType.fixed,

          selectedItemColor: AppColors.blue300,
          unselectedItemColor: AppColors.dark300,

          selectedFontSize: 11,
          unselectedFontSize: 11,

          iconSize: 24,

          selectedLabelStyle:
          AppTextStyles.semiBold(
            AppTextStyles.body3,
          ),

          unselectedLabelStyle:
          AppTextStyles.medium(
            AppTextStyles.body3,
          ),

          showSelectedLabels: true,
          showUnselectedLabels: true,

          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(
                  bottom: 4,
                ),
                child: Icon(
                  Icons.home_rounded,
                  size: 26,
                ),
              ),
              label: 'Beranda',
            ),

            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(
                  bottom: 4,
                ),
                child: Icon(
                  Icons.favorite_border_rounded,
                  size: 26,
                ),
              ),
              label: 'Layanan',
            ),

            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(
                  bottom: 4,
                ),
                child: Icon(
                  Icons.assignment_outlined,
                  size: 26,
                ),
              ),
              label: 'Aktivitas',
            ),

            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(
                  bottom: 4,
                ),
                child: Icon(
                  Icons.person_rounded,
                  size: 26,
                ),
              ),
              label: 'Profil',
            ),
          ],
        ),
      ),
    );
  }
}