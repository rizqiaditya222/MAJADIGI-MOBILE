import 'package:flutter/material.dart';
import 'package:majadigi/core/widgets/accordion_widget.dart';

class TentangTab extends StatelessWidget {
  final List<AccordionItemData> accordionItems;

  const TentangTab({
    super.key,
    required this.accordionItems,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      children: List.generate(
        accordionItems.length,
        (index) {
          final item = accordionItems[index];
          return Padding(
            padding: EdgeInsets.only(
              bottom: index < accordionItems.length - 1 ? 12 : 0,
            ),
            child: AccordionWidget(
              index: index,
              title: item.title,
              content: item.content,
              expandedBorderColor: item.expandedBorderColor,
              collapsedBorderColor: item.collapsedBorderColor,
              expandedTitleColor: item.expandedTitleColor,
              collapsedTitleColor: item.collapsedTitleColor,
            ),
          );
        },
      ),
    );
  }
}

/// Data class untuk accordion item
class AccordionItemData {
  final String title;
  final Widget content;
  final Color? expandedBorderColor;
  final Color? collapsedBorderColor;
  final Color? expandedTitleColor;
  final Color? collapsedTitleColor;

  AccordionItemData({
    required this.title,
    required this.content,
    this.expandedBorderColor,
    this.collapsedBorderColor,
    this.expandedTitleColor,
    this.collapsedTitleColor,
  });
}

