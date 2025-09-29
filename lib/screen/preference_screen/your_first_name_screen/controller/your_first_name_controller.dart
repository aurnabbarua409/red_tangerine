import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/routes/app_routes.dart';

class YourFirstNameController extends GetxController {
  final nameController = TextEditingController();
  void onNext() {
    Get.toNamed(
      AppRoutes.childAgeScreen,
      arguments: {'fromUpdate': false, 'isChild': false},
    );
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    nameController.dispose();
  }
}
