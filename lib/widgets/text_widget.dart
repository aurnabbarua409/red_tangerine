import 'package:flutter/widgets.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/utils/responsive_size.dart';

class TextWidget extends StatelessWidget {
  TextWidget({
    super.key,
    required this.text,
    required this.fontSize,
    this.fontColor,
  });

  TextWidget.header({
    super.key,
    required this.text,
    this.fontSize = 0.35,
    this.textAlign,
    this.fontColor = AppColors.grey_900,
  }) : fontWeight = FontWeight.w600;
  TextWidget.blackLight({
    super.key,
    required this.text,
    this.fontSize = 0.25,
    this.textAlign,
    this.fontColor = AppColors.white_900,
  }) : fontWeight = FontWeight.w500;
  TextWidget.black({
    super.key,
    required this.text,
    this.fontSize = 0.25,
    this.textAlign,
    this.fontColor = AppColors.grey_900,
  }) : fontWeight = FontWeight.w500;
  TextWidget.red({
    super.key,
    required this.text,
    this.fontSize = 0.25,
    this.textDecoration,
    this.textAlign,
    this.fontColor = AppColors.red,
  }) : fontWeight = FontWeight.w400;

  final String text;
  final double? fontSize;
  final Color? fontColor;
  FontWeight? fontWeight;
  TextDecoration? textDecoration;
  TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.center,
      style: TextStyle(
        fontSize: ResponsiveSize.fontSize(fontSize ?? 0.35),
        color: fontColor,
        decoration: textDecoration ?? TextDecoration.none,
        fontWeight: fontWeight ?? FontWeight.normal,
        decorationColor: AppColors.red,
      ),
    );
  }
}
