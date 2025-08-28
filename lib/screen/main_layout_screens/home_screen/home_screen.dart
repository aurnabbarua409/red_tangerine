import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/constant/app_icons.dart';
import 'package:red_tangerine/constant/app_images.dart';
import 'package:red_tangerine/screen/main_layout_screens/home_screen/widgets/first_page.dart';
import 'package:red_tangerine/screen/main_layout_screens/home_screen/widgets/second_page.dart';
import 'package:red_tangerine/screen/main_layout_screens/home_screen/widgets/third_page.dart';
import 'package:red_tangerine/utils/responsive_size.dart';
import 'package:red_tangerine/widgets/app_background_widget.dart';
import 'package:red_tangerine/widgets/app_bar_widget.dart';
import 'package:red_tangerine/widgets/icon_widget.dart';
import 'package:red_tangerine/widgets/image_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';
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
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return AppBarWidget(
      body: [
        Expanded(
          child: ListView.builder(
            physics: PageScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  SpaceWidget(height: 12),
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(15),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        CarouselSlider(
                          items: [FirstPage(), SecondPage(), ThirdPage()],
                          carouselController: _controller,
                          options: CarouselOptions(
                            height: ResponsiveSize.height(78),
                            viewportFraction: 1,
                            autoPlay: false,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _currentIndex = index;
                              });
                            },
                          ),
                        ),

                        Column(
                          children: [
                            SpaceWidget(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: images.asMap().entries.map((entry) {
                                bool isActive = entry.key == _currentIndex;
                                return GestureDetector(
                                  onTap: () =>
                                      _controller.animateToPage(entry.key),
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 2,
                                    ),
                                    height: 4,
                                    width: 40, // active wider
                                    decoration: BoxDecoration(
                                      color: isActive
                                          ? AppColors.white
                                          : AppColors.grey_100,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SpaceWidget(height: 12),
                ],
              );
            },
          ),
        ),

        const SizedBox(height: 12),

        // Custom Indicator
      ],
    );
  }
}
