import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/routes/app_routes.dart';

class ChildAgeController extends GetxController {
  final dateOfBirthController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void onNext() {
    // if (formKey.currentState!.validate()) {
    Get.toNamed(AppRoutes.childDiagnosisScreen);
    // }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    dateOfBirthController.dispose();
  }
}
