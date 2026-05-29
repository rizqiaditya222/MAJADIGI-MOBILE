import 'package:flutter/material.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';

class OtpTextField extends StatefulWidget {
  final void Function(String)? onComplete;
  final void Function(String)? onChanged;

  const OtpTextField({
    Key? key,
    this.onComplete,
    this.onChanged,
  }) : super(key: key);

  @override
  State<OtpTextField> createState() => _OtpTextFieldState();
}

class _OtpTextFieldState extends State<OtpTextField> {
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(4, (index) => TextEditingController());
    focusNodes = List.generate(4, (index) => FocusNode());
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.isNotEmpty) {
      if (index < 3) {
        focusNodes[index + 1].requestFocus();
      } else {
        focusNodes[index].unfocus();
        _checkComplete();
      }
    }
    widget.onChanged?.call(_getOtpValue());
  }

  void _onBackspace(int index) {
    if (index > 0) {
      controllers[index].clear();
      focusNodes[index - 1].requestFocus();
    }
  }

  void _checkComplete() {
    String otp = _getOtpValue();
    if (otp.length == 4) {
      widget.onComplete?.call(otp);
    }
  }

  String _getOtpValue() {
    return controllers.map((c) => c.text).join();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: SizedBox(
            width: 50,
            height: 60,
            child: TextField(
              controller: controllers[index],
              focusNode: focusNodes[index],
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              maxLength: 1,
              onChanged: (value) {
                if (value.isEmpty) {
                  _onBackspace(index);
                } else {
                  _onChanged(value, index);
                }
              },
              style: AppTextStyles.bold(AppTextStyles.h2)
                  .copyWith(color: AppColors.black),
              decoration: InputDecoration(
                counterText: '',
                hintText: '',
                contentPadding: EdgeInsets.zero,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: AppColors.dark200,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: AppColors.blue300,
                    width: 2,
                  ),
                ),
                filled: true,
                fillColor: AppColors.white,
              ),
            ),
          ),
        );
      }),
    );
  }
}

