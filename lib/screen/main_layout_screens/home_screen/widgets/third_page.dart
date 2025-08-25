import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/constant/app_icons.dart';
import 'package:red_tangerine/constant/app_images.dart';
import 'package:red_tangerine/widgets/icon_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';
import 'package:red_tangerine/widgets/text_widget.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(AppDevImages.profilePicture, fit: BoxFit.cover),
        ),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 8,
              sigmaY: 8,
            ), // adjust blur strength
            child: Container(
              color: Colors.black.withOpacity(0), // transparent but required
            ),
          ),
        ),
        Container(
          width: double.infinity,
          color: AppColors.lightTransparent,
          child: Padding(
            padding: const EdgeInsets.only(top: 40, left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget.white(
                  text: 'Samuel Johnson, 32',
                  fontSize: 0.3,
                  fontWeight: FontWeight.w600,
                ),
                Row(
                  children: [
                    IconWidget(icon: AppIcons.mapPinIcon),
                    TextWidget(
                      text: '2 Miles away',
                      fontSize: 0.25,
                      fontColor: AppColors.grey_100,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                TextWidget.white(text: "Child's Age: 12"),
                SpaceWidget(height: 20),
                TextWidget.white(
                  text: "Values & Lifestyle",
                  fontWeight: FontWeight.w600,
                  fontSize: 0.26,
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TextWidget.blackLight(text: "Reading books 📚"),
                    ),
                    SpaceWidget(width: 10),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TextWidget.blackLight(text: "Nature walks 🌲"),
                    ),
                  ],
                ),
                SpaceWidget(height: 20),
                TextWidget.white(
                  text: "Photos",
                  fontWeight: FontWeight.w600,
                  fontSize: 0.26,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Image.asset(
                          AppDevImages.photo_1,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SpaceWidget(width: 15),
                    Expanded(
                      child: Container(
                        child: Image.asset(
                          AppDevImages.photo_2,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                SpaceWidget(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Image.asset(
                          AppDevImages.photo_3,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SpaceWidget(width: 15),
                    Expanded(
                      child: Container(
                        child: Image.asset(
                          AppDevImages.photo_4,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
    ;
  }
}
