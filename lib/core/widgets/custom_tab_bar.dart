import 'package:flutter/material.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';

class CustomTabBar extends StatelessWidget {
  final TabController tabController;
  final List<String> tabs;
  final Color? indicatorColor;
  final Color? labelColor;
  final Color? unselectedLabelColor;
  final TextStyle? labelStyle;
  final TextStyle? unselectedLabelStyle;

  const CustomTabBar({
    super.key,
    required this.tabController,
    required this.tabs,
    this.indicatorColor,
    this.labelColor,
    this.unselectedLabelColor,
    this.labelStyle,
    this.unselectedLabelStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: TabBar(
        controller: tabController,
        dividerColor: Colors.transparent,
        indicatorColor: indicatorColor ?? const Color(0xFF27AE60),
        indicatorWeight: 4,
        labelColor: labelColor ?? AppColors.dark500,
        unselectedLabelColor: unselectedLabelColor ?? AppColors.dark300,
        labelStyle: labelStyle ?? AppTextStyles.semiBold(AppTextStyles.h4),
        unselectedLabelStyle: unselectedLabelStyle ?? AppTextStyles.medium(AppTextStyles.h4),
        tabs: tabs.map((tab) => Tab(text: tab)).toList(),
      ),
    );
  }
}

