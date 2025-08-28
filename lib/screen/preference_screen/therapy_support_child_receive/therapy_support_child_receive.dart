import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiselect/multiselect.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/preference_screen/therapy_support_child_receive/controller/therapy_support_controller.dart';
import 'package:red_tangerine/widgets/auth_screen_widget.dart';
import 'package:red_tangerine/widgets/drop_down_button_form_field_widget.dart';
import 'package:red_tangerine/widgets/dropdown_multiselect_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';
import 'package:red_tangerine/widgets/text_widget.dart';

class TherapySupportChildReceive extends StatefulWidget {
  const TherapySupportChildReceive({super.key});

  @override
  State<TherapySupportChildReceive> createState() =>
      _TherapySupportChildReceiveState();
}

class _TherapySupportChildReceiveState
    extends State<TherapySupportChildReceive> {
  final _controller = Get.put(TherapySupportController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.onInitital();
  }

  @override
  Widget build(BuildContext context) {
    return AuthScreenWidget(
      fromUpdate: _controller.fromUpdate.value,
      appbarTitle: AppStrings.therapy,
      title: AppStrings.whatTypeTherapySupportChildReceive,
      subtitle: AppStrings.selectAllThatApply,

      body: [
        DropDownButtonFormFieldWidget(
          items: _controller.therapyByCategory.keys.toList(),
          onChanged: (value) {
            _controller.onSelectTherapy(value);
          },
        ),
        SpaceWidget(height: 20),
        Obx(
          () => DropdownMultiselectWidget(
            options: _controller.allTherapyType.value,
            selectedValues: _controller.selectedTherapyType,
            onChanged: (value) => _controller.selectedTherapyType.value = value,
          ),
        ),
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
                    value: _controller.isWaiting.value,
                    onChanged: (value) {
                      _controller.onIsWaiting();
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

      onTap: _controller.onNext,
      onUpdate: _controller.onUpdate,
    );
  }
}
