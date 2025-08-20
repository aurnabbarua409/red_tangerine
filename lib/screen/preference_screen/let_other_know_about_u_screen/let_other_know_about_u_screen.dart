import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/preference_screen/let_other_know_about_u_screen/controller/let_other_know_about_u_controller.dart';
import 'package:red_tangerine/utils/app_validator.dart';
import 'package:red_tangerine/widgets/Button_widget.dart';
import 'package:red_tangerine/widgets/auth_screen_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';
import 'package:red_tangerine/widgets/text_widget.dart';
import 'package:red_tangerine/widgets/textformfield_widget.dart';

class LetOtherKnowAboutUScreen extends StatelessWidget {
  const LetOtherKnowAboutUScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: LetOtherKnowAboutUController(),
      builder: (controller) => AuthScreenWidget(
        showSkip: true,
        onTapShowSkip: () => controller.onNext(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidget.header(text: AppStrings.letOtherKnowAboutYou),
            SpaceWidget(height: 10),
            TextWidget.blackLight(text: AppStrings.shortIntroHelpsOther),
            SpaceWidget(height: 20),
            TextformfieldWidget(
              controller: controller.textEditingController,
              validator: (value) => AppValidator.defaultvalidator(
                value: value,
                message: AppStrings.pleaseEnterSomething,
              ),
              label: '',
              maxlines: 5,
              borderRadius: 10,
            ),
          ],
        ),
        footer: ButtonWidget(text: AppStrings.next, ontap: controller.onNext),
      ),
    );
  }
}
