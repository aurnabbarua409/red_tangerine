import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_icons.dart';
import 'package:red_tangerine/constant/app_images.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/routes/app_routes.dart';
import 'package:red_tangerine/widgets/Button_widget.dart';
import 'package:red_tangerine/widgets/image_widget.dart';
import 'package:red_tangerine/widgets/richtext_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';

class AuthHomepage extends StatelessWidget {
  const AuthHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // height: double.infinity,
        // width: double.infinity,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ImageWidget(fromNetwork: false, image: AppImages.familyImage),
            Column(
              children: [
                SpaceWidget(height: 150),
                ImageWidget(
                  fromNetwork: false,
                  image: AppIcons.splashIcon,
                  height: 12,
                  width: 29,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ButtonWidget(
                  text: AppStrings.register,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  ontap: () {
                    Get.toNamed(AppRoutes.signupScreen);
                  },
                ),
                SpaceWidget(height: 20),
                RichtextWidget(
                  title: AppStrings.alreadyHavaAccount,
                  buttonTitle: AppStrings.signin,
                  ontap: () {
                    Get.toNamed(AppRoutes.signinScreen);
                  },
                ),
                SpaceWidget(height: 50),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
