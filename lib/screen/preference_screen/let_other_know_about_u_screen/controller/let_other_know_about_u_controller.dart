import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/routes/app_routes.dart';

class LetOtherKnowAboutUController extends GetxController {
  var textEditingController = TextEditingController();
  final fromUpdate = false.obs;
  final selectionList = [false, false, false].obs;
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

  void onUpdate() {
    Get.back();
  }

  void onSelectSuggestion(int value) {
    switch (value) {
      case 1:
        textEditingController.text = AppStrings.aParentingWin;
        selectionList.value = [true, false, false];
        break;
      case 2:
        textEditingController.text = AppStrings.somethingIWishIKnow;
        selectionList.value = [false, true, false];
        break;
      case 3:
        textEditingController.text = AppStrings.iAlwaysUpFor;
        selectionList.value = [false, false, true];
        break;
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    textEditingController.dispose();
  }
}
