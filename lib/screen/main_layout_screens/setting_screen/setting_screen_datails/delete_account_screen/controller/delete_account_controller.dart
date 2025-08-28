import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeleteAccountController extends GetxController {
  final passwordController = TextEditingController();

  void onClickedDelete() {}
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    passwordController.dispose();
  }
}
