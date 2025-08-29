import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/routes/app_routes.dart';

class SigninController extends GetxController {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final isRememberedMe = false.obs;
  var formKey = GlobalKey<FormState>();

  void onInitial() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  void onSignin() {
    // if (formKey.currentState!.validate()) {
    //   Get.toNamed(AppRoutes.preferenceHomeScreen);
    // } else {
    //   return;
    // }
    Get.toNamed(AppRoutes.preferenceHomeScreen);
  }

  void onSignUp() {
    Get.toNamed(AppRoutes.signupScreen);
  }

  void onForgetPassword() {
    Get.toNamed(AppRoutes.forgotPasswordScreen);
  }

  void onRememberMe() {
    isRememberedMe.value = !isRememberedMe.value;
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }
}
