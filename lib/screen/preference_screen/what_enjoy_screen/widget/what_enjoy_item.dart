import 'package:flutter/material.dart';
import 'package:red_tangerine/constant/app_colors.dart';

class WhatEnjoyItem extends StatelessWidget {
  const WhatEnjoyItem({
    super.key,
    required this.label,
    required this.ontap,
    required this.isSelected,
  });
  final String label;
  final bool isSelected;
  final void Function() ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        height: 64,
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.orangeLight : AppColors.transparent,
          border: Border.all(
            color: isSelected ? AppColors.orangeLight : AppColors.white_700,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.grey_900,        fontFamily: 'Manrope',),
          ),
        ),
      ),
    );
  }
}
