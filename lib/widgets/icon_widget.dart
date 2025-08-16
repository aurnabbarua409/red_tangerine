import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({super.key, required this.icon});
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Image.asset(icon);
  }
}
