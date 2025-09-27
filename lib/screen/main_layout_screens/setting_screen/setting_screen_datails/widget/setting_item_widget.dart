import 'package:flutter/material.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/widgets/text_widget.dart';

class SettingItemWidget extends StatelessWidget {
  const SettingItemWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextWidget(
      text: text,
      textAlign: TextAlign.left,
      fontColor: AppColors.white_900,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    );
  }
}
