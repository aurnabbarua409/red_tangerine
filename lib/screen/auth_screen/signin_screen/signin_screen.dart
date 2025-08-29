import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/auth_screen/signin_screen/controller/signin_controller.dart';
import 'package:red_tangerine/utils/app_validator.dart';
import 'package:red_tangerine/widgets/Button_widget.dart';
import 'package:red_tangerine/widgets/common_screen_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';
import 'package:red_tangerine/widgets/text_widget.dart';
import 'package:red_tangerine/widgets/textformfield_widget.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _controller = Get.put(SigninController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.onInitial();
  }

  @override
  Widget build(BuildContext context) {
    return CommonScreenWidget(
      title: AppStrings.signin,
      subtitle: AppStrings.createAccountOrLogin,
      formKey: _controller.formKey,
      body: [
        TextformfieldWidget(
          label: AppStrings.email,
          controller: _controller.emailController,
          keyboardType: TextInputType.emailAddress,
          autofillHints: [AutofillHints.email],
          validator: (value) {
            return AppValidator.emailValidate(value);
          },
        ),
        SpaceWidget(height: 10),
        TextformfieldWidget(
          obscureText: true,
          label: AppStrings.password,
          controller: _controller.passwordController,
          autofillHints: [AutofillHints.password],
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
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  value: _controller.isRememberedMe.value,
                  onChanged: (value) {
                    _controller.onRememberMe();
                  },
                ),
              ),
            ),
            TextWidget.blackLight(text: AppStrings.rememberMe, fontSize: 0.23),
            Spacer(),
            ButtonWidget.text(
              text: AppStrings.forgotPassword,
              textColor: AppColors.red_700,
              ontap: _controller.onForgetPassword,
              fontSize: 0.23,
            ),
          ],
        ),
        SpaceWidget(height: 15),
        ButtonWidget(
          text: AppStrings.signin,
          margin: EdgeInsets.all(0),
          ontap: _controller.onSignin,
        ),
      ],
      footerTextTitle: AppStrings.dontHaveAccount,
      footerTextSubtitle: AppStrings.signUp,
      onTapSign: () => _controller.onSignUp(),
    );
  }
}
