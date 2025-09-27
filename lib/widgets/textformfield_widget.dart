import 'package:flutter/material.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/widgets/text_widget.dart';

class TextformfieldWidget extends StatelessWidget {
  const TextformfieldWidget({
    super.key,
    required this.controller,
    required this.validator,
    this.label,
    this.maxlines = 1,
    this.borderRadius = 25,
    this.suffixIcon,
    this.hintText,
    this.keyboardType,
    this.autofillHints,
    this.obscureText = false,
  });
  final TextEditingController controller;
  final String? Function(String? value) validator;
  final String? label;
  final int maxlines;
  final double borderRadius;
  final Widget? suffixIcon;
  final String? hintText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Iterable<String>? autofillHints;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null) TextWidget.black(text: label!),
        TextFormField(
          controller: controller,
          maxLines: maxlines,
          validator: validator,
          obscureText: obscureText,
          keyboardType: keyboardType,
          autofillHints: autofillHints,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            hintText: hintText,
            suffixIcon: suffixIcon,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.white_700),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.white_700),
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.white_700),
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.white_700),
            ),
          ),
        ),
      ],
    );
  }
}
