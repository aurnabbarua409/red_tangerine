import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/auth_screen/create_new_password_screen/controller/create_new_password_controller.dart';
import 'package:red_tangerine/utils/app_validator.dart';
import 'package:red_tangerine/widgets/Button_widget.dart';
import 'package:red_tangerine/widgets/auth_screen_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';
import 'package:red_tangerine/widgets/text_widget.dart';
import 'package:red_tangerine/widgets/textformfield_widget.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CreateNewPasswordController(),
      builder: (controller) => AuthScreenWidget(
        title: AppStrings.createNewPassword,
        subtitle: AppStrings.setNewPasswordToContinue,
        formKey: controller.formKey,
        body: [
          TextformfieldWidget(
            controller: controller.setPasswordController,
            validator: (value) {
              return AppValidator.defaultvalidator(
                value: value,
                message: AppStrings.pleaseEnterYourPassword,
              );
            },
            label: AppStrings.setPassword,
          ),
          SpaceWidget(height: 10),
          TextformfieldWidget(
            controller: controller.confirmPasswordController,
            validator: (value) {
              if (value != controller.setPasswordController.text) {
                return AppStrings.passwordMismatchedError;
              }
              return AppValidator.defaultvalidator(
                value: value,
                message: AppStrings.pleaseEnterYourPassword,
              );
            },
            label: AppStrings.confirmPassword,
          ),
          SpaceWidget(height: 30),
          ButtonWidget(
            text: AppStrings.resetPassword,
            ontap: controller.onResetPassword,
          ),
        ],
      ),
    );
  }
}
