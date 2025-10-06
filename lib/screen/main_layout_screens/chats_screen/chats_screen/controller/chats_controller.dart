import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_images.dart';
import 'package:red_tangerine/model/chat_model.dart';

class ChatsController extends GetxController {
  final searchController = TextEditingController();
  final RxList<ChatModel> chats = <ChatModel>[].obs;
  final RxBool isActive = true.obs;

  void setIsActive() {
    isActive.value = !isActive.value;
    update();
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
        time: "20 min",
        unseen: true,
      ),
      ChatModel(
        image: AppDevImages.chatSampleImage1,
        message: "Is the problem really serious?",
        name: "Kamlia",
        time: "20 min",
        unseen: false,
      ),
      ChatModel(
        image: AppDevImages.chatSampleImage1,
        message: "Is the problem really serious?",
        name: "Kamlia",
        time: "20 min",
        unseen: false,
      ),
    ];
  }

  void onSearch() {}
  // inside ChatsController
  void onEndChat(int index) {
    final c = chats[index];
    print('End chat with ${c.name}');
    update();
    // TODO: implement end-chat logic
  }

  void onBlock(int index) {
    final c = chats[index];
    print('Block user ${c.name}');
    update();
    // TODO: implement block logic
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    searchController.dispose();
  }
}
