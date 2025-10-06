import 'package:flutter/material.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/constant/app_icons.dart';
import 'package:red_tangerine/widgets/icon_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';
import 'package:red_tangerine/widgets/text_widget.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

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
              text: "About",
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
            TextWidget.black(
              textAlign: TextAlign.left,
              text:
                  "Hi, I'm Samuel, dad to a wonderful 5-year-old girl with ASD. I'd love to connect with other parents who understand this journey.",
              fontWeight: FontWeight.w400,
            ),
            SpaceWidget(height: 20),
            TextWidget.black(
              text: "Parenting Journey",
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
            TextWidget.black(
              text: "Managing Day-to-Day ",
              fontWeight: FontWeight.w400,
            ),
            SpaceWidget(height: 20),
            TextWidget.black(
              text: "Diagnosis",
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            TextWidget.black(
              text:
                  "🌱 Intellectual Disability / Global Delay \n💥 Traumatic Brain Injury",
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.left,
            ),
            SpaceWidget(height: 20),
            TextWidget.black(
              text: "Therapy",
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
            TextWidget.black(
              text: "🎶 Music Therapy \n ",
              fontWeight: FontWeight.w400,
            ),
            SpaceWidget(height: 20),
            TextWidget.black(
              text: "Interests",
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.grey_800),
                    // color: AppColors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextWidget.black(text: "📅 Structured routines"),
                ),
                SpaceWidget(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.grey_800),
                    // color: AppColors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextWidget.black(text: "🔍 Always researching"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
