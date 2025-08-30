import 'package:flutter/material.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/widgets/Button_widget.dart';

class FooterButtonWidget extends StatelessWidget {
  const FooterButtonWidget({
    super.key,
    this.label,
    this.margin,
    this.isLightRedBackground = false,
    required this.onTap,
  });
  final String? label;
  final EdgeInsetsGeometry? margin;
  final bool isLightRedBackground;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return ButtonWidget.normal(
      text: label ?? AppStrings.update,
      backgroundColor: !isLightRedBackground
          ? AppColors.transparent
          : AppColors.red_900,
      textColor: !isLightRedBackground ? AppColors.grey_900 : AppColors.white,
      borderColor: AppColors.red_900,
      margin: margin ?? EdgeInsets.symmetric(horizontal: 20),
      ontap: onTap,
    );
  }
}
