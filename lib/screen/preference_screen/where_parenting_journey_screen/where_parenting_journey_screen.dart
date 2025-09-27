import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/preference_screen/where_parenting_journey_screen/controller/where_parenting_journey_controller.dart';
import 'package:red_tangerine/screen/preference_screen/where_parenting_journey_screen/widget/parenting_journey_item.dart';
import 'package:red_tangerine/widgets/common_screen_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';

class WhereParentingJourneyScreen extends StatelessWidget {
  const WhereParentingJourneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: WhereParentingJourneyController(),
      builder: (controller) {
        return CommonScreenWidget(
          showLeading: true,
          fromUpdate: controller.fromUpdate.value,
          appbarTitle: AppStrings.parentingJourney,
          title: AppStrings.whereParentingJourney,
          subtitle: AppStrings.whereParentingJourneySubtitle,
          body: [
            Column(
              children: [
                ParentingJourneyItem(
                  isParenting: controller.isParenting[0],
                  icon: "🌱",
                  text:
                      "Just starting out We're new to this and learning as we go.",
                  ontap: controller.onJustStarting,
                ),
                SpaceWidget(height: 10),
                ParentingJourneyItem(
                  isParenting: controller.isParenting[1],
                  icon: "🌱",
                  text:
                      "Just starting out We're new to this and learning as we go.",
                  ontap: controller.onmanagingDayToDay,
                ),
                SpaceWidget(height: 10),
                ParentingJourneyItem(
                  isParenting: controller.isParenting[2],
                  icon: "🌱",
                  text:
                      "Just starting out We're new to this and learning as we go.",
                  ontap: controller.mentorReady,
                ),
                // ParentingJourneyItem(index: 1, controller: controller),
                // ParentingJourneyItem(index: 2, controller: controller),
              ],
            ),
          ],

          onTap: controller.onNext,
          onUpdate: controller.onUpdate,
        );
      },
    );
  }
}
