import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_icons.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/routes/app_routes.dart';
import 'package:red_tangerine/screen/main_layout_screens/profile_screen/profile_screen/widgets/profile_item_widget.dart';
import 'package:red_tangerine/screen/main_layout_screens/profile_screen/profile_screen_datails/widgets/app_bar_widget.dart';
import 'package:red_tangerine/widgets/app_background_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackgroundWidget(
      padding: EdgeInsets.all(0),
      body: Column(
        children: [
          AppBarWidget(title: AppStrings.settings),
          Padding(
            padding: EdgeInsets.all(25),
            child: Column(
              children: [
                ProfileItemWidget(
                  icon: AppIcons.changePasswordIcon,
                  text: AppStrings.changePassword,
                  onTap: () {
                    Get.toNamed(AppRoutes.changePasswordScreen);
                  },
                ),

                ProfileItemWidget(
                  icon: AppIcons.aboutUsIcon,
                  text: AppStrings.aboutUs,
                  onTap: () {
                    Get.toNamed(AppRoutes.aboutUsScreen);
                  },
                ),

                ProfileItemWidget(
                  icon: AppIcons.privacyPolicyIcon,
                  text: AppStrings.privacyPolicy,
                  onTap: () {
                    Get.toNamed(AppRoutes.privacyPolicyScreen);
                  },
                ),

                ProfileItemWidget(
                  icon: AppIcons.termConditionIcon,
                  text: AppStrings.termCondition,
                  onTap: () {
                    Get.toNamed(AppRoutes.termConditionScreen);
                  },
                ),

                ProfileItemWidget(
                  icon: AppIcons.faqIcon,
                  text: AppStrings.faq,
                  onTap: () {
                    Get.toNamed(AppRoutes.faqScreen);
                  },
                ),

                ProfileItemWidget(
                  icon: AppIcons.faqIcon,
                  text: AppStrings.report,
                  onTap: () {
                    Get.toNamed(AppRoutes.reportScreen);
                  },
                ),

                ProfileItemWidget(
                  icon: AppIcons.blockedUserIcon,
                  text: AppStrings.blockedUser,
                  onTap: () {
                    Get.toNamed(AppRoutes.blockedUserScreen);
                  },
                ),

                ProfileItemWidget(
                  icon: AppIcons.deleteAccountIcon,
                  text: AppStrings.deletedAccount,
                  onTap: () {},
                ),

                ProfileItemWidget(
                  icon: AppIcons.logoutIcon,
                  text: AppStrings.logout,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
