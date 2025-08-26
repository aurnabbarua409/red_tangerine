import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/main_layout_screens/profile_screen/profile_screen_datails/widgets/app_bar_widget.dart';
import 'package:red_tangerine/screen/main_layout_screens/setting_screen/setting_screen_datails/report_screen/controller/report_controller.dart';
import 'package:red_tangerine/utils/app_validator.dart';
import 'package:red_tangerine/widgets/Button_widget.dart';
import 'package:red_tangerine/widgets/app_background_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';
import 'package:red_tangerine/widgets/textformfield_widget.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackgroundWidget(
      padding: EdgeInsets.all(0),
      body: Column(
        children: [
          AppBarWidget(title: AppStrings.report),
          Padding(
            padding: EdgeInsets.all(20),
            child: GetBuilder(
              init: ReportController(),
              builder: (controller) => Column(
                children: [
                  TextformfieldWidget(
                    controller: controller.reportTextController,
                    validator: (value) => AppValidator.defaultvalidator(
                      value: value,
                      message: AppStrings.pleaseEnterSomething,
                    ),
                    label: AppStrings.somethingNotRight,
                    maxlines: 10,
                  ),
                  SpaceWidget(height: 20),
                  ButtonWidget(text: AppStrings.sendReport, ontap: () {}),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
