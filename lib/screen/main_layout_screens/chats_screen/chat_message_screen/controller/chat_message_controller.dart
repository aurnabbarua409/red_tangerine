import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatMessageController extends GetxController {
  var messageController = TextEditingController();
  final isEndChat = false.obs;

  void onSearch(){}

  void onSelectImage(){}
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    messageController.dispose();
  }
}
