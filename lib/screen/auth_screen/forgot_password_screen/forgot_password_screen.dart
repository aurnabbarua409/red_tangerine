import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/auth_screen/forgot_password_screen/controller/forgot_password_controller.dart';
import 'package:red_tangerine/utils/app_validator.dart';
import 'package:red_tangerine/widgets/Button_widget.dart';
import 'package:red_tangerine/widgets/auth_screen_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';
import 'package:red_tangerine/widgets/textformfield_widget.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ForgotPasswordController(),
      builder: (controller) => AuthScreenWidget(
        title: AppStrings.forgotPassword,
        subtitle: AppStrings.provideEmailChangePassword,
        formKey: controller.formKey,
        body: [
          TextformfieldWidget(
            controller: controller.forgotPasswordController,
            validator: (value) {
              return AppValidator.emailValidate(value);
            },
            label: AppStrings.email,
          ),
          SpaceWidget(height: 20),
          ButtonWidget(text: AppStrings.send, ontap: controller.onSend),
        ],
      ),
    );
  }
}
