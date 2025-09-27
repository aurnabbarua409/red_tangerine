import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/routes/app_routes.dart';

class CreateNewPasswordController extends GetxController {
  final setPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final isVisibleNew = false.obs;
  final isVisibleConfirm = false.obs;

  void onChangeVisibleNew() {
    isVisibleNew.value = !isVisibleNew.value;
    update();
  }

  void onChangeVisibleConfirm() {
    isVisibleConfirm.value = !isVisibleConfirm.value;
    update();
  }

  void onResetPassword() {
    // if (formKey.currentState!.validate()) {
    Get.toNamed(AppRoutes.loginScreen);
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
