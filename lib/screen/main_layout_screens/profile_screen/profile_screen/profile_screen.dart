import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/constant/app_icons.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/routes/app_routes.dart';
import 'package:red_tangerine/screen/main_layout_screens/profile_screen/profile_screen/widgets/profile_item_widget.dart';
import 'package:red_tangerine/service/local_storage.dart';
import 'package:red_tangerine/utils/app_size.dart';
import 'package:red_tangerine/widgets/Button_widget.dart';
import 'package:red_tangerine/widgets/app_bar_widget.dart';
import 'package:red_tangerine/widgets/icon_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';
import 'package:red_tangerine/widgets/text_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox.shrink(),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        flexibleSpace: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.width(value: 22)),
          child: Row(
            children: [
              IconWidget.custom(
                icon: AppIcons.splashIcon,
                width: 12,
                height: 5,
              ),
              Spacer(),
              InkWell(
                onTap: () => Get.toNamed(AppRoutes.notificationScreen),
                child: IconWidget(icon: AppIcons.notificationIcon),
              ),
              SpaceWidget(width: 10),
              InkWell(
                onTap: () => Get.toNamed(AppRoutes.settingScreen),
                child: IconWidget(icon: AppIcons.settingIcon),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.width(value: 22)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextWidget.black(
                    text: AppStrings.myProfile,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
              SpaceWidget(height: 20),
              Center(
                child: TextWidget.black(
                  text: 'Samuel Johnson',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SpaceWidget(height: 10),
              Center(
                child: ButtonWidget.normal(
                  text: AppStrings.editProfile,
                  ontap: () {
                    Get.toNamed(AppRoutes.editProfileScreen);
                  },
                  width: 40,
                  height: 32,
                  backgroundColor: AppColors.orange,
                  borderColor: AppColors.orange,
                  textColor: AppColors.white,
                  fontSize: 12,
                ),
              ),
              SpaceWidget(height: 12),
              Container(
                padding: EdgeInsets.only(
                  top: 20,
                  bottom: 20,
                  left: 10,
                  right: 10,
                ),
                decoration: BoxDecoration(
                  color: AppColors.brown_100,
                  border: Border.all(color: AppColors.orange),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    TextWidget.black(text: "Your Profile is 60% Completed"),
                    SpaceWidget(height: 5),
                    LinearPercentIndicator(
                      progressColor: AppColors.orange,
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
                  Localstorage.fromUpdate = true;
                  Get.toNamed(
                    AppRoutes.childAgeScreen,
                    arguments: {'fromUpdate': true, 'isChild': true},
                  );
                },
              ),
              ProfileItemWidget(
                icon: AppIcons.testTubeIcon,
                text: AppStrings.diagnosis,
                onTap: () {
                  Get.toNamed(
                    AppRoutes.childDiagnosisScreen,
                    arguments: {'fromUpdate': true},
                  );
                },
              ),
              ProfileItemWidget(
                icon: AppIcons.briefcaseMedicalIcon,
                text: AppStrings.therapy,
                onTap: () {
                  Get.toNamed(
                    AppRoutes.therapySupportChildReceiveScreen,
                    arguments: {'fromUpdate': true},
                  );
                },
              ),
              ProfileItemWidget(
                icon: AppIcons.bandageIcon,
                text: AppStrings.parentingJourney,
                onTap: () {
                  Get.toNamed(
                    AppRoutes.whereParentingJourneyScreen,
                    arguments: {'fromUpdate': true},
                  );
                },
              ),
              ProfileItemWidget(
                icon: AppIcons.messageIcon,
                text: AppStrings.interestOrValue,
                onTap: () {
                  Get.toNamed(
                    AppRoutes.whatEnjoyAsParentScreen,
                    arguments: {'fromUpdate': true},
                  );
                },
              ),
              ProfileItemWidget(
                icon: AppIcons.imageIcon,
                text: AppStrings.photos,
                onTap: () {
                  Get.toNamed(
                    AppRoutes.addProfilePictureScreen,
                    arguments: {'fromUpdate': true},
                  );
                },
              ),
              ProfileItemWidget(
                icon: AppIcons.userRoundPenIcon,
                text: AppStrings.yourBio,
                onTap: () {
                  Get.toNamed(
                    AppRoutes.letOtherKnowAboutUScreen,
                    arguments: {'fromUpdate': true},
                  );
                },
              ),
              ProfileItemWidget(
                icon: AppIcons.mapPinkIcon,
                text: AppStrings.location,
                onTap: () {
                  Get.toNamed(
                    AppRoutes.pleaseShareYourLocationScreen,
                    arguments: {'fromUpdate': true},
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
