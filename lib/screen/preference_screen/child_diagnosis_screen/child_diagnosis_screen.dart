import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiselect/multiselect.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/preference_screen/child_diagnosis_screen/controller/child_diagnosis_controller.dart';
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
        title: AppStrings.tellUsAboutChildDiagnosis,
        subtitle: AppStrings.tellUsAboutChildDiagnosisDetails,

        body: [
          Align(
            alignment: Alignment.centerLeft,
            child: TextWidget.black(text: AppStrings.whatChildDiagnosis),
          ),
          SpaceWidget(height: 10),
          DropDownButtonFormFieldWidget(
            items: controller.diagnosesByCategory.keys.map((key) {
              return DropdownMenuItem(value: key, child: Text(key));
            }).toList(),
            onChanged: (value) {
              controller.onSelectDiagnosis(value);
            },
          ),
          SpaceWidget(height: 20),
          DropDownMultiSelect(
            options: controller.allDiagnosisType,
            selectedValues: controller.selectedDiagnosisType,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: AppColors.grey_900),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: AppColors.grey_900),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: AppColors.grey_900),
              ),
            ),

            onChanged: (value) {
              if (value.isNotEmpty) {
                controller.onSelectedDiagonisType(value);
              }
            },
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
        onTap: controller.onNext,
      ),
    );
  }
}
