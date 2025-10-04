import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/routes/app_routes.dart';
import 'package:red_tangerine/service/local_storage.dart';

class SignupController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final isVisiblePassword = false.obs;

  void onSignUp() {
    // if (formKey.currentState!.validate()) {
    //   Get.toNamed(AppRoutes.verificationScreen);
    // } else {
    //   return;
    // }
    // unhide the above part
    Localstorage.fromSignup = true;
    Get.offAllNamed(
      AppRoutes.verificationScreen,
      arguments: {'email': emailController.text},
    );
  }

  void onSignin() {
    Get.toNamed(AppRoutes.loginScreen);
  }

  void onClickIsVisible() {
    isVisiblePassword.value = !isVisiblePassword.value;
    update();
  }

  void onClickTermCondition() {}

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
