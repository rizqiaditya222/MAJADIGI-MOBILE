import 'package:flutter/material.dart';

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
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  late int _selectedIndex;

  final List<Widget> _pages = const [
    HomePage(),
    AllLayananPage(),
    ActivityPage(),
    ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.currentIndex;
  }

  void _onItemTapped(int index) {
    if (_selectedIndex == index) return;

    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: IndexedStack(
          index: _selectedIndex,
          children: _pages,
        ),
      ),
      bottomNavigationBar: DecoratedBox(
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
        child: SafeArea(
          top: false,
          child: Theme(
            data: Theme.of(context).copyWith(
              splashFactory: NoSplash.splashFactory,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,

              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              elevation: 0,

              selectedItemColor: AppColors.blue300,
              unselectedItemColor: AppColors.dark300,

              selectedFontSize: 11,
              unselectedFontSize: 11,

              selectedLabelStyle: AppTextStyles.semiBold(
                AppTextStyles.body3,
              ),
              unselectedLabelStyle: AppTextStyles.medium(
                AppTextStyles.body3,
              ),

              showSelectedLabels: true,
              showUnselectedLabels: true,

              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_rounded,
                    size: 24,
                  ),
                  label: 'Beranda',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite_border_rounded,
                    size: 24,
                  ),
                  label: 'Layanan',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.assignment_outlined,
                    size: 24,
                  ),
                  label: 'Aktivitas',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person_rounded,
                    size: 24,
                  ),
                  label: 'Profil',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}