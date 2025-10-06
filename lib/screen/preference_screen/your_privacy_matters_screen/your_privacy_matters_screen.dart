import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/routes/app_routes.dart';
import 'package:red_tangerine/service/local_storage.dart';
import 'package:red_tangerine/widgets/common_screen_widget.dart';
import 'package:red_tangerine/widgets/text_widget.dart';

class YourPrivacyMattersScreen extends StatelessWidget {
  const YourPrivacyMattersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScreenWidget(
      showProgressbar: true,
      progress: 0,
      title: AppStrings.yourPrivacyMatters,
      body: [TextWidget.blackLight(text: AppStrings.toHelpConnectYou)],

      footerButtonText: AppStrings.underStandAgree,
      onTap: () {
        Localstorage.fromSignup = true;
        Get.toNamed(AppRoutes.bottomNavBarScreen);
      },
    );
  }
}
