import 'package:flutter/material.dart';
import 'package:majadigi/core/widgets/custom_tab_bar.dart';

class IslamicCenterTabBar extends StatelessWidget {
  final TabController tabController;

  const IslamicCenterTabBar({
    super.key,
    required this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTabBar(
      tabController: tabController,
      tabs: const ['Layanan', 'Tentang'],
    );
  }
}
