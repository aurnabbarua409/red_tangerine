import 'package:flutter/material.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/utils/responsive_size.dart';
import 'package:red_tangerine/widgets/text_widget.dart';

enum ButtonType { elevated, icon, text, normal }

// ignore: must_be_immutable
class ButtonWidget extends StatelessWidget {
  ButtonWidget({
    super.key,
    required this.text,
    this.height = 50,
    this.width = double.infinity,
    this.margin,
    this.textColor,
    this.fontWeight,
    this.fontSize = 16,
    required this.ontap,
  }) : buttonType = ButtonType.elevated;
  ButtonWidget.normal({
    super.key,
    required this.text,
    this.height,
    this.width = double.infinity,
    this.margin,
    this.textColor,
    this.fontSize,
    this.backgroundColor,
    this.borderColor,
    required this.ontap,
  }) : buttonType = ButtonType.normal;
  ButtonWidget.icon({
    super.key,
    this.height,
    this.width,
    this.margin,
    this.iconColor,
    this.scale,
    required this.icon,
    required this.ontap,
  }) : buttonType = ButtonType.icon;
  ButtonWidget.text({
    super.key,
    required this.text,
    this.height,
    this.width,
    this.margin,
    this.textColor,
    this.fontSize,
    this.fontWeight = FontWeight.w400,
    this.textDecoration,
    required this.ontap,
  }) : buttonType = ButtonType.text;
  String? text;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  Color? textColor;
  double? fontSize;
  TextDecoration? textDecoration;
  final void Function() ontap;
  String? icon;
  ButtonType buttonType;
  Color? borderColor;
  Color? backgroundColor;
  Color? iconColor;
  double? scale;
  FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    if (buttonType == ButtonType.icon) {
      return InkWell(
        onTap: ontap,
        child: Image.asset(
          icon!,
          height: height,
          width: width,
          color: iconColor,
          scale: scale,
        ),
      );
    }
    if (buttonType == ButtonType.text) {
      return InkWell(
        onTap: ontap,
        child: TextWidget(
          text: text!,
          fontSize: fontSize,
          fontColor: textColor,
          fontWeight: fontWeight,
          textDecoration: textDecoration ?? TextDecoration.none,
        ),
      );
    }
    if (buttonType == ButtonType.normal) {
      return InkWell(
        onTap: ontap,
        borderRadius: BorderRadius.circular(25),
        child: Container(
          margin: margin ?? EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          width: ResponsiveSize.width(width ?? double.infinity),
          height: height,
          decoration: BoxDecoration(
            color: backgroundColor ?? const Color.fromARGB(0, 255, 255, 255),
            border: Border.all(color: borderColor ?? AppColors.white_900),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Center(
            child: Text(
              text!,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textColor ?? AppColors.grey_900,
                fontSize: fontSize ?? 16,
                fontFamily: 'Manrope',
              ),
            ),
          ),
        ),
      );
    }
    return InkWell(
      onTap: ontap,
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: ResponsiveSize.width(width ?? double.infinity),
        height: height,
        margin:
            margin ?? const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        decoration: BoxDecoration(
          color: AppColors.orange,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            text!,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: fontWeight,
              color: textColor ?? AppColors.white,
              fontFamily: 'Manrope',
              fontSize: fontSize,
            ),
          ),
        ),
      ),
    );
  }
}
