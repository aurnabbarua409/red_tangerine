import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/routes/app_routes.dart';

class CreateNewPasswordController extends GetxController {
  var setPasswordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  void onInitial() {
    setPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  void onResetPassword() {
    // if (formKey.currentState!.validate()) {
    Get.toNamed(AppRoutes.signinScreen);
    // }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    setPasswordController.dispose();
    confirmPasswordController.dispose();
  }
}
