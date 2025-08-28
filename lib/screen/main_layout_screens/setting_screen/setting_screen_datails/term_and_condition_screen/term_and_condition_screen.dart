import 'package:flutter/material.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/main_layout_screens/profile_screen/profile_screen_datails/widgets/app_bar_widget.dart';
import 'package:red_tangerine/screen/main_layout_screens/setting_screen/setting_screen_datails/widget/setting_item_widget.dart';
import 'package:red_tangerine/widgets/app_background_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';

class TermAndConditionScreen extends StatelessWidget {
  const TermAndConditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackgroundWidget(
      padding: EdgeInsets.all(0),
      body: Column(
        children: [
          AppBarWidget(title: AppStrings.termCondition),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    SettingItemWidget(text: AppStrings.privacyPolicyPara1),
                    SpaceWidget(height: 20),
                    SettingItemWidget(text: AppStrings.privacyPolicyPara2),
                    SpaceWidget(height: 20),
                    SettingItemWidget(text: AppStrings.privacyPolicyPara3),
                    SpaceWidget(height: 20),
                    SettingItemWidget(text: AppStrings.privacyPolicyPara4),
                    SpaceWidget(height: 20),
                    SettingItemWidget(text: AppStrings.privacyPolicyPara5),
                    SpaceWidget(height: 20),
                    SettingItemWidget(text: AppStrings.privacyPolicyPara6),
                    SpaceWidget(height: 20),
                    SettingItemWidget(text: AppStrings.privacyPolicyPara7),
                    SpaceWidget(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
