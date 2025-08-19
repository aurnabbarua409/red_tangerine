import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProfilePictureController extends GetxController {
  void onClickCamera(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column();
      },
    );
  }

  void onNext() {}
}
