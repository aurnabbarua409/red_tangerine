import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/constant/app_icons.dart';
import 'package:red_tangerine/constant/app_images.dart';
import 'package:red_tangerine/widgets/icon_widget.dart';
import 'package:red_tangerine/widgets/text_widget.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(AppDevImages.profilePicture, fit: BoxFit.cover),
        ),

        ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: AppColors.lightTransparent,
              width: double.infinity,
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  TextWidget.white(
                    text: 'Samuel, 32',
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                  Row(
                    children: [
                      IconWidget(icon: AppIcons.mapPinIcon),
                      TextWidget(
                        text: '2 Miles away',
                        fontSize: 14,
                        fontColor: AppColors.grey_100,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                  TextWidget.white(text: "Child's Age: 12"),
                  TextWidget.white(
                    text: "Diagnosis: Neurodevelopmental Disorder",
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
