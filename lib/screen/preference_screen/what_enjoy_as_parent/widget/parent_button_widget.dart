import 'package:flutter/material.dart';
import 'package:red_tangerine/constant/app_colors.dart';

class ParentButtonWidget extends StatelessWidget {
  const ParentButtonWidget({
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
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.red_900 : AppColors.transparent,
          border: Border.all(color: AppColors.red_900),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isSelected ? AppColors.white : AppColors.grey_900,
          ),
        ),
      ),
    );
  }
}
