import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_images.dart';
import 'package:red_tangerine/model/chat_model.dart';

class ChatsController extends GetxController {
  final searchController = TextEditingController();
  final RxList<ChatModel> chats = <ChatModel>[].obs;
  final RxBool isActive = false.obs;

  void setIsActive(){
    isActive.value = !isActive.value;
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    chats.value = [
      ChatModel(
        image: AppDevImages.chatSampleImage1,
        message: "Is the problem really serious?",
        name: "Kamlia",
        time: "9:01 AM",
        unseen: true,
      ),
      ChatModel(
        image: AppDevImages.chatSampleImage1,
        message: "Is the problem really serious?",
        name: "Kamlia",
        time: "9:01 AM",
        unseen: false,
      ),
      ChatModel(
        image: AppDevImages.chatSampleImage1,
        message: "Is the problem really serious?",
        name: "Kamlia",
        time: "9:01 AM",
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
