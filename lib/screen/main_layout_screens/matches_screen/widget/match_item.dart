import 'package:flutter/material.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/constant/app_icons.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/main_layout_screens/profile_screen/profile_screen_datails/widgets/footer_button_widget.dart';
import 'package:red_tangerine/widgets/icon_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';
import 'package:red_tangerine/widgets/text_widget.dart';

class MatchItem extends StatelessWidget {
  const MatchItem({
    super.key,
    required this.unseen,
    required this.image,
    required this.name,
    required this.age,
    required this.distance,
    required this.diagnosis,
    required this.ontap,
  });
  final bool unseen;
  final String image;
  final String name;
  final String age;
  final String distance;
  final String diagnosis;
  final void Function() ontap;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: unseen ? 6 : 1,
      color: AppColors.white,

      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            color: unseen ? AppColors.orange : AppColors.white_800,
            width: unseen ? 4 : 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(radius: 35, backgroundImage: AssetImage(image)),
            SpaceWidget(height: 10), // change it to network image
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget.black(
                  text: name,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                SpaceWidget(height: 5),
                Row(
                  children: [
                    IconWidget(
                      icon: AppIcons.mapPinIcon,
                      scale: 2,
                      color: AppColors.grey_900,
                    ),
                    TextWidget.blackLight(
                      text: "$distance away",
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
                SpaceWidget(height: 5),
                TextWidget.blackLight(
                  text: "${AppStrings.childAge}: $age",
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                ),
                SpaceWidget(height: 5),
                TextWidget.blackLight(
                  textAlign: TextAlign.left,
                  text: "${AppStrings.diagnosis}: $diagnosis",
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                ),
                SpaceWidget(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: FooterButtonWidget(
                    onTap: ontap,
                    label: AppStrings.message,
                    fontSize: 10,
                    height: 24,
                    margin: EdgeInsets.zero,
                    isLightRedBackground: true,
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
