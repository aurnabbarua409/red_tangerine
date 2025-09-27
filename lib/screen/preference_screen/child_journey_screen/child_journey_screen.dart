import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/preference_screen/child_journey_screen/controller/child_journey_controller.dart';
import 'package:red_tangerine/screen/preference_screen/child_journey_screen/widget/child_journey_item.dart';
import 'package:red_tangerine/widgets/common_screen_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';
import 'package:red_tangerine/widgets/text_widget.dart';

class ChildJourneyScreen extends StatelessWidget {
  const ChildJourneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ChildJourneyController(),
      builder: (controller) {
        return CommonScreenWidget(
          showLeading: true,
          fromUpdate: controller.fromUpdate.value,
          appbarTitle: AppStrings.interestOrValue,
          title: AppStrings.childJourneyTitle,
          subtitle: AppStrings.childJourneySubtitle,
          body: [
            Align(
              alignment: Alignment.centerLeft,
              child: TextWidget(
                text: "Neurodevelopmental & Learning",
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            SpaceWidget(height: 10),
            Wrap(
              spacing: 8, // horizontal spacing
              runSpacing: 8, // vertical spacing
              children: List.generate(
                controller.interests.length,
                (i) => ChildJourneyItem(
                  label: controller.interests[i],
                  isSelected: controller.isSelectedInterest[i],
                  ontap: () => controller.onSelectedInterest(i),
                ),
              ),
            ),

            SpaceWidget(height: 30),
            Align(
              alignment: Alignment.centerLeft,
              child: TextWidget(
                text: "Genetic / Chromosomal",
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            SpaceWidget(height: 10),
            Wrap(
              spacing: 8, // horizontal space between buttons
              runSpacing: 8, // vertical space between rows
              children: List.generate(
                controller.valuesLifeStyle.length,
                (i) => ChildJourneyItem(
                  label: controller.valuesLifeStyle[i],
                  isSelected: controller.isSelectedValuesLifeStyle[i],
                  ontap: () => controller.onSelectedValuesLifeStyle(i),
                ),
              ),
            ),
            SpaceWidget(height: 30),
            Align(
              alignment: Alignment.centerLeft,
              child: TextWidget(
                text: "Genetic / Chromosomal",
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            SpaceWidget(height: 10),
            Wrap(
              spacing: 8, // horizontal space between buttons
              runSpacing: 8, // vertical space between rows
              children: List.generate(
                controller.valuesLifeStyle.length,
                (i) => ChildJourneyItem(
                  label: controller.valuesLifeStyle[i],
                  isSelected: controller.isSelectedValuesLifeStyle[i],
                  ontap: () => controller.onSelectedValuesLifeStyle(i),
                ),
              ),
            ),
            SpaceWidget(height: 30),
            Align(
              alignment: Alignment.centerLeft,
              child: TextWidget(
                text: "Genetic / Chromosomal",
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            SpaceWidget(height: 10),
            Wrap(
              spacing: 8, // horizontal space between buttons
              runSpacing: 8, // vertical space between rows
              children: List.generate(
                controller.valuesLifeStyle.length,
                (i) => ChildJourneyItem(
                  label: controller.valuesLifeStyle[i],
                  isSelected: controller.isSelectedValuesLifeStyle[i],
                  ontap: () => controller.onSelectedValuesLifeStyle(i),
                ),
              ),
            ),
            SpaceWidget(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Transform.scale(
                    alignment: Alignment.centerLeft,
                    scale: 0.8,
                    child: Checkbox.adaptive(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: controller.isWaiting.value,
                      onChanged: (value) {
                        controller.onClickIsWaiting();
                      },
                    ),
                  ),
                  TextWidget.black(
                    text: AppStrings.weAreStillWaitingOnTherapy,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
            SpaceWidget(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: TextWidget.black(text: AppStrings.ifOtherTypeHere),
            ),
            TextFormField(),
            SpaceWidget(height: 30),
          ],

          onTap: controller.onNext,
          onUpdate: controller.onUpdate,
        );
      },
    );
  }
}
