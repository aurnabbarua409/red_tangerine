import 'package:flutter/material.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/constant/app_images.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/main_layout_screens/profile_screen/profile_screen_datails/widgets/app_bar_widget.dart';
import 'package:red_tangerine/widgets/Button_widget.dart';
import 'package:red_tangerine/widgets/app_background_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';
import 'package:red_tangerine/widgets/text_widget.dart';

class BlockedUserScreen extends StatelessWidget {
  const BlockedUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackgroundWidget(
      padding: EdgeInsets.all(0),
      body: Column(
        children: [
          AppBarWidget(title: AppStrings.blockedUser),

          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(
                          AppDevImages.chatSampleImage1,
                        ),
                      ),
                      SpaceWidget(width: 10),
                      TextWidget.black(
                        text: 'Jenny Dawson',
                        fontSize: 0.27,
                        fontColor: AppColors.grey_500,
                      ),
                      Spacer(),
                      ButtonWidget.normal(
                        margin: EdgeInsets.all(0),
                        text: AppStrings.unblock,
                        width: 30,
                        backgroundColor: AppColors.green_900,
                        textColor: AppColors.white,
                        borderColor: AppColors.green_900,
                        ontap: () {},
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
