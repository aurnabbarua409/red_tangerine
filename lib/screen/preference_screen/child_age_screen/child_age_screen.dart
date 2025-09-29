import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/preference_screen/child_age_screen/controller/child_age_controller.dart';
import 'package:red_tangerine/screen/preference_screen/child_age_screen/widget/age_field_widget.dart';

import 'package:red_tangerine/widgets/common_screen_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';

class ChildAgeScreen extends StatefulWidget {
  const ChildAgeScreen({super.key});

  @override
  State<ChildAgeScreen> createState() => _ChildAgeScreenState();
}

class _ChildAgeScreenState extends State<ChildAgeScreen> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChildAgeController>(
      init: ChildAgeController(),

      builder: (controller) {
        return CommonScreenWidget(
          showLeading: true,
          showProgressbar: true,
          progress: controller.isChild.value ? 1 : 0.65,
          fromUpdate: controller.fromUpdate.value,
          appbarTitle: AppStrings.childAge,
          title: controller.isChild.value
              ? AppStrings.howOldYourChild
              : AppStrings.whatYourDateOfBirthTitle,
          subtitle: controller.isChild.value
              ? AppStrings.howOldYourChildDetails
              : AppStrings.whatYourDateOfBirthSubtitle,
          formKey: formKey,
          body: [
            Row(
              children: [
                AgeFieldWidget(
                  hintText: "M",
                  focusNode1: controller.focusNode[0],
                  focusNode2: controller.focusNode[1],
                  controller: controller.ageController[0],
                ),
                SpaceWidget(width: 3),
                AgeFieldWidget(
                  hintText: "M",
                  controller: controller.ageController[1],
                  focusNode1: controller.focusNode[1],
                  focusNode2: controller.focusNode[2],
                ),
                SpaceWidget(width: 30),
                AgeFieldWidget(
                  hintText: "D",

                  focusNode1: controller.focusNode[2],
                  focusNode2: controller.focusNode[3],
                  controller: controller.ageController[2],
                ),
                SpaceWidget(width: 3),
                AgeFieldWidget(
                  hintText: "D",

                  focusNode1: controller.focusNode[3],
                  focusNode2: controller.focusNode[4],
                  controller: controller.ageController[3],
                ),
                SpaceWidget(width: 30),
                AgeFieldWidget(
                  hintText: "Y",

                  focusNode1: controller.focusNode[4],
                  focusNode2: controller.focusNode[5],
                  controller: controller.ageController[4],
                ),
                SpaceWidget(width: 3),
                AgeFieldWidget(
                  hintText: "Y",

                  focusNode1: controller.focusNode[5],
                  focusNode2: controller.focusNode[6],
                  controller: controller.ageController[5],
                ),
                SpaceWidget(width: 3),
                AgeFieldWidget(
                  hintText: "Y",

                  focusNode1: controller.focusNode[6],
                  focusNode2: controller.focusNode[7],
                  controller: controller.ageController[6],
                ),
                SpaceWidget(width: 3),
                AgeFieldWidget(
                  hintText: "Y",

                  focusNode1: controller.focusNode[7],
                  focusNode2: controller.focusNode[7],
                  controller: controller.ageController[7],
                ),
              ],
            ),
            // BirthDateWidget()
            // TextformfieldWidget(
            //   controller: controller.dateOfBirthController,
            //   validator: (value) => AppValidator.defaultvalidator(
            //     value: value,
            //     message: AppStrings.pleaseEnterChildDateOfBirth,
            //   ),
            //   // label: AppStrings.enterChildDateOfBirth,
            //   suffixIcon: CalenderIconWidget(
            //     onPressed: () => controller.onClickedCalender(context),
            //   ),
            // ),
          ],

          onUpdate: controller.onUpdate,
          onTap: controller.onNext,
        );
      },
    );
  }
}
