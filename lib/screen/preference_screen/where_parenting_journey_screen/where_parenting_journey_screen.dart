import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/preference_screen/where_parenting_journey_screen/controller/where_parenting_journey_controller.dart';
import 'package:red_tangerine/widgets/Button_widget.dart';
import 'package:red_tangerine/widgets/auth_screen_widget.dart';
import 'package:red_tangerine/widgets/preference_header_important_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';
import 'package:red_tangerine/widgets/text_widget.dart';

class WhereParentingJourneyScreen extends StatelessWidget {
  const WhereParentingJourneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: WhereParentingJourneyController(),
      builder: (controller) => AuthScreenWidget(
        title: AppStrings.whereParentingJourney,
        subtitle: AppStrings.everyoneExperienceDifferent,
        body: [
          ButtonWidget.normal(
            text: AppStrings.justStarting,
            textColor: controller.isParenting[0]
                ? AppColors.white
                : AppColors.grey_900,
            backgroundColor: controller.isParenting[0]
                ? AppColors.red_900
                : AppColors.transparent,
            ontap: controller.onJustStarting,
          ),
          ButtonWidget.normal(
            text: AppStrings.managingdayToday,
            textColor: controller.isParenting[1]
                ? AppColors.white
                : AppColors.grey_900,
            backgroundColor: controller.isParenting[1]
                ? AppColors.red_900
                : AppColors.transparent,
            ontap: controller.onmanagingDayToDay,
          ),
          ButtonWidget.normal(
            text: AppStrings.mentorReady,
            textColor: controller.isParenting[2]
                ? AppColors.white
                : AppColors.grey_900,
            backgroundColor: controller.isParenting[2]
                ? AppColors.red_900
                : AppColors.transparent,
            ontap: controller.mentorReady,
          ),
        ],

        onTap: controller.onNext,
      ),
    );
  }
}
