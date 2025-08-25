import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/constant/app_icons.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/routes/app_routes.dart';
import 'package:red_tangerine/screen/main_layout_screens/profile_screen/profile_screen/widgets/profile_item_widget.dart';
import 'package:red_tangerine/widgets/Button_widget.dart';
import 'package:red_tangerine/widgets/app_bar_widget.dart';
import 'package:red_tangerine/widgets/icon_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';
import 'package:red_tangerine/widgets/text_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBarWidget(
      body: [
        TextWidget.black(
          text: AppStrings.myProfile,
          fontSize: 0.3,
          fontWeight: FontWeight.w600,
        ),
        SpaceWidget(height: 20),
        Center(child: TextWidget.black(text: 'Samuel Johnson', fontSize: 0.29)),
        SpaceWidget(height: 10),
        Center(
          child: ButtonWidget.normal(
            text: AppStrings.editProfile,
            ontap: () {
              Get.toNamed(AppRoutes.editProfileScreen);
            },
            width: 40,
            height: 4,
            backgroundColor: AppColors.red_900,
            textColor: AppColors.white,
          ),
        ),
        SpaceWidget(height: 12),
        Container(
          padding: EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
          decoration: BoxDecoration(
            color: AppColors.brown_100,
            border: Border.all(color: AppColors.red_900),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              TextWidget.black(text: "Your Profile is 60% Completed"),
              SpaceWidget(height: 5),
              LinearPercentIndicator(
                progressColor: AppColors.red_900,
                percent: 0.6,
                barRadius: Radius.circular(20),
                lineHeight: 8,
              ),
            ],
          ),
        ),
        SpaceWidget(height: 20),
        ProfileItemWidget(
          icon: AppIcons.babyIcon,
          text: AppStrings.childAge,
          onTap: () {
            Get.toNamed(AppRoutes.editChildAgeScreen);
          },
        ),
        ProfileItemWidget(
          icon: AppIcons.testTubeIcon,
          text: AppStrings.diagnosis,
          onTap: () {},
        ),
        ProfileItemWidget(
          icon: AppIcons.briefcaseMedicalIcon,
          text: AppStrings.therapy,
          onTap: () {},
        ),
        ProfileItemWidget(
          icon: AppIcons.bandageIcon,
          text: AppStrings.parentingJourney,
          onTap: () {},
        ),
        ProfileItemWidget(
          icon: AppIcons.messageIcon,
          text: AppStrings.interestOrValue,
          onTap: () {},
        ),
        ProfileItemWidget(
          icon: AppIcons.imageIcon,
          text: AppStrings.photos,
          onTap: () {},
        ),
        ProfileItemWidget(
          icon: AppIcons.userRoundPenIcon,
          text: AppStrings.yourBio,
          onTap: () {},
        ),
        ProfileItemWidget(
          icon: AppIcons.mapPinkIcon,
          text: AppStrings.location,
          onTap: () {},
        ),
      ],
    );
  }
}
