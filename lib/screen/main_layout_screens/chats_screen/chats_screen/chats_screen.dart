import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/routes/app_routes.dart';
import 'package:red_tangerine/screen/main_layout_screens/chats_screen/chats_screen/controller/chats_controller.dart';
import 'package:red_tangerine/screen/main_layout_screens/chats_screen/chats_screen/widgets/chat_button_widget.dart';
import 'package:red_tangerine/widgets/app_bar_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';
import 'package:red_tangerine/widgets/text_widget.dart';
import 'package:red_tangerine/widgets/textformfield_widget.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ChatsController(),
      builder: (controller) => AppBarWidget(
        body: [
          TextWidget.black(
            text: AppStrings.chats,
            fontSize: 0.3,
            fontWeight: FontWeight.w600,
          ),
          TextformfieldWidget(
            controller: controller.searchController,
            validator: (value) => null,
            label: "",
            hintText: AppStrings.searchHere,
            suffixIcon: Icon(Icons.search, color: AppColors.white_700),
          ),
          SpaceWidget(height: 15),
          TextWidget.black(text: AppStrings.recentMatches, fontSize: 0.27),
          SpaceWidget(height: 5),
          SizedBox(
            height: 60, // must give height for horizontal ListView
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.chats.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: CircleAvatar(
                  radius: 28,
                  backgroundImage: AssetImage(controller.chats[index].image),
                ),
              ),
            ),
          ),
          SpaceWidget(height: 15),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ChatButtonWidget(
                  label: AppStrings.active,
                  isActive: controller.isActive.value,
                  ontap: controller.setIsActive,
                ),
                SpaceWidget(width: 10),
                ChatButtonWidget(
                  label: AppStrings.archive,
                  isActive: !(controller.isActive.value),
                  ontap: controller.setIsActive,
                ),
              ],
            ),
          ),
          SpaceWidget(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: controller.chats.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.chatMessageScreen);
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: controller.chats[index].unseen
                            ? AppColors.red_900
                            : AppColors.brown_300,
                        width: controller.chats[index].unseen ? 3 : 1,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 22,
                          backgroundImage: AssetImage(
                            controller.chats[index].image,
                          ),
                        ),
                        SpaceWidget(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget.black(
                              text: controller.chats[index].name,
                            ),
                            TextWidget.blackLight(
                              text: controller.chats[index].message,
                            ),
                          ],
                        ),
                        Spacer(),
                        TextWidget.blackLight(
                          text: controller.chats[index].time,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
