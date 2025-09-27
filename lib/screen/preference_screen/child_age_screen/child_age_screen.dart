import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/preference_screen/child_age_screen/controller/child_age_controller.dart';
import 'package:red_tangerine/screen/preference_screen/child_age_screen/widget/age_field_widget.dart';

import 'package:red_tangerine/utils/app_validator.dart';
import 'package:red_tangerine/widgets/common_screen_widget.dart';
import 'package:red_tangerine/widgets/calender_icon_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';
import 'package:red_tangerine/widgets/textformfield_widget.dart';

class ChildAgeScreen extends StatefulWidget {
  const ChildAgeScreen({super.key});

  @override
  State<ChildAgeScreen> createState() => _ChildAgeScreenState();
}

class _ChildAgeScreenState extends State<ChildAgeScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ChildAgeController(),
      builder: (controller) {
        return CommonScreenWidget(
          showLeading: true,
          fromUpdate: controller.fromUpdate.value,
          appbarTitle: AppStrings.childAge,
          title: AppStrings.howOldYourChild,
          subtitle: AppStrings.howOldYourChildDetails,
          formKey: controller.formKey,
          body: [
            Row(
              children: [
                AgeFieldWidget(
                  hintText: "M",
                  focusNode1: controller.focusNode[0],
                  focusNode2: controller.focusNode[1],
                  controller: controller.ageController[0],
                  onValidate: (value) => controller.month1Validate(value),
                ),
                SpaceWidget(width: 3),
                AgeFieldWidget(
                  hintText: "M",
                  controller: controller.ageController[1],
                  focusNode1: controller.focusNode[1],
                  focusNode2: controller.focusNode[2],
                  onValidate: (value) => controller.month2Validate(value),
                ),
                SpaceWidget(width: 30),
                AgeFieldWidget(
                  hintText: "D",
                  onValidate: (value) {},
                  focusNode1: controller.focusNode[2],
                  focusNode2: controller.focusNode[3],
                  controller: controller.ageController[2],
                ),
                SpaceWidget(width: 3),
                AgeFieldWidget(
                  hintText: "D",
                  onValidate: (value) {},
                  focusNode1: controller.focusNode[3],
                  focusNode2: controller.focusNode[4],
                  controller: controller.ageController[3],
                ),
                SpaceWidget(width: 30),
                AgeFieldWidget(
                  hintText: "Y",
                  onValidate: (value) {},
                  focusNode1: controller.focusNode[4],
                  focusNode2: controller.focusNode[5],
                  controller: controller.ageController[4],
                ),
                SpaceWidget(width: 3),
                AgeFieldWidget(
                  hintText: "Y",
                  onValidate: (value) {},
                  focusNode1: controller.focusNode[5],
                  focusNode2: controller.focusNode[6],
                  controller: controller.ageController[5],
                ),
                SpaceWidget(width: 3),
                AgeFieldWidget(
                  hintText: "Y",
                  onValidate: (value) {},
                  focusNode1: controller.focusNode[6],
                  focusNode2: controller.focusNode[7],
                  controller: controller.ageController[6],
                ),
                SpaceWidget(width: 3),
                AgeFieldWidget(
                  hintText: "Y",
                  onValidate: (value) {},
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
