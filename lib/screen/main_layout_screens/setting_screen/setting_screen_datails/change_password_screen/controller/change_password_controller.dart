import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  final currentPasswordController = TextEditingController();
  final setPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final isVisibleCurrent = false.obs;
  final isVisibleNew = false.obs;
  final isVisibleConfirm = false.obs;

  void onUpdate() {
    // if (formKey.currentState!.validate()) {}
    Get.back();
  }

  void onClickIsVisibleCurrent() {
    isVisibleCurrent.value = !isVisibleCurrent.value;
    update();
  }

  void onClickIsVisibleNew() {
    isVisibleNew.value = !isVisibleNew.value;
    update();
  }

  void onClickIsVisibleConfirm() {
    isVisibleConfirm.value = !isVisibleConfirm.value;
    update();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    currentPasswordController.dispose();
    setPasswordController.dispose();
    confirmPasswordController.dispose();
  }
}
