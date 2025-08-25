import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/main_layout_screens/profile_screen/profile_screen_datails/edit_child_age_screen/controller/edit_child_age_controller.dart';
import 'package:red_tangerine/screen/main_layout_screens/profile_screen/profile_screen_datails/widgets/app_bar_widget.dart';
import 'package:red_tangerine/screen/main_layout_screens/profile_screen/profile_screen_datails/widgets/footer_button_widget.dart';
import 'package:red_tangerine/utils/app_validator.dart';
import 'package:red_tangerine/widgets/app_background_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';
import 'package:red_tangerine/widgets/text_widget.dart';
import 'package:red_tangerine/widgets/textformfield_widget.dart';

class EditChildAgeScreen extends StatelessWidget {
  const EditChildAgeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackgroundWidget(
      padding: EdgeInsets.all(0),
      body: GetBuilder(
        init: EditChildAgeController(),
        builder: (controller) => Column(
          children: [
            AppBarWidget(title: AppStrings.childAge),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  TextWidget.header(text: AppStrings.howOldYourChild),
                  SpaceWidget(height: 15),
                  TextWidget.blackLight(
                    text: AppStrings.howOldYourChildDetails,
                  ),
                  SpaceWidget(height: 30),
                  TextformfieldWidget(
                    controller: controller.dateOfBirthController,
                    validator: (value) => AppValidator.defaultvalidator(
                      value: value,
                      message: AppStrings.pleaseEnterChildDateOfBirth,
                    ),
                    label: AppStrings.enterChildDateOfBirth,
                  ),
                ],
              ),
            ),
            Spacer(),
            FooterButtonWidget(onTap: () {}),
          ],
        ),
      ),
    );
  }
}
