import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/utils/responsive_size.dart';
import 'package:red_tangerine/widgets/Button_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';
import 'package:red_tangerine/widgets/text_widget.dart';

class CustomPopupMenuWidget extends StatelessWidget {
  const CustomPopupMenuWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.leftButtonText,
    required this.rightButtonText,
    required this.rightButtonOnTap,
  });
  final String title;
  final String subtitle;
  final String leftButtonText;
  final String rightButtonText;
  final void Function() rightButtonOnTap;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      child: Container(
        height: 210,
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            TextWidget(
              text: title,
              fontColor: AppColors.red_900,
              fontWeight: FontWeight.w600,
              fontSize: 0.27,
            ),
            SpaceWidget(height: 10),
            TextWidget.black(text: subtitle),
            SpaceWidget(height: 20),
            Row(
              children: [
                Expanded(
                  child: ButtonWidget.normal(
                    text: leftButtonText,
                    borderColor: AppColors.red_900,
                    height: 4,
                    margin: EdgeInsets.all(0),
                    ontap: () {
                      Get.back();
                    },
                  ),
                ),
                SpaceWidget(width: 20),
                Expanded(
                  child: ButtonWidget.normal(
                    text: rightButtonText,
                    height: 4,
                    borderColor: AppColors.red_900,
                    backgroundColor: AppColors.red_900,
                    textColor: AppColors.white,
                    margin: EdgeInsets.all(0),
                    ontap: rightButtonOnTap,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
