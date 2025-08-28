import 'package:flutter/material.dart';
import 'package:red_tangerine/constant/app_colors.dart';

class CalenderIconWidget extends StatelessWidget {
  const CalenderIconWidget({super.key, required this.onPressed});
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(Icons.calendar_month_outlined, color: AppColors.red_900),
    );
  }
}
