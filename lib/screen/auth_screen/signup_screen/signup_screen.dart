import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/auth_screen/signup_screen/controller/signup_controller.dart';
import 'package:red_tangerine/utils/app_common_functions.dart';
import 'package:red_tangerine/utils/app_validator.dart';
import 'package:red_tangerine/widgets/Button_widget.dart';
import 'package:red_tangerine/widgets/auth_screen_widget.dart';
import 'package:red_tangerine/widgets/calender_icon_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';
import 'package:red_tangerine/widgets/textformfield_widget.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SignupController(),
      builder: (controller) => AuthScreenWidget(
        title: AppStrings.signUp,
        subtitle: AppStrings.createAccountOrLogin,
        formKey: controller.formKey,
        body: [
          TextformfieldWidget(
            label: AppStrings.firstName,
            controller: controller.firstNameController,
            validator: (value) {
              return AppValidator.defaultvalidator(
                value: value,
                message: AppStrings.pleaseWriteYourFirstName,
              );
            },
          ),
          SpaceWidget(height: 10),
          TextformfieldWidget(
            controller: controller.lastNameController,
            validator: (value) {
              return AppValidator.defaultvalidator(
                value: value,
                message: AppStrings.pleaseWriteYourLastName,
              );
            },
            label: AppStrings.lastName,
          ),
          SpaceWidget(height: 10),
          TextformfieldWidget(
            controller: controller.dateofBirthController,
            validator: (value) {
              return AppValidator.defaultvalidator(
                value: value,
                message: AppStrings.pleaseEnterDateOfBirth,
              );
            },
            label: AppStrings.dateofBirth,
            suffixIcon: CalenderIconWidget(
              onPressed: () => controller.onClickedCalender(context),
            ),
          ),
          SpaceWidget(height: 10),
          TextformfieldWidget(
            controller: controller.emailController,
            keyboardType: TextInputType.emailAddress,
            autofillHints: [AutofillHints.email],
            validator: (value) {
              return AppValidator.emailValidate(value);
            },
            label: AppStrings.email,
          ),
          SpaceWidget(height: 10),
          TextformfieldWidget(
            controller: controller.setPasswordController,
            validator: (value) {
              return AppValidator.passwordValidator(value);
            },
            label: AppStrings.setAPassword,
          ),
          SpaceWidget(height: 10),
          TextformfieldWidget(
            controller: controller.confirmPasswordController,
            validator: (value) {
              return AppValidator.confirmPasswordValidator(
                value: value,
                password: controller.setPasswordController.text,
              );
            },
            label: AppStrings.confirmPassword,
          ),
          SpaceWidget(height: 20),
          ButtonWidget(
            text: AppStrings.signUp,
            ontap: controller.onSignUp,
            margin: EdgeInsets.all(0),
          ),
        ],
        footerTextTitle: AppStrings.alreadyHavaAccount,
        footerTextSubtitle: AppStrings.signin,
        onTapSign: controller.onSignin,
      ),
    );
  }
}
