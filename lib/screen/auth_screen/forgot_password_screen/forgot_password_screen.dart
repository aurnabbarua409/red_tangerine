import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/auth_screen/forgot_password_screen/controller/forgot_password_controller.dart';
import 'package:red_tangerine/widgets/auth_screen_widget.dart';
import 'package:red_tangerine/widgets/text_widget.dart';
import 'package:red_tangerine/widgets/textformfield_widget.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScreenWidget(
      body: GetBuilder(
        init: ForgotPasswordController(),
        builder: (controller) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidget.header(text: AppStrings.forgotPassword),
            TextWidget.blackLight(text: AppStrings.provideEmailChangePassword),
            TextformfieldWidget(
              controller: controller.forgotPasswordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please write your email address';
                } else {
                  return controller.emailValidate(value);
                }
              },
              label: AppStrings.email,
            ),
          ],
        ),
      ),
    );
  }
}
