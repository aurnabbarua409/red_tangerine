import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/constant/app_icons.dart';
import 'package:red_tangerine/constant/app_images.dart';
import 'package:red_tangerine/widgets/icon_widget.dart';
import 'package:red_tangerine/widgets/photo_viewer_widget.dart';
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
                  fontSize: 28,
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
                SpaceWidget(height: 20),
                TextWidget.white(
                  text: "Parenting Values",
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.white),
                        // color: AppColors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextWidget.white(text: "🎶 Music"),
                    ),
                    SpaceWidget(height: 10),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.white),
                        // color: AppColors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextWidget.white(text: "🧘 Wellness / self-care"),
                    ),
                  ],
                ),
                SpaceWidget(height: 20),
                TextWidget.white(
                  text: "Photos",
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
                Expanded(
                  child: GridView.builder(
                    itemCount: 4,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20.0,
                          crossAxisSpacing: 20.0,
                          childAspectRatio: 1.5,
                        ),
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => PhotoViewerWidget(
                              imagePath:
                                  AppDevImages.photo_1, // pass tapped image
                            ),
                          ),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.asset(
                          AppDevImages.photo_1,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
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
