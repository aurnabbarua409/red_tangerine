import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/routes/app_routes.dart';

class LetOtherKnowAboutUController extends GetxController {
  var textEditingController = TextEditingController();
  final fromUpdate = false.obs;
  void onInitital() {
    var args = Get.arguments;
    fromUpdate.value = args['fromUpdate'];
    textEditingController = TextEditingController();
  }

  void onNext() {
    Get.toNamed(
      AppRoutes.pleaseShareYourLocationScreen,
      arguments: {'fromUpdate': false},
    );
  }
  void onUpdate(){}

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    textEditingController.dispose();
  }
}
