import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/routes/app_routes.dart';
import 'package:red_tangerine/screen/auth_screen/signin_screen/controller/signin_controller.dart';
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
    return AuthScreenWidget(
      body: GetBuilder(
        init: SigninController(),
        builder: (controller) => Column(
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
                      if (value == null || value.isEmpty) {
                        return AppStrings.pleaseEnterEmailAddress;
                      } else {
                        return controller.emailValidate(value);
                      }
                    },
                  ),
                  SpaceWidget(height: 10),
                  TextformfieldWidget(
                    label: AppStrings.password,
                    controller: controller.passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppStrings.pleaseEnterPassword;
                      }
                      return null;
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
                              controller.isRememberedMe.value =
                                  !controller.isRememberedMe.value;
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
                        ontap: () {},
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
      ),
      footer: RichtextWidget(
        title: AppStrings.dontHaveAccount,
        buttonTitle: AppStrings.signUp,
        fontColor: AppColors.grey_900,
        ontap: () {
          Get.toNamed(AppRoutes.signupScreen);
        },
      ),
    );
  }
}
