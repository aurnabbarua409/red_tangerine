import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/auth_screen/login_screen/controller/login_controller.dart';
import 'package:red_tangerine/utils/app_validator.dart';
import 'package:red_tangerine/widgets/Button_widget.dart';
import 'package:red_tangerine/widgets/common_screen_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';
import 'package:red_tangerine/widgets/textformfield_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: LoginController(),
      builder: (controller) {
        return CommonScreenWidget(
          title: AppStrings.welcomeBack,
          subtitle: AppStrings.loginDetails,
          formKey: controller.formKey,
          body: [
            TextformfieldWidget(
              label: AppStrings.email,
              controller: controller.emailController,
              keyboardType: TextInputType.emailAddress,
              autofillHints: [AutofillHints.email],
              validator: (value) {
                return AppValidator.emailValidate(value);
              },
            ),
            SpaceWidget(height: 10),
            TextformfieldWidget(
              obscureText: !controller.isVisiblePassword.value,
              label: AppStrings.password,
              controller: controller.passwordController,
              autofillHints: [AutofillHints.password],

              validator: (value) {
                return AppValidator.defaultvalidator(
                  value: value,
                  message: AppStrings.pleaseEnterYourPassword,
                );
              },
              suffixIcon: IconButton(
                onPressed: controller.onClickIsVisible,
                icon: Icon(
                  color: AppColors.grey_800,
                  controller.isVisiblePassword.value
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                ),
              ),
            ),
            SpaceWidget(height: 20),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Spacer(),
                ButtonWidget.text(
                  text: AppStrings.forgotPassword,
                  textColor: AppColors.red_700,
                  ontap: controller.onForgetPassword,
                  fontSize: 12,
                ),
              ],
            ),
            SpaceWidget(height: 25),
            ButtonWidget(
              text: AppStrings.continue_,
              margin: EdgeInsets.all(0),
              ontap: controller.onSignin,
            ),
          ],
          footerTextTitle: AppStrings.newToReah,
          footerTextSubtitle: AppStrings.createAnAccount,
          onTapSign: () => controller.onSignUp(),
        );
      },
    );
  }
}
