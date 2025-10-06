import 'package:flutter/widgets.dart';
import 'package:red_tangerine/constant/app_colors.dart';

// ignore: must_be_immutable
class TextWidget extends StatelessWidget {
  TextWidget({
    super.key,
    required this.text,
    required this.fontSize,
    this.fontColor,
    this.fontWeight,
    this.textAlign,
    this.textDecoration,
  });

  TextWidget.header({
    super.key,
    required this.text,
    this.fontSize = 28,
    this.textAlign,
    this.fontColor = AppColors.grey_900,
  }) : fontWeight = FontWeight.w600;
  TextWidget.blackLight({
    super.key,
    required this.text,
    this.fontSize = 14,
    this.textAlign,
    this.fontColor = AppColors.white_900,
    this.fontWeight = FontWeight.w500,
  });
  TextWidget.black({
    super.key,
    required this.text,
    this.fontSize = 14,
    this.textAlign,
    this.fontColor = AppColors.grey_900,
    this.fontWeight = FontWeight.w500,
  });
  TextWidget.red({
    super.key,
    required this.text,
    this.fontSize = 0.25,
    this.textDecoration,
    this.textAlign,
    this.fontColor = AppColors.red,
  }) : fontWeight = FontWeight.w400;
  TextWidget.white({
    super.key,
    required this.text,
    this.fontSize,
    this.textAlign,
    this.fontColor = AppColors.white,
    this.fontWeight,
  });
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
      softWrap: true,
      maxLines: null,
      style: TextStyle(
        fontSize: fontSize,
        color: fontColor,
        fontFamily: 'Manrope',
        decoration: textDecoration ?? TextDecoration.none,
        fontWeight: fontWeight ?? FontWeight.normal,
        decorationColor: AppColors.red,
      ),
    );
  }
}
