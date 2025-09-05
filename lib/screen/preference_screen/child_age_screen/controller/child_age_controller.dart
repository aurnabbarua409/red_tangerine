import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/routes/app_routes.dart';
import 'package:red_tangerine/utils/app_common_functions.dart';
import 'package:red_tangerine/widgets/custom_calendar_picker.dart';

class ChildAgeController extends GetxController {
  var dateOfBirthController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var fromUpdate = false.obs;

  void onInitital() {
    var args = Get.arguments;
    fromUpdate.value = args['fromUpdate'];
    dateOfBirthController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  void onNext() {
    // if (formKey.currentState!.validate()) {
    Get.toNamed(
      AppRoutes.childDiagnosisScreen,
      arguments: {'fromUpdate': false},
    );
    // }
  }

  void onUpdate() {
    Get.back();
  }

  void onClickedCalender(BuildContext context) async {
    
    dateOfBirthController.text =
        await AppCommonFunctions.onClickedCalender(context) ?? "";
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    dateOfBirthController.dispose();
  }
}
