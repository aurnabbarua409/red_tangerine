import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/preference_screen/where_parenting_journey_screen/controller/where_parenting_journey_controller.dart';
import 'package:red_tangerine/widgets/Button_widget.dart';
import 'package:red_tangerine/widgets/auth_screen_widget.dart';

class WhereParentingJourneyScreen extends StatefulWidget {
  const WhereParentingJourneyScreen({super.key});

  @override
  State<WhereParentingJourneyScreen> createState() =>
      _WhereParentingJourneyScreenState();
}

class _WhereParentingJourneyScreenState
    extends State<WhereParentingJourneyScreen> {
  final _controller = Get.put(WhereParentingJourneyController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.onInitital();
  }

  @override
  Widget build(BuildContext context) {
    return AuthScreenWidget(
      fromUpdate: _controller.fromUpdate.value,
      appbarTitle: AppStrings.parentingJourney,
      title: AppStrings.whereParentingJourney,
      subtitle: AppStrings.everyoneExperienceDifferent,
      body: [
        ButtonWidget.normal(
          text: AppStrings.justStarting,
          textColor: _controller.isParenting[0]
              ? AppColors.white
              : AppColors.grey_900,
          backgroundColor: _controller.isParenting[0]
              ? AppColors.red_900
              : AppColors.transparent,
          ontap: _controller.onJustStarting,
        ),
        ButtonWidget.normal(
          text: AppStrings.managingdayToday,
          textColor: _controller.isParenting[1]
              ? AppColors.white
              : AppColors.grey_900,
          backgroundColor: _controller.isParenting[1]
              ? AppColors.red_900
              : AppColors.transparent,
          ontap: _controller.onmanagingDayToDay,
        ),
        ButtonWidget.normal(
          text: AppStrings.mentorReady,
          textColor: _controller.isParenting[2]
              ? AppColors.white
              : AppColors.grey_900,
          backgroundColor: _controller.isParenting[2]
              ? AppColors.red_900
              : AppColors.transparent,
          ontap: _controller.mentorReady,
        ),
      ],

      onTap: _controller.onNext,
      onUpdate: _controller.onUpdate,
    );
  }
}
