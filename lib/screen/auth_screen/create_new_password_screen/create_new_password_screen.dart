import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/auth_screen/create_new_password_screen/controller/create_new_password_controller.dart';
import 'package:red_tangerine/utils/app_validator.dart';
import 'package:red_tangerine/widgets/Button_widget.dart';
import 'package:red_tangerine/widgets/common_screen_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';
import 'package:red_tangerine/widgets/textformfield_widget.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final _controller = Get.put(CreateNewPasswordController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.onInitial();
  }

  @override
  Widget build(BuildContext context) {
    return CommonScreenWidget(
      title: AppStrings.createNewPassword,
      subtitle: AppStrings.setNewPasswordToContinue,
      formKey: _controller.formKey,
      body: [
        TextformfieldWidget(
          obscureText: true,
          controller: _controller.setPasswordController,
          validator: (value) {
            return AppValidator.defaultvalidator(
              value: value,
              message: AppStrings.pleaseEnterYourPassword,
            );
          },
          label: AppStrings.setPassword,
        ),
        SpaceWidget(height: 10),
        TextformfieldWidget(
          obscureText: true,
          controller: _controller.confirmPasswordController,
          validator: (value) {
            if (value != _controller.setPasswordController.text) {
              return AppStrings.passwordMismatchedError;
            }
            return AppValidator.defaultvalidator(
              value: value,
              message: AppStrings.pleaseEnterYourPassword,
            );
          },
          label: AppStrings.confirmPassword,
        ),
        SpaceWidget(height: 30),
        ButtonWidget(
          text: AppStrings.resetPassword,
          ontap: _controller.onResetPassword,
        ),
      ],
    );
  }
}
