import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/routes/app_routes.dart';

class PleaseShareYourLocationController extends GetxController {
  var locationController = TextEditingController();
  final fromUpdate = false.obs;
  void onInitital() {
    var args = Get.arguments;
    fromUpdate.value = args['fromUpdate'];
    locationController = TextEditingController();
  }

  void onNext() {
    Get.toNamed(
      AppRoutes.yourPrivacyMattersScreen,
      arguments: {'fromUpdate': false},
    );
  }

  void onUpdate() {
    Get.back();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    locationController.dispose();
  }
}
