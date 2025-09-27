import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/routes/app_routes.dart';
import 'package:red_tangerine/screen/main_layout_screens/bottom_nav_bar_screen/botton_navbar.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final isVisiblePassword = false.obs;

  void onSignin() {
    // if (formKey.currentState!.validate()) {
    //   Get.toNamed(AppRoutes.preferenceHomeScreen);
    // } else {
    //   return;
    // }
    Get.offAllNamed(AppRoutes.bottomNavBarScreen);
    // Get.to(BottomNavbar());
  }

  void onSignUp() {
    Get.offAllNamed(AppRoutes.signupScreen);
  }

  void onForgetPassword() {
    Get.toNamed(AppRoutes.forgotPasswordScreen);
  }

  void onClickIsVisible() {
    isVisiblePassword.value = !isVisiblePassword.value;
    update();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
