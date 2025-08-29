import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/constant/app_icons.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/main_layout_screens/notification_screen/controller/notification_controller.dart';
import 'package:red_tangerine/screen/main_layout_screens/profile_screen/profile_screen_datails/widgets/app_bar_widget.dart';
import 'package:red_tangerine/widgets/app_background_widget.dart';
import 'package:red_tangerine/widgets/drop_down_button_form_field_widget.dart';
import 'package:red_tangerine/widgets/icon_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';
import 'package:red_tangerine/widgets/text_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackgroundWidget(
      padding: EdgeInsets.all(0),
      body: GetBuilder(
        init: NotificationController(),
        builder: (controller) => Column(
          children: [
            AppBarWidget(title: AppStrings.notifications),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Spacer(),
                        SizedBox(
                          width: 150,
                          child: DropDownButtonFormFieldWidget(
                            initialValue: controller.intervals[0],
                            items: controller.intervals,
                            onChanged: (value) {
                              controller.setIntervals(value);
                            },
                          ),
                        ),
                      ],
                    ),
                    SpaceWidget(height: 20),
                    Expanded(
                      child: ListView.builder(
                        itemCount: controller.notificationList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.red_900),
                              color: controller.notificationList[index].unseen
                                  ? AppColors.red_900
                                  : AppColors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(
                                  text: '•',
                                  fontSize: 0.3,
                                  fontWeight: FontWeight.bold,
                                  fontColor:
                                      controller.notificationList[index].unseen
                                      ? AppColors.white
                                      : AppColors.red_900,
                                ),
                                SpaceWidget(width: 5),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget(
                                      text: AppStrings.youHaveOneNewMatch,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 0.26,
                                      fontColor:
                                          controller
                                              .notificationList[index]
                                              .unseen
                                          ? AppColors.white
                                          : AppColors.grey_900,
                                    ),
                                    TextWidget(
                                      text: controller
                                          .notificationList[index]
                                          .name,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 0.255,
                                      fontColor:
                                          controller
                                              .notificationList[index]
                                              .unseen
                                          ? AppColors.white
                                          : AppColors.grey_900,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        IconWidget(
                                          icon: AppIcons.mapPinIcon,
                                          color:
                                              controller
                                                  .notificationList[index]
                                                  .unseen
                                              ? AppColors.white
                                              : AppColors.grey_800,
                                        ),
                                        TextWidget(
                                          text:
                                              "${controller.notificationList[index].distance} away",
                                          fontSize: 0.25,
                                          fontColor:
                                              controller
                                                  .notificationList[index]
                                                  .unseen
                                              ? AppColors.white
                                              : AppColors.grey_800,
                                        ),
                                        SpaceWidget(width: 30),
                                        TextWidget(
                                          text:
                                              "Child's Age: ${controller.notificationList[index].childAge}",
                                          fontColor:
                                              controller
                                                  .notificationList[index]
                                                  .unseen
                                              ? AppColors.white
                                              : AppColors.grey_800,
                                          fontSize: 0.25,
                                        ),
                                      ],
                                    ),
                                    TextWidget(
                                      text:
                                          "Diagnosis: Neurodevelopmental Disorder",
                                      fontColor:
                                          controller
                                              .notificationList[index]
                                              .unseen
                                          ? AppColors.white
                                          : AppColors.grey_800,
                                      fontSize: 0.25,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
