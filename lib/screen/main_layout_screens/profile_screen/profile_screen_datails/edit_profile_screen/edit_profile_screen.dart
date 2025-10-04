import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/main_layout_screens/profile_screen/profile_screen_datails/widgets/footer_button_widget.dart';
import 'package:red_tangerine/screen/main_layout_screens/profile_screen/profile_screen_datails/edit_profile_screen/controller/edit_profile_controller.dart';
import 'package:red_tangerine/screen/main_layout_screens/profile_screen/profile_screen_datails/widgets/app_bar_widget.dart';
import 'package:red_tangerine/screen/preference_screen/child_age_screen/controller/child_age_controller.dart';
import 'package:red_tangerine/screen/preference_screen/child_age_screen/widget/age_field_widget.dart';
import 'package:red_tangerine/utils/app_validator.dart';
import 'package:red_tangerine/widgets/app_background_widget.dart';
import 'package:red_tangerine/widgets/calender_icon_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';
import 'package:red_tangerine/widgets/text_widget.dart';
import 'package:red_tangerine/widgets/textformfield_widget.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackgroundWidget(
      padding: EdgeInsets.all(0),
      body: GetBuilder(
        init: EditProfileController(),
        builder: (controller) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBarWidget(title: AppStrings.editProfile),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Form(
                key: controller.formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget.black(
                        text: AppStrings.profileInformation,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                      SpaceWidget(height: 30),
                      TextformfieldWidget(
                        controller: controller.firstNameController,
                        validator: (value) => AppValidator.defaultvalidator(
                          value: value,
                          message: AppStrings.pleaseWriteYourFirstName,
                        ),
                        label: AppStrings.firstName,
                      ),
                      // SpaceWidget(height: 20),
                      // TextformfieldWidget(
                      //   controller: controller.lastnameController,
                      //   validator: (value) => AppValidator.defaultvalidator(
                      //     value: value,
                      //     message: AppStrings.pleaseWriteYourLastName,
                      //   ),
                      //   label: AppStrings.lastName,
                      // ),
                      SpaceWidget(height: 20),

                      // TextformfieldWidget(
                      //   controller: controller.dateOfBirthController,
                      //   validator: (value) => AppValidator.defaultvalidator(
                      //     value: value,
                      //     message: AppStrings.dateofBirth,
                      //   ),
                      //   label: AppStrings.dateofBirth,
                      //   suffixIcon: CalenderIconWidget(
                      //     onPressed: () =>
                      //         controller.onClickedCalender(context),
                      //   ),
                      // ),
                      TextWidget(
                        text: AppStrings.dateofBirth,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      // SpaceWidget(height: 8),
                      SizedBox(
                        height: 60,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              controller.ageController.length,
                              (index) => AgeFieldWidget(
                                hintText: controller.getHintText(index),
                                focusNode: controller.focusNode,
                                index: index,
                                onChange: () {},
                                controller: controller.ageController[index],
                              ),
                            ),
                          ),
                        ),
                      ),

                      // SpaceWidget(height: 20),
                      // TextformfieldWidget(
                      //   controller: controller.emailController,
                      //   validator: (value) => AppValidator.defaultvalidator(
                      //     value: value,
                      //     message: AppStrings.pleaseEnterEmailAddress,
                      //   ),
                      //   label: AppStrings.email,
                      // ),
                    ],
                  ),
                ),
              ),
            ),
            Spacer(),
            FooterButtonWidget(
              onTap: controller.onUpdate,
              isLightRedBackground: true,
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
