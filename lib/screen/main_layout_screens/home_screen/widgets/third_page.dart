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
    return Container(
      width: double.infinity,
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 40, left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget.black(
              text: 'Samuel Johnson, 32',
              fontSize: 28,
              fontWeight: FontWeight.w600,
            ),
            Row(
              children: [
                IconWidget(
                  icon: AppIcons.mapPinIcon,
                  color: AppColors.grey_500,
                ),
                TextWidget(
                  text: '2 Miles away',
                  fontSize: 14,
                  fontColor: AppColors.grey_500,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
            TextWidget.black(text: "Child's Age: 12"),
            SpaceWidget(height: 20),
            TextWidget.black(
              text: "Parenting Values",
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.grey_500),
                    // color: AppColors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextWidget.black(text: "🎶 Music"),
                ),
                SpaceWidget(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.grey_500),
                    // color: AppColors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextWidget.black(text: "🧘 Wellness / self-care"),
                ),
              ],
            ),
            SpaceWidget(height: 20),
            TextWidget.black(
              text: "Photos",
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: 4,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                          imagePath: AppDevImages.photo_1, // pass tapped image
                        ),
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(AppDevImages.photo_1, fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
