import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/routes/app_routes.dart';

class PleaseShareYourLocationController extends GetxController {
  final locationController = TextEditingController();

  void onNext() {
    Get.toNamed(AppRoutes.yourPrivacyMattersScreen);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    locationController.dispose();
  }
}
