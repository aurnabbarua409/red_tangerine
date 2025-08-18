import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/auth_screen/signin_screen/controller/signin_controller.dart';
import 'package:red_tangerine/utils/app_validator.dart';
import 'package:red_tangerine/widgets/Button_widget.dart';
import 'package:red_tangerine/widgets/auth_screen_widget.dart';
import 'package:red_tangerine/widgets/richtext_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';
import 'package:red_tangerine/widgets/text_widget.dart';
import 'package:red_tangerine/widgets/textformfield_widget.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SigninController(),
      builder: (controller) => AuthScreenWidget(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidget.header(text: AppStrings.signin),
            TextWidget.blackLight(text: AppStrings.createAccountOrLogin),
            SpaceWidget(height: 20),
            Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextformfieldWidget(
                    label: AppStrings.email,
                    controller: controller.emailController,
                    validator: (value) {
                      return AppValidator.emailValidate(value);
                    },
                  ),
                  SpaceWidget(height: 10),
                  TextformfieldWidget(
                    label: AppStrings.password,
                    controller: controller.passwordController,
                    validator: (value) {
                      return AppValidator.defaultvalidator(
                        value: value,
                        message: AppStrings.pleaseEnterYourPassword,
                      );
                    },
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Obx(
                        () => Transform.scale(
                          alignment: Alignment.centerLeft,
                          scale: 0.8,
                          child: Checkbox.adaptive(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            value: controller.isRememberedMe.value,
                            onChanged: (value) {
                              controller.onRememberMe();
                            },
                          ),
                        ),
                      ),
                      TextWidget.blackLight(
                        text: AppStrings.rememberMe,
                        fontSize: 0.23,
                      ),
                      Spacer(),
                      ButtonWidget.text(
                        text: AppStrings.forgotPassword,
                        ontap: controller.onForgetPassword,
                        fontSize: 0.23,
                      ),
                    ],
                  ),
                  SpaceWidget(height: 15),
                  ButtonWidget(
                    text: AppStrings.signin,
                    margin: EdgeInsets.all(0),
                    ontap: controller.onSignin,
                  ),
                ],
              ),
            ),
          ],
        ),

        footer: RichtextWidget(
          title: AppStrings.dontHaveAccount,
          buttonTitle: AppStrings.signUp,
          fontColor: AppColors.grey_900,
          ontap: controller.onSignUp,
        ),
      ),
    );
  }
}
