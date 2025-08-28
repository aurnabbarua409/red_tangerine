import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/preference_screen/child_diagnosis_screen/controller/child_diagnosis_controller.dart';
import 'package:red_tangerine/widgets/auth_screen_widget.dart';
import 'package:red_tangerine/widgets/drop_down_button_form_field_widget.dart';
import 'package:red_tangerine/widgets/dropdown_multiselect_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';
import 'package:red_tangerine/widgets/text_widget.dart';

class ChildDiagnosisScreen extends StatefulWidget {
  const ChildDiagnosisScreen({super.key});

  @override
  State<ChildDiagnosisScreen> createState() => _ChildDiagnosisScreenState();
}

class _ChildDiagnosisScreenState extends State<ChildDiagnosisScreen> {
  final _controller = Get.put(ChildDiagnosisController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.onInitital();
  }

  List<String> selected = [];
  @override
  Widget build(BuildContext context) {
    return AuthScreenWidget(
      fromUpdate: _controller.fromUpdate.value,
      appbarTitle: AppStrings.diagnosis,
      title: AppStrings.tellUsAboutChildDiagnosis,
      subtitle: AppStrings.tellUsAboutChildDiagnosisDetails,

      body: [
        Align(
          alignment: Alignment.centerLeft,
          child: TextWidget.black(text: AppStrings.whatChildDiagnosis),
        ),
        SpaceWidget(height: 10),
        DropDownButtonFormFieldWidget(
          items: _controller.diagnosesByCategory.keys.toList(),
          onChanged: (value) {
            _controller.onSelectDiagnosis(value);
          },
        ),
        SpaceWidget(height: 20),
        Obx(
          () => DropdownMultiselectWidget(
            options: _controller.allDiagnosisType.value,
            selectedValues: _controller.selectedDiagnosisType,
            onChanged: (value) =>
                _controller.selectedDiagnosisType.value = value,
          ),
        ),

        SpaceWidget(height: 20),

        Align(
          alignment: Alignment.centerLeft,
          child: TextWidget.black(text: AppStrings.ifOtherTypeHere),
        ),
        TextFormField(controller: _controller.otherTextController),
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
