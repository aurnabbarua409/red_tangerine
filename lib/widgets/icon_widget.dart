import 'package:flutter/material.dart';
import 'package:red_tangerine/utils/responsive_size.dart';

class IconWidget extends StatelessWidget {
  IconWidget({super.key, required this.icon, this.scale, this.color})
    : isCustom = false;
  IconWidget.custom({
    super.key,
    required this.icon,
    this.width,
    this.height,
    this.color,
  }) : isCustom = true;
  final bool isCustom;
  final String icon;
  double? width;
  double? height;
  Color? color;
  double? scale;
  @override
  Widget build(BuildContext context) {
    if (isCustom) {
      return Image.asset(
        icon,
        width: ResponsiveSize.width(width!),
        height: ResponsiveSize.height(height!),
        color: color,
        scale: scale,
      );
    }
    return Image.asset(icon, color: color, scale: scale);
  }
}
