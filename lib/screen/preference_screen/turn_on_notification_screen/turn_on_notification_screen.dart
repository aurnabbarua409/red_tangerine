import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/preference_screen/turn_on_notification_screen/controller/turn_on_notification_controller.dart';
import 'package:red_tangerine/widgets/Button_widget.dart';
import 'package:red_tangerine/widgets/common_screen_widget.dart';

class TurnOnNotificationScreen extends StatelessWidget {
  const TurnOnNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: TurnOnNotificationController(),
      builder: (controller) {
        return CommonScreenWidget(
          showLeading: true,
          showProgressbar: true,
          progress: 0.2,
          fromUpdate: controller.fromUpdate.value,
          appbarTitle: AppStrings.interestOrValue,
          title: AppStrings.notificationTurnOnTitle,
          subtitle: AppStrings.notificationTurnOnSubtitle,
          body: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
              child: ButtonWidget.normal(
                text: 'Enable Notification',
                fontSize: 16,
                ontap: () => controller.notificationTurnOn(true),
                backgroundColor: controller.turnonNotification.value
                    ? AppColors.orangeLight
                    : AppColors.transparent,
                borderColor: controller.turnonNotification.value
                    ? AppColors.orangeLight
                    : AppColors.white_700,
                height: 50,
                margin: EdgeInsets.zero,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),

              child: ButtonWidget.normal(
                text: 'Disable Notification',
                fontSize: 16,
                ontap: () => controller.notificationTurnOn(false),
                backgroundColor: !controller.turnonNotification.value
                    ? AppColors.orangeLight
                    : AppColors.transparent,
                borderColor: !controller.turnonNotification.value
                    ? AppColors.orangeLight
                    : AppColors.white_700,
                height: 50,
                margin: EdgeInsets.zero,
              ),
            ),
          ],

          onTap: controller.onNext,
          onUpdate: controller.onUpdate,
        );
      },
    );
  }
}
