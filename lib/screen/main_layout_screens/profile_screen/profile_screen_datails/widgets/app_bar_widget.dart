import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/widgets/space_widget.dart';
import 'package:red_tangerine/widgets/text_widget.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 63,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.orange),
        color: AppColors.orange,
      ),

      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back, color: AppColors.white),
          ),
          const Spacer(),
          TextWidget.white(
            textAlign: TextAlign.center,
            text: title,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          const Spacer(),
          SpaceWidget(width: 40),
        ],
      ),
    );
  }
}
