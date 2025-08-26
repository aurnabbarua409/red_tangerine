import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/constant/app_icons.dart';
import 'package:red_tangerine/constant/app_images.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/main_layout_screens/chats_screen/chat_message_screen/controller/chat_message_controller.dart';
import 'package:red_tangerine/screen/main_layout_screens/chats_screen/chat_message_screen/widgets/chat_item_me_widget.dart';
import 'package:red_tangerine/screen/main_layout_screens/chats_screen/chat_message_screen/widgets/chat_item_other_widget.dart';
import 'package:red_tangerine/widgets/Button_widget.dart';
import 'package:red_tangerine/widgets/app_background_widget.dart';
import 'package:red_tangerine/widgets/icon_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';
import 'package:red_tangerine/widgets/text_widget.dart';
import 'package:red_tangerine/widgets/textformfield_widget.dart';

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
                TextWidget.black(text: 'Aurora'),
                Spacer(),
                GestureDetector(
                  onTap: () async {
                    final selected = await showMenu<String>(
                      context: context,
                      position: RelativeRect.fromLTRB(
                        100,
                        100,
                        0,
                        0,
                      ), // adjust position
                      items: [
                        PopupMenuItem(value: "1", child: Text('End Chat')),
                        PopupMenuItem(value: "2", child: Text('Block')),
                      ],
                    );
                    if (selected != null) {
                      if (selected == '1') debugPrint('End Chat clicked');
                      if (selected == '2') debugPrint('Block clicked');
                    }
                  },
                  child: Icon(Icons.more_vert, size: 24),
                ),
              ],
            ),
            SpaceWidget(height: 20),
            TextWidget(
              text: '26 June 2025',
              fontSize: 0.25,
              fontWeight: FontWeight.w400,
              fontColor: AppColors.black_200,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SpaceWidget(height: 15),
                      ChatItemMeWidget(),
                      SpaceWidget(height: 20),
                      ChatItemOtherWidget(),
                    ],
                  );
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextformfieldWidget(
                    controller: controller.messageController,
                    validator: (value) => null,
                    label: "",
                    hintText: AppStrings.message,
                    suffixIcon: ButtonWidget.icon(
                      icon: AppIcons.imageIcon,
                      scale: 0.8,
                      iconColor: AppColors.white_700,
                      ontap: () {},
                    ),
                  ),
                ),
                SpaceWidget(width: 10),
                CircleAvatar(
                  radius: 24,
                  backgroundColor: AppColors.red_900,
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
