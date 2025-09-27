import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/utils/app_common_functions.dart';

class EditProfileController extends GetxController {
  var firstNameController = TextEditingController();
  var lastnameController = TextEditingController();
  var dateOfBirthController = TextEditingController();
  var emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void onUpdate() {}
  void onClickedCalender(BuildContext context) async {
    dateOfBirthController.text =
        await AppCommonFunctions.onClickedCalender(context) ?? "";
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    firstNameController.dispose();
    lastnameController.dispose();
    dateOfBirthController.dispose();
    emailController.dispose();
  }
}
