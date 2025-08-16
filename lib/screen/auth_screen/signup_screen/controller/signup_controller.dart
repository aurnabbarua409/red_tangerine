import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/routes/app_routes.dart';

class SignupController extends GetxController {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final dateofBirthController = TextEditingController();
  final emailController = TextEditingController();
  final setPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void onSignUp() {
    // if (formKey.currentState!.validate()) {
    //   Get.toNamed(AppRoutes.verificationScreen);
    // } else {
    //   return;
    // }
    // unhide the above part
    Get.toNamed(AppRoutes.verificationScreen, arguments: {
      'email': emailController.text
    });
  }

  String? emailValidate(String value) {    
    const pattern =
        r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    if (value.isNotEmpty && !regex.hasMatch(value)) {
      return 'Enter a Valid Email Address';
    }
    return null;
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    firstNameController.dispose();
    lastNameController.dispose();
    dateofBirthController.dispose();
    emailController.dispose();
    setPasswordController.dispose();
    confirmPasswordController.dispose();
  }
}
