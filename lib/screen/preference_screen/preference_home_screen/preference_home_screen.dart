import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_icons.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/routes/app_routes.dart';
import 'package:red_tangerine/widgets/Button_widget.dart';
import 'package:red_tangerine/widgets/auth_screen_widget.dart';
import 'package:red_tangerine/widgets/icon_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';
import 'package:red_tangerine/widgets/text_widget.dart';

class PreferenceHomeScreen extends StatelessWidget {
  const PreferenceHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScreenWidget(
      showLeading: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconWidget(icon: AppIcons.splashIcon),
          SpaceWidget(height: 10),
          TextWidget.header(text: AppStrings.welcomeToZZZZ),
        ],
      ),
      footer: ButtonWidget(
        text: AppStrings.continue_,
        ontap: () {
          Get.toNamed(AppRoutes.childAgeScreen);
        },
      ),
    );
  }
}
