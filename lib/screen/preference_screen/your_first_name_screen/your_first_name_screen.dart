import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/preference_screen/your_first_name_screen/controller/your_first_name_controller.dart';
import 'package:red_tangerine/utils/app_validator.dart';
import 'package:red_tangerine/widgets/common_screen_widget.dart';
import 'package:red_tangerine/widgets/textformfield_widget.dart';

class YourFirstNameScreen extends StatelessWidget {
  const YourFirstNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: YourFirstNameController(),
      builder: (controller) => CommonScreenWidget(
        showLeading: true,
        showProgressbar: true,
        progress: 0.7,
        title: AppStrings.firstNameTitle,
        subtitle: AppStrings.firstNameSubtitle,
        body: [
          TextformfieldWidget(
            label: AppStrings.firstName,
            controller: controller.nameController,
            validator: (value) => AppValidator.defaultvalidator(
              value: value,
              message: "Please write your first name",
            ),
          ),
        ],
        onTap: controller.onNext,
      ),
    );
  }
}
