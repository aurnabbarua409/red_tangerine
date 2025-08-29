import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/routes/app_routes.dart';

class ForgotPasswordController extends GetxController {
  var forgotPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  void onInitial() {
    forgotPasswordController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  void onSend() {
    // if (formKey.currentState!.validate()) {
    Get.toNamed(AppRoutes.createNewPasswordScreen);
    // }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    forgotPasswordController.dispose();
  }
}
