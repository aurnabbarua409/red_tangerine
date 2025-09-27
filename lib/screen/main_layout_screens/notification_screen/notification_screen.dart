import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/constant/app_icons.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/main_layout_screens/notification_screen/controller/notification_controller.dart';
import 'package:red_tangerine/screen/main_layout_screens/profile_screen/profile_screen_datails/widgets/app_bar_widget.dart';
import 'package:red_tangerine/widgets/app_background_widget.dart';
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
                child: ListView.builder(
                  itemCount: controller.notificationList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(bottom: 4),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: controller.notificationList[index].unseen
                                  ? AppColors.orange
                                  : AppColors.white_700,
                            ),
                            color: controller.notificationList[index].unseen
                                ? AppColors.orange
                                : AppColors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                text: '•',
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                fontColor:
                                    controller.notificationList[index].unseen
                                    ? AppColors.white
                                    : AppColors.orange,
                              ),
                              SpaceWidget(width: 5),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    text: AppStrings.youHaveOneNewMatch,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    fontColor:
                                        controller
                                            .notificationList[index]
                                            .unseen
                                        ? AppColors.white
                                        : AppColors.grey_900,
                                  ),
                                  TextWidget(
                                    text:
                                        controller.notificationList[index].name,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
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
                                            : AppColors.grey_700,
                                      ),
                                      TextWidget(
                                        text:
                                            "${controller.notificationList[index].distance} away",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        fontColor:
                                            controller
                                                .notificationList[index]
                                                .unseen
                                            ? AppColors.white
                                            : AppColors.grey_700,
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
                                            : AppColors.grey_700,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
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
                                        : AppColors.grey_700,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Spacer(),
                            TextWidget.blackLight(
                              text: '27 Aug 2025',
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                        SpaceWidget(height: 10),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
