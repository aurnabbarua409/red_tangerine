import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/preference_screen/let_other_know_about_u_screen/controller/let_other_know_about_u_controller.dart';
import 'package:red_tangerine/utils/app_validator.dart';
import 'package:red_tangerine/widgets/auth_screen_widget.dart';
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
        title: AppStrings.letOtherKnowAboutYou,
        subtitle: AppStrings.shortIntroHelpsOther,
        body: [
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

        onTap: controller.onNext,
      ),
    );
  }
}
