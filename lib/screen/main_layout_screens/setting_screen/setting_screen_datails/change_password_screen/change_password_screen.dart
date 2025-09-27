import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/main_layout_screens/profile_screen/profile_screen_datails/widgets/app_bar_widget.dart';
import 'package:red_tangerine/screen/main_layout_screens/profile_screen/profile_screen_datails/widgets/footer_button_widget.dart';
import 'package:red_tangerine/screen/main_layout_screens/setting_screen/setting_screen_datails/change_password_screen/controller/change_password_controller.dart';
import 'package:red_tangerine/utils/app_validator.dart';
import 'package:red_tangerine/widgets/app_background_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';
import 'package:red_tangerine/widgets/textformfield_widget.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ChangePasswordController(),
      builder: (controller) {
        return AppBackgroundWidget(
          padding: EdgeInsets.all(0),
          body: Column(
            children: [
              AppBarWidget(title: AppStrings.changePassword),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextformfieldWidget(
                      obscureText: !controller.isVisibleCurrent.value,
                      controller: controller.currentPasswordController,
                      validator: (value) =>
                          AppValidator.passwordValidator(value),
                      label: AppStrings.currentPassword,
                      // hintText: AppStrings.writeYourPassword,
                      suffixIcon: IconButton(
                        onPressed: controller.onClickIsVisibleCurrent,
                        icon: Icon(
                          color: AppColors.white_700,
                          controller.isVisibleCurrent.value
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                      ),
                    ),
                    SpaceWidget(height: 15),
                    TextformfieldWidget(
                      obscureText: !controller.isVisibleNew.value,
                      controller: controller.setPasswordController,
                      validator: (value) =>
                          AppValidator.passwordValidator(value),
                      label: AppStrings.newPassword,
                      // hintText: AppStrings.writeYourPassword,
                      suffixIcon: IconButton(
                        onPressed: controller.onClickIsVisibleNew,
                        icon: Icon(
                          color: AppColors.white_700,
                          controller.isVisibleNew.value
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                      ),
                    ),
                    SpaceWidget(height: 15),
                    TextformfieldWidget(
                      obscureText: !controller.isVisibleConfirm.value,
                      controller: controller.confirmPasswordController,
                      validator: (value) =>
                          AppValidator.passwordValidator(value),
                      label: AppStrings.confirmPassword,
                      // hintText: AppStrings.writeYourPassword,
                      suffixIcon: IconButton(
                        onPressed: controller.onClickIsVisibleConfirm,
                        icon: Icon(
                          color: AppColors.white_700,
                          controller.isVisibleConfirm.value
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                      ),
                    ),
                    SpaceWidget(height: 30),
                    FooterButtonWidget(
                      margin: EdgeInsets.symmetric(horizontal: 0),
                      onTap: controller.onUpdate,
                      isLightRedBackground: true,
                      height: 56,
                      fontSize: 16,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
