import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/constant/app_icons.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/main_layout_screens/bottom_nav_bar_screen/controller/bottom_nav_comtroller.dart';
import 'package:red_tangerine/screen/main_layout_screens/chats_screen/chats_screen/chats_screen.dart';
import 'package:red_tangerine/screen/main_layout_screens/home_screen/home_screen.dart';
import 'package:red_tangerine/screen/main_layout_screens/matches_screen/matches_screen.dart';
import 'package:red_tangerine/screen/main_layout_screens/profile_screen/profile_screen/profile_screen.dart';
import 'package:red_tangerine/widgets/icon_widget.dart';
import 'package:red_tangerine/widgets/text_widget.dart';

class BottomNavBarScreen extends StatelessWidget {
  const BottomNavBarScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder(
        init: BottomNavComtroller(),
        builder: (controller) {
          return Scaffold(
            extendBody: true,
            bottomNavigationBar: CircleNavBar(
              activeIcons: [
                IconWidget(icon: AppIcons.homeIcon),
                IconWidget(icon: AppIcons.sproutIcon),
                IconWidget(icon: AppIcons.messageSqaureIcon),
                IconWidget(icon: AppIcons.profileIcon),
              ],
              inactiveIcons: [
                Column(
                  children: [
                    IconWidget(icon: AppIcons.homeIconWhite),
                    TextWidget(
                      text: AppStrings.home,
                      fontColor: AppColors.white,
                      fontSize: 10.51,
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconWidget(icon: AppIcons.sproutIcon),
                    TextWidget(
                      text: AppStrings.matches,
                      fontColor: AppColors.white,
                      fontSize: 10.51,
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconWidget(icon: AppIcons.messageSqaureIcon),
                    TextWidget(
                      text: AppStrings.chats,
                      fontColor: AppColors.white,
                      fontSize: 10.51,
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconWidget(icon: AppIcons.profileIcon),
                    TextWidget(
                      text: AppStrings.profile,
                      fontColor: AppColors.white,
                      fontSize: 10.51,
                    ),
                  ],
                ),
              ],

              circleGradient: LinearGradient(
                colors: [AppColors.grey_900, AppColors.grey_900],
              ),
              color: AppColors.orange,
              // gradient: LinearGradient(
              //   colors: [AppColors.mutedPurplishPink, AppColors.lightCoralPink],
              // ),
              height: 64,
              circleWidth: 60,
              activeIndex: controller.tabIndex.value,
              onTap: (index) {
                controller.onChange(index);

                // pageController.jumpToPage(tabIndex);
              },
              // padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
              // cornerRadius: const BorderRadius.only(
              //   topLeft: Radius.circular(8),
              //   topRight: Radius.circular(8),
              //   // bottomRight: Radius.circular(24),
              //   // bottomLeft: Radius.circular(24),
              // ),
              shadowColor: Colors.deepPurple,
              elevation: 10,
            ),
            body: PageView(
              controller: controller.pageController,
              onPageChanged: (v) {
                controller.onChange(v);
              },
              children: [
                HomeScreen(),
                MatchesScreen(),
                ChatsScreen(),
                ProfileScreen(),
              ],
            ),
          );
        },
      ),
    );
  }
}
