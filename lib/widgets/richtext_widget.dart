import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:red_tangerine/constant/app_colors.dart';

class RichtextWidget extends StatelessWidget {
  RichtextWidget({
    super.key,
    required this.title,
    required this.buttonTitle,
    this.fontColor,
    required this.ontap,
  });
  final String title;
  Color? fontColor;
  final String buttonTitle;
  final void Function() ontap;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyle(
              fontSize: 12,
              color: fontColor ?? AppColors.white_900,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(text: ' '),
          TextSpan(
            text: buttonTitle,
            style: TextStyle(
              decoration: TextDecoration.underline,
              fontSize: 12,
              color: fontColor ?? AppColors.white_900,
            ),
            recognizer: TapGestureRecognizer()..onTap = ontap,
          ),
        ],
      ),
    );
  }
}
