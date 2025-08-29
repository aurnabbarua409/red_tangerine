import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/constant/app_icons.dart';
import 'package:red_tangerine/constant/app_images.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/main_layout_screens/matches_screen/controller/matches_controller.dart';
import 'package:red_tangerine/screen/main_layout_screens/profile_screen/profile_screen_datails/widgets/footer_button_widget.dart';
import 'package:red_tangerine/widgets/Button_widget.dart';
import 'package:red_tangerine/widgets/app_bar_widget.dart';
import 'package:red_tangerine/widgets/icon_widget.dart';
import 'package:red_tangerine/widgets/image_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';
import 'package:red_tangerine/widgets/text_widget.dart';
import 'package:red_tangerine/widgets/textformfield_widget.dart';

class MatchesScreen extends StatelessWidget {
  const MatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: MatchesController(),
      builder: (controller) => controller.matches.isNotEmpty
          ? AppBarWidget(
              body: [
                TextWidget.black(
                  text: AppStrings.matches,
                  fontSize: 0.3,
                  fontWeight: FontWeight.w600,
                ),
                TextformfieldWidget(
                  controller: controller.searchController,
                  validator: (value) => null,
                  label: "",
                  suffixIcon: Icon(Icons.search),
                  hintText: AppStrings.searchHere,
                ),
                SpaceWidget(height: 20),
                Expanded(
                  child: GridView.builder(
                    itemCount: controller.matches.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 0.55,
                    ),
                    itemBuilder: (context, index) => Card(
                      elevation: controller.matches[index].unseen ? 6 : 1,
                      color: AppColors.white,

                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.red_900,
                            width: controller.matches[index].unseen ? 4 : 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundImage: AssetImage(
                                controller.matches[index].image,
                              ),
                            ),
                            SpaceWidget(
                              height: 10,
                            ), // change it to network image
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget.black(
                                  text: controller.matches[index].name,
                                ),
                                SpaceWidget(height: 5),
                                Row(
                                  children: [
                                    IconWidget(
                                      icon: AppIcons.mapPinIcon,
                                      color: AppColors.grey_900,
                                    ),
                                    TextWidget.blackLight(
                                      text:
                                          "${controller.matches[index].distance} away",
                                    ),
                                  ],
                                ),
                                SpaceWidget(height: 5),
                                TextWidget.blackLight(
                                  text:
                                      "${AppStrings.childAge}: ${controller.matches[index].childAge}",
                                ),
                                SpaceWidget(height: 5),
                                TextWidget.blackLight(
                                  textAlign: TextAlign.left,
                                  text:
                                      "${AppStrings.diagnosis}: ${controller.matches[index].diagnosis}",
                                ),
                                SpaceWidget(height: 10),
                                FooterButtonWidget(
                                  onTap: () {},
                                  label: AppStrings.message,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
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
                      TextWidget.blackLight(text: AppStrings.sorryNoMatchesYet),
                    ],
                  ),
                ),
                SpaceWidget(height: 20),
                Spacer(),
              ],
            ),
    );
  }
}
