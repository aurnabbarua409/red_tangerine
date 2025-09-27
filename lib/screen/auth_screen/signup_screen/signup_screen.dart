import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/auth_screen/signup_screen/controller/signup_controller.dart';
import 'package:red_tangerine/utils/app_validator.dart';
import 'package:red_tangerine/widgets/Button_widget.dart';
import 'package:red_tangerine/widgets/common_screen_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';
import 'package:red_tangerine/widgets/text_widget.dart';
import 'package:red_tangerine/widgets/textformfield_widget.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SignupController(),
      builder: (controller) {
        return CommonScreenWidget(
          title: AppStrings.createAnAccount,
          subtitle: AppStrings.signupDetails,
          formKey: controller.formKey,
          body: [
            TextformfieldWidget(
              controller: controller.emailController,
              keyboardType: TextInputType.emailAddress,
              autofillHints: [AutofillHints.email],
              validator: (value) {
                return AppValidator.emailValidate(value);
              },
              label: AppStrings.email,
            ),
            SpaceWidget(height: 20),
            TextformfieldWidget(
              obscureText: !controller.isVisiblePassword.value,
              controller: controller.passwordController,
              validator: (value) {
                return AppValidator.passwordValidator(value);
              },
              label: AppStrings.password,
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
            Align(
              alignment: Alignment.centerLeft,
              child: TextWidget(
                text: AppStrings.passwordWarning,
                fontSize: 10,
                fontWeight: FontWeight.w400,
                fontColor: AppColors.claySolid,
              ),
            ),
            SpaceWidget(height: 20),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'By continuing, you agree to the ',
                    style: TextStyle(color: AppColors.grey_800),
                  ),
                  TextSpan(
                    text: 'Term & Conditions ',
                    style: TextStyle(
                      color: AppColors.claySolid,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = controller.onClickTermCondition,
                  ),
                  TextSpan(
                    text: 'and ',
                    style: TextStyle(color: AppColors.grey_800),
                  ),
                  TextSpan(
                    text: 'Privacy Policy',
                    style: TextStyle(
                      color: AppColors.claySolid,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = controller.onClickTermCondition,
                  ),
                ],
              ),
            ),
            SpaceWidget(height: 20),
            ButtonWidget(
              text: AppStrings.continue_,
              ontap: controller.onSignUp,
              margin: EdgeInsets.all(0),
            ),
          ],
          footerTextTitle: AppStrings.alreadyHavaAccount,
          footerTextSubtitle: AppStrings.login,
          onTapSign: controller.onSignin,
        );
      },
    );
  }
}
