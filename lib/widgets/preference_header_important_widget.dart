import 'package:flutter/material.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/utils/responsive_size.dart';

class PreferenceHeaderImportantWidget extends StatelessWidget {
  const PreferenceHeaderImportantWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: text,
            style: TextStyle(
              color: AppColors.grey_900,
              fontSize: ResponsiveSize.fontSize(0.35),
              fontWeight: FontWeight.w600,        fontFamily: 'Manrope',
            ),
          ),
          TextSpan(
            text: ' *',
            style: TextStyle(
              color: AppColors.red,
              fontSize: ResponsiveSize.fontSize(0.35),        fontFamily: 'Manrope',
            ),
          ),
        ],
      ),
    );
  }
}
