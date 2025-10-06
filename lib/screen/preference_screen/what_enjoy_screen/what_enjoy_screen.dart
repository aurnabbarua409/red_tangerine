import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/preference_screen/what_enjoy_screen/controller/what_enjoy_controller.dart';
import 'package:red_tangerine/screen/preference_screen/what_enjoy_screen/widget/what_enjoy_item.dart';
import 'package:red_tangerine/widgets/common_screen_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';

class WhatEnjoyScreen extends StatelessWidget {
  const WhatEnjoyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: WhatEnjoyController(),
      builder: (controller) {
        return CommonScreenWidget(
          showLeading: true,
          showProgressbar: true,
          progress: 0.5,
          fromUpdate: controller.fromUpdate.value,
          appbarTitle: AppStrings.interestOrValue,
          title: AppStrings.whatEnjoyTitle,
          subtitle: AppStrings.whatEnjoySubtitle,
          body: [
            for (int i = 0; i < controller.interests.length; i = i + 2)
              Row(
                children: [
                  Expanded(
                    child: WhatEnjoyItem(
                      label: controller.interests[i],
                      isSelected: controller.isSelectedInterest[i],
                      ontap: () => controller.onSelectedInterest(i),
                    ),
                  ),
                  SpaceWidget(width: 10),
                  Expanded(
                    child: WhatEnjoyItem(
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
