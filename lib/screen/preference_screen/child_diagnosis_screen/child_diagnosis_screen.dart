import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/preference_screen/child_diagnosis_screen/controller/child_diagnosis_controller.dart';
import 'package:red_tangerine/widgets/Button_widget.dart';
import 'package:red_tangerine/widgets/auth_screen_widget.dart';
import 'package:red_tangerine/widgets/drop_down_button_form_field_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';
import 'package:red_tangerine/widgets/text_widget.dart';

class ChildDiagnosisScreen extends StatelessWidget {
  const ChildDiagnosisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ChildDiagnosisController(),
      builder: (controller) => AuthScreenWidget(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidget.header(text: AppStrings.tellUsAboutChildDiagnosis),
            SpaceWidget(height: 10),
            TextWidget.blackLight(
              text: AppStrings.tellUsAboutChildDiagnosisDetails,
            ),
            SpaceWidget(height: 40),
            Align(
              alignment: Alignment.centerLeft,
              child: TextWidget.black(text: AppStrings.whatChildDiagnosis),
            ),
            SpaceWidget(height: 10),
            DropDownButtonFormFieldWidget(
              items: controller.diagnosesByCategory.entries.map((entry) {
                return DropdownMenuItem(
                  value: entry.key,
                  child: Text(entry.key.toString()),
                );
              }).toList(),
              onChanged: (value) {},
            ),
            SpaceWidget(height: 20),
            DropDownButtonFormFieldWidget(
              items: controller.diagnosesByCategory.entries.map((entry) {
                return DropdownMenuItem(
                  value: entry.key,
                  child: Text(entry.key.toString()),
                );
              }).toList(),
              onChanged: (value) {},
            ),
            SpaceWidget(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: TextWidget.black(text: AppStrings.ifOtherTypeHere),
            ),
            TextFormField(),
            SpaceWidget(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Obx(
                    () => Transform.scale(
                      alignment: Alignment.centerLeft,
                      scale: 0.8,
                      child: Checkbox.adaptive(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        value: controller.isWaiting.value,
                        onChanged: (value) {
                          controller.onIsWaiting();
                        },
                      ),
                    ),
                  ),
                  TextWidget.black(
                    text: AppStrings.weAreStillWaitingOnDiagnosis,
                    fontSize: 0.25,
                  ),
                ],
              ),
            ),
          ],
        ),
        footer: ButtonWidget(text: AppStrings.next, ontap: controller.onNext),
      ),
    );
  }
}
