import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_images.dart';
import 'package:red_tangerine/model/matches_model.dart';

class MatchesController extends GetxController {
  final RxList<MatchesModel> matches = <MatchesModel>[].obs;
  final searchController = TextEditingController();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    onInitial();
  }

  void onInitial() {
    matches.value = [
      MatchesModel(
        image: AppDevImages.profilePicture,
        name: 'Samuel Johnson',
        distance: "2 miles",
        childAge: 8,
        diagnosis: "Neurodevelopmental Disorder",
        unseen: true,
      ),
      MatchesModel(
        image: AppDevImages.photo_1,
        name: 'Samuel Johnson',
        distance: "2 miles",
        childAge: 8,
        diagnosis: "Neurodevelopmental Disorder",
        unseen: false,
      ),
      MatchesModel(
        image: AppDevImages.photo_1,
        name: 'Samuel Johnson',
        distance: "2 miles",
        childAge: 8,
        diagnosis: "Neurodevelopmental Disorder",
        unseen: false,
      ),
    ];
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    searchController.dispose();
  }
}
