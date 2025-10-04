import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/constant/app_icons.dart';
import 'package:red_tangerine/constant/app_images.dart';
import 'package:red_tangerine/screen/main_layout_screens/home_screen/controller/home_controller.dart';
import 'package:red_tangerine/screen/main_layout_screens/home_screen/widgets/first_page.dart';
import 'package:red_tangerine/screen/main_layout_screens/home_screen/widgets/flipping_widget.dart';
import 'package:red_tangerine/screen/main_layout_screens/home_screen/widgets/second_page.dart';
import 'package:red_tangerine/screen/main_layout_screens/home_screen/widgets/third_page.dart';
import 'package:red_tangerine/utils/responsive_size.dart';
import 'package:red_tangerine/widgets/Button_widget.dart';
import 'package:red_tangerine/widgets/animated_heart_button.dart';
import 'package:red_tangerine/widgets/app_bar_widget.dart';
import 'package:red_tangerine/widgets/icon_widget.dart';
import 'package:red_tangerine/widgets/image_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';
import 'package:red_tangerine/widgets/tap_to_wave_widget.dart';
import 'package:red_tangerine/widgets/text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CarouselSliderController _controller = CarouselSliderController();
  // final CarouselController _controller = CarouselController();
  final List<String> images = [
    AppDevImages.profilePicture,
    AppDevImages.profilePicture,
    AppDevImages.profilePicture,
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeController(),
      builder: (controller) {
        return AppBarWidget(
          body: [
            Expanded(
              child: PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      // SpaceWidget(height: 12),
                      ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(15),
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            CarouselSlider(
                              items: [FirstPage(), SecondPage(), ThirdPage()],
                              carouselController: _controller,
                              options: CarouselOptions(
                                height: 690,
                                viewportFraction: 1,
                                autoPlay: false,
                                onPageChanged: (index, reason) {
                                  controller.onChangeIndex(index);
                                },
                              ),
                            ),

                            Column(
                              children: [
                                SpaceWidget(height: 15),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: images.asMap().entries.map((entry) {
                                    bool isActive =
                                        entry.key ==
                                        controller.currentIndex.value;
                                    return GestureDetector(
                                      onTap: () =>
                                          _controller.animateToPage(entry.key),
                                      child: AnimatedContainer(
                                        duration: const Duration(
                                          milliseconds: 300,
                                        ),
                                        margin: const EdgeInsets.symmetric(
                                          horizontal: 2,
                                        ),
                                        height: 4,
                                        width: 40, // active wider
                                        decoration: BoxDecoration(
                                          color: isActive
                                              ? controller.currentIndex.value ==
                                                        0
                                                    ? AppColors.white
                                                    : AppColors.grey_700
                                              : AppColors.grey_100,
                                          borderRadius: BorderRadius.circular(
                                            6,
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                            Positioned(
                              bottom: controller.currentIndex.value == 0
                                  ? 60
                                  : 10,
                              right: 10,
                              child: CircleAvatar(
                                backgroundColor:
                                    controller.currentIndex.value == 0
                                    ? AppColors.white
                                    : AppColors.claySolid,
                                radius: 30,
                                child: TapToWave(
                                  child: IconWidget(
                                    icon: controller.currentIndex.value == 0
                                        ? AppIcons.handIcon
                                        : AppIcons.whiteHandIcon,
                                  ),
                                ),
                              ),
                            ),
                            if (controller.showDemo1.value)
                              Container(
                                width: double.infinity,
                                height: 690,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(
                                    169,
                                    255,
                                    218,
                                    178,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  // mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SwipeUpHint(
                                      icon: IconWidget(
                                        icon: AppIcons.swipUpImage,
                                      ),
                                    ),
                                    SpaceWidget(height: 50),
                                    // IconWidget(icon: AppIcons.swipUpImage),
                                    TextWidget(
                                      text: "Discover more parents",
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    SpaceWidget(height: 20),
                                    ButtonWidget.normal(
                                      text: "Next",
                                      width: 30,
                                      borderColor: AppColors.claySolid,
                                      ontap: controller.onShowDemo2,
                                    ),
                                  ],
                                ),
                              ),
                            if (controller.showDemo2.value)
                              Container(
                                width: double.infinity,
                                height: 690,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(
                                    169,
                                    255,
                                    218,
                                    178,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  // mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SwipeLeftHint(
                                      icon: IconWidget(
                                        icon: AppIcons.swipeLeftImage,
                                      ),
                                    ),
                                    // IconWidget(icon: AppIcons.swipeLeftImage),
                                    TextWidget(
                                      text: "Learn more about a parent",
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    SpaceWidget(height: 20),
                                    ButtonWidget.normal(
                                      text: "Okay",
                                      width: 30,
                                      borderColor: AppColors.claySolid,
                                      ontap: controller.onOkayDemo2,
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                      // SpaceWidget(height: 12),
                    ],
                  );
                },
              ),
            ),

            const SizedBox(height: 12),

            // Custom Indicator
          ],
        );
      },
    );
  }
}
