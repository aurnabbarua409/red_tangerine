import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/auth_screen/forgot_password_screen/controller/forgot_password_controller.dart';
import 'package:red_tangerine/utils/app_validator.dart';
import 'package:red_tangerine/widgets/Button_widget.dart';
import 'package:red_tangerine/widgets/common_screen_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';
import 'package:red_tangerine/widgets/textformfield_widget.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _controller = Get.put(ForgotPasswordController());

  @override
  void initState() {
    super.initState();
    _controller.onInitial();
  }

  @override
  Widget build(BuildContext context) {
    return CommonScreenWidget(
      title: AppStrings.forgotPassword,
      subtitle: AppStrings.provideEmailChangePassword,
      formKey: _controller.formKey,
      body: [
        TextformfieldWidget(
          controller: _controller.forgotPasswordController,
          validator: (value) {
            return AppValidator.emailValidate(value);
          },
          label: AppStrings.email,
        ),
        SpaceWidget(height: 20),
        ButtonWidget(text: AppStrings.send, ontap: _controller.onSend),
      ],
    );
  }
}
