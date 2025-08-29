import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  var currentPasswordController = TextEditingController();
  var setPasswordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  void onInitial() {
    currentPasswordController = TextEditingController();
    setPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  void onUpdate() {
    // if (formKey.currentState!.validate()) {}
    Get.back();
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
