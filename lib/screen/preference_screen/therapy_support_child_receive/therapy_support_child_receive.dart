import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/preference_screen/therapy_support_child_receive/controller/therapy_support_controller.dart';
import 'package:red_tangerine/widgets/Button_widget.dart';
import 'package:red_tangerine/widgets/auth_screen_widget.dart';
import 'package:red_tangerine/widgets/drop_down_button_form_field_widget.dart';
import 'package:red_tangerine/widgets/preference_header_important_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';
import 'package:red_tangerine/widgets/text_widget.dart';

class TherapySupportChildReceive extends StatelessWidget {
  const TherapySupportChildReceive({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: TherapySupportController(),
      builder: (controller) => AuthScreenWidget(
        title: AppStrings.whatTypeTherapySupportChildReceive,
        subtitle: AppStrings.selectAllThatApply,

        body: [
          DropDownButtonFormFieldWidget(items: [], onChanged: (value) {}),
          SpaceWidget(height: 20),
          DropDownButtonFormFieldWidget(items: [], onChanged: (value) {}),
          SpaceWidget(height: 10),
          Align(
            alignment: Alignment.centerLeft,
            child: TextWidget.black(text: AppStrings.ifOtherTypeHere),
          ),
          TextFormField(),
          SpaceWidget(height: 30),
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
