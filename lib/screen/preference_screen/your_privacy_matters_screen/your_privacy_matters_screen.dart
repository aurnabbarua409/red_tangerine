import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/routes/app_routes.dart';
import 'package:red_tangerine/widgets/auth_screen_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';
import 'package:red_tangerine/widgets/text_widget.dart';

class YourPrivacyMattersScreen extends StatelessWidget {
  const YourPrivacyMattersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScreenWidget(
      title: AppStrings.yourPrivacyMatters,
      body: [
        TextWidget.blackLight(text: AppStrings.toHelpConnectYou),
        SpaceWidget(height: 20),
        TextWidget.blackLight(text: AppStrings.weWillNeverShare),
      ],

      footerButtonText: AppStrings.underStandAgree,
      onTap: () {
        Get.toNamed(AppRoutes.bottomNavBarScreen);
      },
    );
  }
}
