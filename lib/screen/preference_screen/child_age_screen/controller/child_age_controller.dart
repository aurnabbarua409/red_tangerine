import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/routes/app_routes.dart';
import 'package:red_tangerine/utils/app_log.dart';

class ChildAgeController extends GetxController {
 
  var fromUpdate = false.obs;
  final isChild = true.obs;
  final List<TextEditingController> ageController = List.generate(
    8,
    (index) => TextEditingController(),
  );
  final List<FocusNode> focusNode = List.generate(8, (index) => FocusNode());

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    onInitital();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    onClear();
    super.onClose();
  }

  void onInitital() {
    var args = Get.arguments;
    fromUpdate.value = args['fromUpdate'];
    isChild.value = args['isChild'];
    appLogger(title: "Is Child", message: isChild.value);
  }

  void onClear() {
    for (final item in ageController) {
      item.dispose();
    }
    for (final item in focusNode) {
      item.dispose();
    }
    appLogger(title: "child age", message: "closed");
  }

  void onNext() {
    // if (formKey.currentState!.validate()) {
    final dateOfBirth =
        "${ageController[0].text}${ageController[1].text}/${ageController[2].text}${ageController[3].text}/${ageController[4].text}${ageController[5].text}${ageController[6].text}${ageController[7].text}";
    appLogger(title: "date of birth", message: dateOfBirth);
    if (isChild.value) {
      isChild.value = false;
      Get.toNamed(
        AppRoutes.childJourneyScreen,
        arguments: {'fromUpdate': false},
      );
    } else {
      Get.toNamed(
        AppRoutes.whereParentingJourneyScreen,
        arguments: {'fromUpdate': false},
      );
    }
    // }
  }

  void onUpdate() {
    Get.back();
  }
}
