import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/constant/app_icons.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/routes/app_routes.dart';
import 'package:red_tangerine/screen/main_layout_screens/chats_screen/chats_screen/controller/chats_controller.dart';
import 'package:red_tangerine/screen/main_layout_screens/chats_screen/chats_screen/widgets/chat_button_widget.dart';
import 'package:red_tangerine/widgets/Button_widget.dart';
import 'package:red_tangerine/widgets/app_bar_widget.dart';
import 'package:red_tangerine/widgets/icon_widget.dart';
import 'package:red_tangerine/widgets/searchbar_widget.dart';
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
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          SpaceWidget(height: 10),
          SearchbarWidget(
            controller: controller.searchController,
            validator: (value) => null,

            hintText: AppStrings.searchHere,
            suffixIcon: Icon(Icons.search, color: AppColors.white_700),
            ontap: controller.onSearch,
          ),
          SpaceWidget(height: 15),
          TextWidget.black(
            text: AppStrings.recentMatches,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
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
          Row(
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
          SpaceWidget(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: controller.chats.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.chatMessageScreen);
                  },
                  child: Card(
                    elevation: controller.chats[index].unseen ? 4 : 0,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      // margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: controller.chats[index].unseen
                              ? AppColors.orange
                              : AppColors.brown_300,
                          width: controller.chats[index].unseen ? 3 : 1,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 23,
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
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              TextWidget.blackLight(
                                text: controller.chats[index].message,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                          Spacer(),

                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              PopupMenuButton<String>(
                                onSelected: (value) {
                                  if (value == "1") {
                                    controller.onEndChat(index);
                                  } else if (value == "2") {
                                    controller.onBlock(index);
                                  }
                                },
                                itemBuilder: (_) => const [
                                  PopupMenuItem(
                                    value: "1",
                                    child: Text("End Chat"),
                                  ),
                                  PopupMenuItem(
                                    value: "2",
                                    child: Text("Block"),
                                  ),
                                ],
                                child: IconWidget(
                                  icon: AppIcons.menuHorizontalIcon,
                                ),
                              ),
                              TextWidget.blackLight(
                                text: controller.chats[index].time,
                              ),
                            ],
                          ),
                        ],
                      ),
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
