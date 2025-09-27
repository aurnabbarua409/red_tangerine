import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/constant/app_icons.dart';
import 'package:red_tangerine/constant/app_images.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/main_layout_screens/matches_screen/controller/matches_controller.dart';
import 'package:red_tangerine/screen/main_layout_screens/matches_screen/widget/match_item.dart';
import 'package:red_tangerine/widgets/searchbar_widget.dart';
import 'package:red_tangerine/screen/main_layout_screens/profile_screen/profile_screen_datails/widgets/footer_button_widget.dart';
import 'package:red_tangerine/widgets/app_bar_widget.dart';
import 'package:red_tangerine/widgets/icon_widget.dart';
import 'package:red_tangerine/widgets/image_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';
import 'package:red_tangerine/widgets/text_widget.dart';
import 'package:red_tangerine/widgets/textformfield_widget.dart';

class MatchesScreen extends StatefulWidget {
  const MatchesScreen({super.key});

  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: MatchesController(),
      builder: (controller) {
        return controller.matches.isNotEmpty
            ? AppBarWidget(
                body: [
                  TextWidget.black(
                    text: AppStrings.matches,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  SearchbarWidget(
                    controller: controller.searchController,
                    validator: (value) => null,
                    suffixIcon: Icon(Icons.search),
                    hintText: AppStrings.searchHere,
                    ontap: controller.onSearch,
                  ),
                  SpaceWidget(height: 20),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Wrap(
                        spacing: 3, // horizontal spacing
                        runSpacing: 5, // vertical spacing
                        children: List.generate(controller.matches.length, (
                          index,
                        ) {
                          double screenWidth = MediaQuery.of(
                            context,
                          ).size.width;
                          double itemWidth =
                              (screenWidth / 2) - 22; // exactly two per row

                          return SizedBox(
                            width: itemWidth,
                            child: MatchItem(
                              unseen: controller.matches[index].unseen,
                              image: controller.matches[index].image,
                              name: controller.matches[index].name,
                              age: controller.matches[index].childAge
                                  .toString(),
                              distance: controller.matches[index].distance,
                              diagnosis: controller.matches[index].diagnosis,
                              ontap: controller.onMessage,
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              )
            : AppBarWidget(
                body: [
                  TextWidget.black(
                    text: AppStrings.matches,
                    fontSize: 0.3,
                    fontWeight: FontWeight.w600,
                  ),
                  SpaceWidget(height: 15),
                  TextWidget.blackLight(text: AppStrings.rightSupportTakesTime),
                  Spacer(),
                  Center(
                    child: Column(
                      children: [
                        ImageWidget(
                          fromNetwork: false,
                          image: AppImages.noMatchesImage,
                          width: 70,
                          height: 20,
                          color: AppColors.grey_900,
                          fit: BoxFit.fill,
                        ),
                        TextWidget.blackLight(
                          text: AppStrings.sorryNoMatchesYet,
                        ),
                      ],
                    ),
                  ),
                  SpaceWidget(height: 20),
                  Spacer(),
                ],
              );
      },
    );
  }
}
