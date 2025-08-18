import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/preference_screen/child_age_screen/controller/child_age_controller.dart';
import 'package:red_tangerine/utils/app_validator.dart';
import 'package:red_tangerine/widgets/Button_widget.dart';
import 'package:red_tangerine/widgets/auth_screen_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';
import 'package:red_tangerine/widgets/text_widget.dart';
import 'package:red_tangerine/widgets/textformfield_widget.dart';

class ChildAgeScreen extends StatelessWidget {
  const ChildAgeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ChildAgeController(),
      builder: (controller) => AuthScreenWidget(
        body: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidget.header(text: AppStrings.howOldYourChild),
              SpaceWidget(height: 10),
              TextWidget.blackLight(text: AppStrings.howOldYourChildDetails),
              SpaceWidget(height: 40),
              TextformfieldWidget(
                controller: controller.dateOfBirthController,
                validator: (value) => AppValidator.defaultvalidator(
                  value: value,
                  message: AppStrings.pleaseEnterChildDateOfBirth,
                ),
                label: AppStrings.enterChildDateOfBirth,
              ),
            ],
          ),
        ),
        footer: ButtonWidget(text: AppStrings.next, ontap: controller.onNext),
      ),
    );
  }
}
