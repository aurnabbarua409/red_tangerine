import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/routes/app_routes.dart';
import 'package:red_tangerine/utils/app_common_functions.dart';

class ChildAgeController extends GetxController {
  final formKey = GlobalKey<FormState>();
  var fromUpdate = false.obs;
  final List<TextEditingController> ageController = List.generate(
    8,
    (index) => TextEditingController(),
  );
  final List<FocusNode> focusNode = List.generate(8, (index) => FocusNode());

  void onInitital() {
    var args = Get.arguments;
    fromUpdate.value = args['fromUpdate'];
  }

  void onNext() {
    // if (formKey.currentState!.validate()) {
    Get.toNamed(AppRoutes.childJourneyScreen, arguments: {'fromUpdate': false});
    // }
  }

  void onUpdate() {
    Get.back();
  }

  String? month1Validate(String? value) {
    if (value == null) {
      return "";
    }
    final data = int.parse(value);
    if (data == 1 || data == 0) {
      return null;
    }
    return "";
  }

  String? month2Validate(String? value) {
    if (value == null) {
      return "";
    }
    final data = int.parse(value);
    final prev = int.parse(ageController[0].text);
    if (prev == 1) {
      if (data == 1 || data == 2) {
        return null;
      }
      if (prev == 0) {
        if (data >= 1 && data <= 9) {
          return null;
        }
      }
    }
    return "";
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    onInitital();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    for (final item in ageController) {
      item.dispose();
    }
    for (final item in focusNode) {
      item.dispose();
    }
  }
}
