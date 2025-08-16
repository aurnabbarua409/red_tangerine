import 'package:flutter/material.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/utils/responsive_size.dart';
import 'package:red_tangerine/widgets/text_widget.dart';

enum ButtonType { elevated, icon, text }

class ButtonWidget extends StatelessWidget {
  ButtonWidget({
    super.key,
    required this.text,
    this.height,
    this.width = double.infinity,
    this.margin,
    this.textColor,
    this.fontSize,
    required this.ontap,
  }) : buttonType = ButtonType.elevated;
  ButtonWidget.icon({
    super.key,
    this.height,
    this.width,
    this.margin,
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
  @override
  Widget build(BuildContext context) {
    if (buttonType == ButtonType.icon) {
      return InkWell(onTap: ontap, child: Image.asset(icon!));
    }
    if (buttonType == ButtonType.text) {
      return InkWell(
        onTap: ontap,
        child: TextWidget.red(
          text: text!,
          fontSize: fontSize ?? 0.23,
          textDecoration: textDecoration ?? TextDecoration.none,
        ),
      );
    }
    return InkWell(
      onTap: ontap,
      child: Container(
        width: ResponsiveSize.width(width ?? double.infinity),
        height: ResponsiveSize.height(height ?? 6),
        margin:
            margin ?? const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.mutedPurplishPink, AppColors.lightCoralPink],
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            text!,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor ?? AppColors.white,
              fontSize: ResponsiveSize.fontSize(fontSize ?? 0.28),
            ),
          ),
        ),
      ),
    );
  }
}
