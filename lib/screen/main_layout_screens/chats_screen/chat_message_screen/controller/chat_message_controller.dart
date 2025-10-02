import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatMessageController extends GetxController {
  var messageController = TextEditingController();
  final isEndChat = false.obs;

  void onSearch() {}

  void onSelectImage() {}
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    messageController.dispose();
  }

  void onShowMenu(BuildContext context) async {
    final selected = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(100, 100, 0, 0), // adjust position
      items: [
        PopupMenuItem(value: "1", child: Text('End Chat')),
        PopupMenuItem(value: "2", child: Text('Block')),
      ],
    );
    if (selected != null) {
      if (selected == '1') {
        isEndChat.value = true;
        update();
      }

      if (selected == '2') debugPrint('Block clicked');
    }
  }
}
