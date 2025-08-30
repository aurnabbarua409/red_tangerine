import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/constant/app_icons.dart';
import 'package:red_tangerine/constant/app_images.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/main_layout_screens/matches_screen/controller/matches_controller.dart';
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
  final _controller = Get.put(MatchesController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.onInitial();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.matches.isNotEmpty
        ? AppBarWidget(
            body: [
              TextWidget.black(
                text: AppStrings.matches,
                fontSize: 0.3,
                fontWeight: FontWeight.w600,
              ),
              TextformfieldWidget(
                controller: _controller.searchController,
                validator: (value) => null,
                label: "",
                suffixIcon: Icon(Icons.search),
                hintText: AppStrings.searchHere,
              ),
              SpaceWidget(height: 20),
              Expanded(
                child: GridView.builder(
                  itemCount: _controller.matches.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 0.55,
                  ),
                  itemBuilder: (context, index) => Card(
                    elevation: _controller.matches[index].unseen ? 6 : 1,
                    color: AppColors.white,

                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: _controller.matches[index].unseen
                              ? AppColors.red_900
                              : AppColors.white_800,
                          width: _controller.matches[index].unseen ? 4 : 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage(
                              _controller.matches[index].image,
                            ),
                          ),
                          SpaceWidget(height: 10), // change it to network image
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget.black(
                                text: _controller.matches[index].name,
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
                                        "${_controller.matches[index].distance} away",
                                  ),
                                ],
                              ),
                              SpaceWidget(height: 5),
                              TextWidget.blackLight(
                                text:
                                    "${AppStrings.childAge}: ${_controller.matches[index].childAge}",
                              ),
                              SpaceWidget(height: 5),
                              TextWidget.blackLight(
                                textAlign: TextAlign.left,
                                text:
                                    "${AppStrings.diagnosis}: ${_controller.matches[index].diagnosis}",
                              ),
                              SpaceWidget(height: 10),
                              FooterButtonWidget(
                                onTap: () {},
                                label: AppStrings.message,
                                isLightRedBackground: true,
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
          );
  }
}
