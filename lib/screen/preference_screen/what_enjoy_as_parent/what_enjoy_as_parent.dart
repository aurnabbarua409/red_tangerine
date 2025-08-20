import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/preference_screen/what_enjoy_as_parent/controller/what_enjoy_as_parent_controller.dart';
import 'package:red_tangerine/screen/preference_screen/what_enjoy_as_parent/widget/bullet_text_widget.dart';
import 'package:red_tangerine/screen/preference_screen/what_enjoy_as_parent/widget/parent_button_widget.dart';
import 'package:red_tangerine/widgets/Button_widget.dart';
import 'package:red_tangerine/widgets/auth_screen_widget.dart';
import 'package:red_tangerine/widgets/preference_header_important_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';
import 'package:red_tangerine/widgets/text_widget.dart';

class WhatEnjoyAsParent extends StatelessWidget {
  const WhatEnjoyAsParent({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: WhatEnjoyAsParentController(),
      builder: (controller) => AuthScreenWidget(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PreferenceHeaderImportantWidget(
              text: AppStrings.whatYouEnjoyOrValueAsParent,
            ),
            SpaceWidget(height: 20),
            TextWidget.blackLight(text: AppStrings.checkAnyThatReflect),
            SpaceWidget(height: 30),
            BulletTextWidget(text: AppStrings.interestWhatyouEnjoyWithChild),
            SpaceWidget(height: 10),
            for (int i = 0; i < controller.interests.length; i = i + 2)
              Row(
                children: [
                  ParentButtonWidget(
                    label: controller.interests[i],
                    isSelected: controller.isSelectedInterest[i],
                    ontap: () => controller.onSelectedInterest(i),
                  ),
                  SpaceWidget(width: 7),
                  Expanded(
                    child: ParentButtonWidget(
                      label: controller.interests[i + 1],
                      isSelected: controller.isSelectedInterest[i + 1],
                      ontap: () => controller.onSelectedInterest(i + 1),
                    ),
                  ),
                ],
              ),
            SpaceWidget(height: 30),
            BulletTextWidget(text: AppStrings.valuesLifeStyle),
            SpaceWidget(height: 10),
            for (
              int i = 0;
              i < controller.valuesLifeStyle.length - 2;
              i = i + 2
            )
              Row(
                children: [
                  ParentButtonWidget(
                    label: controller.valuesLifeStyle[i],
                    isSelected: controller.isSelectedValuesLifeStyle[i],
                    ontap: () => controller.onSelectedValuesLifeStyle(i),
                  ),
                  SpaceWidget(width: 7),
                  Expanded(
                    child: ParentButtonWidget(
                      label: controller.valuesLifeStyle[i + 1],
                      isSelected: controller.isSelectedValuesLifeStyle[i + 1],
                      ontap: () => controller.onSelectedValuesLifeStyle(i + 1),
                    ),
                  ),
                ],
              ),
            Align(
              alignment: Alignment.centerLeft,
              child: ParentButtonWidget(
                label: controller.valuesLifeStyle[4],
                isSelected: controller.isSelectedValuesLifeStyle[4],
                ontap: () => controller.onSelectedValuesLifeStyle(4),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: ParentButtonWidget(
                label: controller.valuesLifeStyle[5],
                isSelected: controller.isSelectedValuesLifeStyle[5],
                ontap: () => controller.onSelectedValuesLifeStyle(5),
              ),
            ),
          ],
        ),
        footer: ButtonWidget(text: AppStrings.next, ontap: controller.onNext),
      ),
    );
  }
}
