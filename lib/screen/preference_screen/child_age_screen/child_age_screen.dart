import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/preference_screen/child_age_screen/controller/child_age_controller.dart';
import 'package:red_tangerine/utils/app_validator.dart';
import 'package:red_tangerine/widgets/auth_screen_widget.dart';
import 'package:red_tangerine/widgets/textformfield_widget.dart';

class ChildAgeScreen extends StatelessWidget {
  const ChildAgeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ChildAgeController(),
      builder: (controller) => AuthScreenWidget(
        title: AppStrings.howOldYourChild,
        subtitle: AppStrings.howOldYourChildDetails,
        formKey: controller.formKey,
        body: [
          TextformfieldWidget(
            controller: controller.dateOfBirthController,
            validator: (value) => AppValidator.defaultvalidator(
              value: value,
              message: AppStrings.pleaseEnterChildDateOfBirth,
            ),
            label: AppStrings.enterChildDateOfBirth,
          ),
        ],
      
        onTap: controller.onNext,
      ),
    );
  }
}
