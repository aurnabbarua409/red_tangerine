import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportController extends GetxController {
  var reportTextController = TextEditingController();

  void onSendReport() {}

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    reportTextController.dispose();
  }
}
