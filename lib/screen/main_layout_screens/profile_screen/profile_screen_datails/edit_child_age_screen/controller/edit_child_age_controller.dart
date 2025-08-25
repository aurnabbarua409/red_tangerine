import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditChildAgeController extends GetxController {
  var dateOfBirthController = TextEditingController();
  void onSelectDateOfBirth(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime(3000),
    );
    dateOfBirthController.text = date.toString();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    dateOfBirthController.dispose();
  }
}
