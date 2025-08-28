import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:red_tangerine/routes/app_routes.dart';
import 'package:red_tangerine/screen/preference_screen/add_profile_picture_screen/widget/show_modal_bottom_sheet_widget.dart';
import 'package:red_tangerine/utils/app_log.dart';

class AddProfilePictureController extends GetxController {
  File? image;
  List<File> imageList = [];

  final fromUpdate = false.obs;
  void onInitital() {
    var args = Get.arguments;
    fromUpdate.value = args['fromUpdate'];
  }

  void onClickCamera(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return ShowModalBottomSheetWidget(
          onTakePhoto: onTakePhoto,
          onChooseFromGallery: onChooseFromGallery,
        );
      },
    );
  }

  void onTakePhoto() async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        image = File(pickedFile.path);
        update();
      }
    } catch (e) {
      appLogger(title: 'Add profile picture', message: e);
    }
  }

  void onChooseFromGallery() async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        image = File(pickedFile.path);
        update();
      }
    } catch (e) {
      appLogger(title: 'Add profile picture', message: e);
    }
  }

  void onNext() {
    Get.toNamed(
      AppRoutes.letOtherKnowAboutUScreen,
      arguments: {'fromUpdate': false},
    );
  }
  void onUpdate(){}
}
