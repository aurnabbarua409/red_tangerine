import 'package:flutter/material.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/constant/app_icons.dart';
import 'package:red_tangerine/widgets/Button_widget.dart';

class SearchbarWidget extends StatelessWidget {
  const SearchbarWidget({
    super.key,
    required this.controller,
    required this.validator,
    this.maxlines = 1,
    this.borderRadius = 25,
    this.suffixIcon,
    this.hintText,
    this.keyboardType,
    this.autofillHints,
    this.obscureText = false, required this.ontap,
  });
  final TextEditingController controller;
  final String? Function(String? value) validator;
  final int maxlines;
  final double borderRadius;
  final Widget? suffixIcon;
  final String? hintText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Iterable<String>? autofillHints;
  final void Function() ontap;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
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
            hintStyle: TextStyle(
              color: AppColors.white_700,
              fontSize: 14,
              fontWeight: FontWeight.w400,        fontFamily: 'Manrope',
            ),
            suffixIcon: ButtonWidget.icon(
              icon: AppIcons.searchIcon,
              ontap: ontap,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: AppColors.white_700),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: AppColors.white_700),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: AppColors.white_700),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: AppColors.white_700),
            ),
          ),
        ),
      ],
    );
  }
}
