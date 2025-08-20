import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_icons.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/preference_screen/please_share_your_location_screen/controller/please_share_your_location_controller.dart';
import 'package:red_tangerine/widgets/Button_widget.dart';
import 'package:red_tangerine/widgets/auth_screen_widget.dart';
import 'package:red_tangerine/widgets/preference_header_important_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';
import 'package:red_tangerine/widgets/text_widget.dart';
import 'package:red_tangerine/widgets/textformfield_widget.dart';

class PleaseShareYourLocationScreen extends StatelessWidget {
  const PleaseShareYourLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: PleaseShareYourLocationController(),
      builder: (controller) => AuthScreenWidget(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PreferenceHeaderImportantWidget(
              text: AppStrings.pleaseShareYourLocation,
            ),
            SpaceWidget(height: 20),
            TextWidget.blackLight(text: AppStrings.weCanHelpConnectWithParent),
            SpaceWidget(height: 30),
            TextformfieldWidget(
              controller: controller.locationController,
              validator: (value) {},
              label: AppStrings.useMyCurrentLocation,
              suffixIcon: ButtonWidget.icon(
                icon: AppIcons.locationFixedIcon,
                ontap: () {},
              ),
            ),
          ],
        ),
        footer: ButtonWidget(text: AppStrings.next, ontap: controller.onNext),
      ),
    );
  }
}
