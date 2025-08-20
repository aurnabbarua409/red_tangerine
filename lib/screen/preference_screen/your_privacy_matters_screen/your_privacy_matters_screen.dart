import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/routes/app_routes.dart';
import 'package:red_tangerine/widgets/Button_widget.dart';
import 'package:red_tangerine/widgets/auth_screen_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';
import 'package:red_tangerine/widgets/text_widget.dart';

class YourPrivacyMattersScreen extends StatelessWidget {
  const YourPrivacyMattersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScreenWidget(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextWidget.header(text: AppStrings.yourPrivacyMatters),
          SpaceWidget(height: 20),
          TextWidget.blackLight(text: AppStrings.toHelpConnectYou),
          SpaceWidget(height: 20),
          TextWidget.blackLight(text: AppStrings.weWillNeverShare),
        ],
      ),
      footer: ButtonWidget(
        text: AppStrings.underStandAgree,
        ontap: () {
          Get.toNamed(AppRoutes.mainlayoutScreen);
        },
      ),
    );
  }
}
