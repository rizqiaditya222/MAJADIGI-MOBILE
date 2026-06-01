import 'package:flutter/material.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';

class AccordionWidget extends StatefulWidget {
  final int index;
  final String title;
  final Widget child;
  final bool isInitiallyExpanded;

  const AccordionWidget({
    super.key,
    required this.index,
    required this.title,
    required this.child,
    this.isInitiallyExpanded = false,
  });

  @override
  State<AccordionWidget> createState() => _AccordionWidgetState();
}

class _AccordionWidgetState extends State<AccordionWidget> {
  late bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.isInitiallyExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: _isExpanded ? AppColors.blue300 : AppColors.dark150,
          width: _isExpanded ? 1.5 : 1,
        ),
      ),
      child: Column(
        children: [
          /// HEADER ROW
          InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: _isExpanded
                        ? AppTextStyles.semiBold(AppTextStyles.body1)
                            .copyWith(color: AppColors.blue300)
                        : AppTextStyles.medium(AppTextStyles.body1)
                            .copyWith(color: AppColors.dark500),
                  ),
                  AnimatedRotation(
                    turns: _isExpanded ? 0 : -0.25,
                    duration: const Duration(milliseconds: 250),
                    child: Icon(
                      _isExpanded
                          ? Icons.keyboard_arrow_down_rounded
                          : Icons.chevron_right_rounded,
                      color:
                          _isExpanded ? AppColors.blue300 : AppColors.dark300,
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// EXPANDABLE CONTENT
          AnimatedCrossFade(
            firstChild: const SizedBox(width: double.infinity),
            secondChild: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: widget.child,
            ),
            crossFadeState: _isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 250),
          ),
        ],
      ),
    );
  }
}

