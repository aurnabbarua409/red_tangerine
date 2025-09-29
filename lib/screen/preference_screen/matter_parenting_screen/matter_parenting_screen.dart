import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/preference_screen/matter_parenting_screen/controller/matter_parenting_controller.dart';
import 'package:red_tangerine/screen/preference_screen/matter_parenting_screen/widget/matter_parenting_item.dart';
import 'package:red_tangerine/widgets/common_screen_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';

class MatterParentingScreen extends StatelessWidget {
  const MatterParentingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: MatterParentingController(),
      builder: (controller) {
        return CommonScreenWidget(
          showLeading: true,
          showProgressbar: true,
          progress: 0.45,
          fromUpdate: controller.fromUpdate.value,
          appbarTitle: AppStrings.interestOrValue,
          title: AppStrings.matterParentingtitle,
          subtitle: AppStrings.matterParentingSubtitle,
          body: [
            for (int i = 0; i < controller.interests.length; i = i + 2)
              Row(
                children: [
                  Expanded(
                    child: MatterParentingItem(
                      label: controller.interests[i],
                      isSelected: controller.isSelectedInterest[i],
                      ontap: () => controller.onSelectedInterest(i),
                    ),
                  ),
                  SpaceWidget(width: 10),
                  Expanded(
                    child: MatterParentingItem(
                      label: controller.interests[i + 1],
                      isSelected: controller.isSelectedInterest[i + 1],
                      ontap: () => controller.onSelectedInterest(i + 1),
                    ),
                  ),
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
