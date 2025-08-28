import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/preference_screen/child_age_screen/controller/child_age_controller.dart';
import 'package:red_tangerine/utils/app_validator.dart';
import 'package:red_tangerine/widgets/auth_screen_widget.dart';
import 'package:red_tangerine/widgets/calender_icon_widget.dart';
import 'package:red_tangerine/widgets/textformfield_widget.dart';

class ChildAgeScreen extends StatefulWidget {
  const ChildAgeScreen({super.key});

  @override
  State<ChildAgeScreen> createState() => _ChildAgeScreenState();
}

class _ChildAgeScreenState extends State<ChildAgeScreen> {
  final _controller = Get.put(ChildAgeController());
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
      appbarTitle: AppStrings.childAge,
      title: AppStrings.howOldYourChild,
      subtitle: AppStrings.howOldYourChildDetails,
      formKey: _controller.formKey,
      body: [
        TextformfieldWidget(
          controller: _controller.dateOfBirthController,
          validator: (value) => AppValidator.defaultvalidator(
            value: value,
            message: AppStrings.pleaseEnterChildDateOfBirth,
          ),
          label: AppStrings.enterChildDateOfBirth,
          suffixIcon: CalenderIconWidget(
            onPressed: () => _controller.onClickedCalender(context),
          ),
        ),
      ],

      onUpdate: _controller.onUpdate,
      onTap: _controller.onNext,
    );
  }
}
