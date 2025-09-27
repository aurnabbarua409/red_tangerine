import 'package:flutter/material.dart';
import 'package:red_tangerine/constant/app_colors.dart';

class SuggestTextWidget extends StatelessWidget {
  const SuggestTextWidget({super.key, required this.ontap, required this.text});
  final void Function() ontap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.claySolid,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
}
