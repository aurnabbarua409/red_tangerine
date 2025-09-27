import 'package:flutter/material.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/constant/app_icons.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/widgets/Button_widget.dart';

class ChatboxWidget extends StatelessWidget {
  const ChatboxWidget({super.key, required this.controller, required this.ontap});
  final TextEditingController controller;
  final void Function() ontap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: null,

      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        hintText: AppStrings.message,
        hintStyle: TextStyle(
          color: AppColors.white_700,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        suffixIcon: ButtonWidget.icon(
          icon: AppIcons.imageIcon,
          scale: 0.8,
          iconColor: AppColors.white_700,
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
    );
  }
}
