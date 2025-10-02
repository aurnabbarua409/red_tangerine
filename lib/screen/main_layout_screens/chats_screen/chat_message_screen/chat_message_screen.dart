import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/constant/app_icons.dart';
import 'package:red_tangerine/constant/app_images.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/main_layout_screens/chats_screen/chat_message_screen/controller/chat_message_controller.dart';
import 'package:red_tangerine/screen/main_layout_screens/chats_screen/chat_message_screen/widgets/chat_item_me_widget.dart';
import 'package:red_tangerine/screen/main_layout_screens/chats_screen/chat_message_screen/widgets/chat_item_other_widget.dart';
import 'package:red_tangerine/screen/main_layout_screens/chats_screen/chat_message_screen/widgets/chatbox_widget.dart';
import 'package:red_tangerine/widgets/Button_widget.dart';
import 'package:red_tangerine/widgets/app_background_widget.dart';
import 'package:red_tangerine/widgets/icon_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';
import 'package:red_tangerine/widgets/text_widget.dart';

class ChatMessageScreen extends StatelessWidget {
  const ChatMessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackgroundWidget(
      body: GetBuilder(
        init: ChatMessageController(),
        builder: (controller) => Column(
          children: [
            Row(
              children: [
                ButtonWidget.icon(
                  icon: AppIcons.arrowLeft,
                  ontap: () {
                    Get.back();
                  },
                ),
                SpaceWidget(width: 10),
                CircleAvatar(
                  backgroundImage: AssetImage(AppDevImages.chatSampleImage1),
                ),
                SpaceWidget(width: 10),
                TextWidget.black(
                  text: 'Aurora',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    controller.onShowMenu(context);
                  },
                  child: Icon(Icons.more_vert, size: 24),
                ),
              ],
            ),
            SpaceWidget(height: 20),
            TextWidget(
              text: '26 June 2025',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontColor: AppColors.black_200,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ChatItemMeWidget(),
                      SpaceWidget(height: 20),
                      ChatItemOtherWidget(),
                      SpaceWidget(height: 20),
                    ],
                  );
                },
              ),
            ),

            controller.isEndChat.value
                ? SizedBox(
                    height: 50,
                    child: Center(
                      child: TextWidget.blackLight(
                        text: AppStrings.chatEnded,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                : Row(
                    children: [
                      Expanded(
                        child: ChatboxWidget(
                          controller: controller.messageController,
                          ontap: controller.onSelectImage,
                        ),
                      ),
                      SpaceWidget(width: 10),
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: AppColors.orange,
                        child: IconWidget(icon: AppIcons.sendIcon),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
