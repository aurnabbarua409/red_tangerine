import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/auth_screen/signup_screen/controller/signup_controller.dart';
import 'package:red_tangerine/utils/app_validator.dart';
import 'package:red_tangerine/widgets/Button_widget.dart';
import 'package:red_tangerine/widgets/auth_screen_widget.dart';
import 'package:red_tangerine/widgets/richtext_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';
import 'package:red_tangerine/widgets/text_widget.dart';
import 'package:red_tangerine/widgets/textformfield_widget.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SignupController(),
      builder: (controller) => AuthScreenWidget(
        body: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextWidget.header(text: AppStrings.signUp),
                TextWidget.blackLight(text: AppStrings.createAccountOrLogin),
                SpaceWidget(height: 40),
                Row(
                  children: [
                    Expanded(
                      child: TextformfieldWidget(
                        label: AppStrings.firstName,
                        controller: controller.firstNameController,
                        validator: (value) {
                          return AppValidator.defaultvalidator(
                            value: value,
                            message: AppStrings.pleaseWriteYourFirstName,
                          );
                        },
                      ),
                    ),
                    SpaceWidget(width: 10),
                    Expanded(
                      child: TextformfieldWidget(
                        controller: controller.lastNameController,
                        validator: (value) {
                          return AppValidator.defaultvalidator(
                            value: value,
                            message: AppStrings.pleaseWriteYourLastName,
                          );
                        },
                        label: AppStrings.lastName,
                      ),
                    ),
                  ],
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
                ),
                SpaceWidget(height: 10),
                TextformfieldWidget(
                  controller: controller.emailController,
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
                  label: AppStrings.pleaseEnterPassword,
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
            ),
          ),
        ),

        footer: RichtextWidget(
          title: AppStrings.alreadyHavaAccount,
          buttonTitle: AppStrings.signin,
          fontColor: AppColors.grey_900,
          ontap: controller.onSignin,
        ),
      ),
    );
  }
}
