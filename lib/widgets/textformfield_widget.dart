import 'package:flutter/material.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/widgets/text_widget.dart';

class TextformfieldWidget extends StatelessWidget {
  const TextformfieldWidget({
    super.key,
    required this.controller,
    required this.validator,
    required this.label,
    this.maxlines = 1,
    this.borderRadius = 25,
    this.suffixIcon,
    this.hintText,
  });
  final TextEditingController controller;
  final String? Function(String? value) validator;
  final String label;
  final int maxlines;
  final double borderRadius;
  final Widget? suffixIcon;
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget.black(text: label),
        TextFormField(
          controller: controller,
          maxLines: maxlines,
          validator: validator,

          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: suffixIcon,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(color: AppColors.white_700),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(color: AppColors.white_700),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(color: AppColors.white_700),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(color: AppColors.white_700),
            ),
          ),
        ),
      ],
    );
  }
}
