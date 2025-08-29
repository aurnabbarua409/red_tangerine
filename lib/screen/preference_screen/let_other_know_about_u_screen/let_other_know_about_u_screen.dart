import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/preference_screen/let_other_know_about_u_screen/controller/let_other_know_about_u_controller.dart';
import 'package:red_tangerine/utils/app_validator.dart';
import 'package:red_tangerine/widgets/common_screen_widget.dart';
import 'package:red_tangerine/widgets/textformfield_widget.dart';

class LetOtherKnowAboutUScreen extends StatefulWidget {
  const LetOtherKnowAboutUScreen({super.key});

  @override
  State<LetOtherKnowAboutUScreen> createState() =>
      _LetOtherKnowAboutUScreenState();
}

class _LetOtherKnowAboutUScreenState extends State<LetOtherKnowAboutUScreen> {
  final _controller = Get.put(LetOtherKnowAboutUController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.onInitital();
  }

  @override
  Widget build(BuildContext context) {
    return CommonScreenWidget(
      fromUpdate: _controller.fromUpdate.value,
      appbarTitle: AppStrings.yourBio,
      showSkip: true,
      onTapShowSkip: () => _controller.onNext(),
      title: AppStrings.letOtherKnowAboutYou,
      subtitle: AppStrings.shortIntroHelpsOther,
      body: [
        TextformfieldWidget(
          controller: _controller.textEditingController,
          validator: (value) => AppValidator.defaultvalidator(
            value: value,
            message: AppStrings.pleaseEnterSomething,
          ),
          label: '',
          maxlines: 5,
          borderRadius: 10,
        ),
      ],

      onTap: _controller.onNext,
      onUpdate: _controller.onUpdate,
    );
  }
}
