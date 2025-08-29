import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/main_layout_screens/profile_screen/profile_screen_datails/widgets/app_bar_widget.dart';
import 'package:red_tangerine/screen/main_layout_screens/profile_screen/profile_screen_datails/widgets/footer_button_widget.dart';
import 'package:red_tangerine/screen/main_layout_screens/setting_screen/setting_screen_datails/change_password_screen/controller/change_password_controller.dart';
import 'package:red_tangerine/utils/app_validator.dart';
import 'package:red_tangerine/widgets/app_background_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';
import 'package:red_tangerine/widgets/textformfield_widget.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackgroundWidget(
      padding: EdgeInsets.all(0),
      body: GetBuilder(
        init: ChangePasswordController(),
        builder: (controller) => Column(
          children: [
            AppBarWidget(title: AppStrings.changePassword),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  TextformfieldWidget(
                    controller: controller.currentPasswordController,
                    validator: (value) => AppValidator.passwordValidator(value),
                    label: AppStrings.currentPassword,
                    hintText: AppStrings.writeYourPassword,
                  ),
                  SpaceWidget(height: 15),
                  TextformfieldWidget(
                    controller: controller.setPasswordController,
                    validator: (value) => AppValidator.passwordValidator(value),
                    label: AppStrings.setPassword,
                    hintText: AppStrings.writeYourPassword,
                  ),
                  SpaceWidget(height: 15),
                  TextformfieldWidget(
                    controller: controller.confirmPasswordController,
                    validator: (value) => AppValidator.passwordValidator(value),
                    label: AppStrings.confirmPassword,
                    hintText: AppStrings.writeYourPassword,
                  ),
                  SpaceWidget(height: 30),
                  FooterButtonWidget(
                    margin: EdgeInsets.symmetric(horizontal: 0),
                    onTap: controller.onUpdate,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
