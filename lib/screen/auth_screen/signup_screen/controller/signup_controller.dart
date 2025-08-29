import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/routes/app_routes.dart';
import 'package:red_tangerine/utils/app_common_functions.dart';

class SignupController extends GetxController {
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var dateofBirthController = TextEditingController();
  var emailController = TextEditingController();
  var setPasswordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  void onInitial() {
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    dateofBirthController = TextEditingController();
    emailController = TextEditingController();
    setPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  void onSignUp() {
    // if (formKey.currentState!.validate()) {
    //   Get.toNamed(AppRoutes.verificationScreen);
    // } else {
    //   return;
    // }
    // unhide the above part
    Get.toNamed(
      AppRoutes.verificationScreen,
      arguments: {'email': emailController.text},
    );
  }

  void onSignin() {
    Get.toNamed(AppRoutes.signinScreen);
  }

  void onClickedCalender(BuildContext context) async {
    dateofBirthController.text = await AppCommonFunctions.onClickedCalender(
      context,
    );
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
