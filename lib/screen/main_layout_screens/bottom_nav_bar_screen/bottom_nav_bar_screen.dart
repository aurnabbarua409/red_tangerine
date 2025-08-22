import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/constant/app_icons.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/main_layout_screens/home_screen/home_screen.dart';
import 'package:red_tangerine/widgets/icon_widget.dart';
import 'package:red_tangerine/widgets/text_widget.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _MainLayoutScreenState();
}

class _MainLayoutScreenState extends State<BottomNavBarScreen> {
  int _tabIndex = 0;
  int get tabIndex => _tabIndex;
  set tabIndex(int v) {
    _tabIndex = v;
    setState(() {});
  }

  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: _tabIndex);
  }

  @override
  Widget build(BuildContext context) {
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
                fontSize: 0.22,
              ),
            ],
          ),
          Column(
            children: [
              IconWidget(icon: AppIcons.sproutIcon),
              TextWidget(
                text: AppStrings.matches,
                fontColor: AppColors.white,
                fontSize: 0.22,
              ),
            ],
          ),
          Column(
            children: [
              IconWidget(icon: AppIcons.messageSqaureIcon),
              TextWidget(
                text: AppStrings.chats,
                fontColor: AppColors.white,
                fontSize: 0.22,
              ),
            ],
          ),
          Column(
            children: [
              IconWidget(icon: AppIcons.profileIcon),
              TextWidget(
                text: AppStrings.profile,
                fontColor: AppColors.white,
                fontSize: 0.22,
              ),
            ],
          ),
        ],
        circleGradient: LinearGradient(
          colors: [AppColors.grey_900, AppColors.grey_900],
        ),
        color: Colors.white,
        gradient: LinearGradient(
          colors: [AppColors.mutedPurplishPink, AppColors.lightCoralPink],
        ),
        height: 60,
        circleWidth: 60,
        activeIndex: tabIndex,
        onTap: (index) {
          tabIndex = index;
          pageController.jumpToPage(tabIndex);
        },
        // padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
        cornerRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(24),
          bottomLeft: Radius.circular(24),
        ),
        shadowColor: Colors.deepPurple,
        elevation: 10,
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (v) {
          tabIndex = v;
        },
        children: [
          HomeScreen(),
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.red,
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.green,
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
