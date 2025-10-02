import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/utils/app_common_functions.dart';

class EditProfileController extends GetxController {
  var firstNameController = TextEditingController();
  var lastnameController = TextEditingController();
  var dateOfBirthController = TextEditingController();
  var emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final List<TextEditingController> ageController = List.generate(
    8,
    (index) => TextEditingController(),
  );
  final List<FocusNode> focusNode = List.generate(8, (index) => FocusNode());

  void onUpdate() {}
  void onClickedCalender(BuildContext context) async {
    dateOfBirthController.text =
        await AppCommonFunctions.onClickedCalender(context) ?? "";
  }

  void onClear() {
    firstNameController.dispose();
    lastnameController.dispose();
    dateOfBirthController.dispose();
    emailController.dispose();
    for (final item in ageController) {
      item.dispose();
    }
    for (final item in focusNode) {
      item.dispose();
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    onClear();
  }
}
