import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/routes/app_routes.dart';

class LetOtherKnowAboutUController extends GetxController {
  final textEditingController = TextEditingController();

  void onNext() {
    Get.toNamed(AppRoutes.pleaseShareYourLocationScreen);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    textEditingController.dispose();
  }
}
