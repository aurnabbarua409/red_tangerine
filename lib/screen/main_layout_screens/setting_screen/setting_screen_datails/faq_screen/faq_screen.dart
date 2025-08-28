import 'package:flutter/material.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/main_layout_screens/profile_screen/profile_screen_datails/widgets/app_bar_widget.dart';
import 'package:red_tangerine/screen/main_layout_screens/setting_screen/setting_screen_datails/widget/setting_item_widget.dart';
import 'package:red_tangerine/widgets/app_background_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackgroundWidget(
      padding: EdgeInsets.all(0),
      body: Column(
        children: [
          AppBarWidget(title: AppStrings.faq),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SettingItemWidget(text: AppStrings.faqQuestion1),
                    SettingItemWidget(text: AppStrings.faqAnswer1),
                    SpaceWidget(height: 20),
                    SettingItemWidget(text: AppStrings.faqQuestion2),
                    SettingItemWidget(text: AppStrings.faqAnswer2),
                    SpaceWidget(height: 20),
                    SettingItemWidget(text: AppStrings.faqQuestion3),
                    SettingItemWidget(text: AppStrings.faqAnswer3),
                    SpaceWidget(height: 20),
                    SettingItemWidget(text: AppStrings.faqQuestion4),
                    SettingItemWidget(text: AppStrings.faqAnswer4),
                    SpaceWidget(height: 20),
                    SettingItemWidget(text: AppStrings.faqQuestion5),
                    SettingItemWidget(text: AppStrings.faqAnswer5),
                    SpaceWidget(height: 20),
                    SettingItemWidget(text: AppStrings.faqQuestion6),
                    SettingItemWidget(text: AppStrings.faqAnswer6),
                    SpaceWidget(height: 20),
                    SettingItemWidget(text: AppStrings.faqQuestion7),
                    SettingItemWidget(text: AppStrings.faqAnswer7),
                    SpaceWidget(height: 20),
                    SettingItemWidget(text: AppStrings.faqQuestion8),
                    SettingItemWidget(text: AppStrings.faqAnswer8),
                    SpaceWidget(height: 20),
                    SettingItemWidget(text: AppStrings.faqQuestion9),
                    SettingItemWidget(text: AppStrings.faqAnswer9),
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
