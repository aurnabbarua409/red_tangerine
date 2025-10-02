import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavComtroller extends GetxController {
  final tabIndex = 0.obs;
  late PageController pageController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    pageController = PageController(initialPage: tabIndex.value);
  }

  void onChange(int value) {
    tabIndex.value = value;
    pageController.animateToPage(
      tabIndex.value,
      duration: Duration(milliseconds: 250),
      curve: Curves.fastOutSlowIn,
    );
    update();
  }
}
