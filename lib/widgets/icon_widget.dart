import 'package:flutter/material.dart';
import 'package:red_tangerine/utils/responsive_size.dart';

class IconWidget extends StatelessWidget {
  IconWidget({super.key, required this.icon}) : isCustom = false;
  IconWidget.custom({super.key, required this.icon, this.width, this.height})
    : isCustom = true;
  final bool isCustom;
  final String icon;
  double? width;
  double? height;
  @override
  Widget build(BuildContext context) {
    if (isCustom) {
      return Image.asset(
        icon,
        width: ResponsiveSize.width(width!)!,
        height: ResponsiveSize.height(height!),
      );
    }
    return Image.asset(icon);
  }
}
