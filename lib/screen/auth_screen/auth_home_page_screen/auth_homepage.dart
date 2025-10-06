import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_icons.dart';
import 'package:red_tangerine/constant/app_images.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/routes/app_routes.dart';
import 'package:red_tangerine/widgets/Button_widget.dart';
import 'package:red_tangerine/widgets/image_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';
import 'package:red_tangerine/widgets/text_widget.dart';

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
                  fit: BoxFit.contain,
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color.fromARGB(0, 0, 0, 0),
                    Color.fromARGB(50, 0, 0, 0),
                    Color.fromARGB(221, 0, 0, 0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 30,
                      left: 50,
                      right: 50,
                    ),
                    child: TextWidget.white(
                      text: AppStrings.authHomePageTitle,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  ButtonWidget(
                    text: AppStrings.createAccount,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    ontap: () {
                      Get.offAllNamed(AppRoutes.signupScreen);
                    },
                  ),
                  SpaceWidget(height: 20),
                  ButtonWidget(
                    text: AppStrings.login,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    ontap: () {
                      Get.offAllNamed(AppRoutes.loginScreen);
                    },
                  ),
                  // RichtextWidget(
                  //   title: AppStrings.alreadyHavaAccount,
                  //   buttonTitle: AppStrings.signin,
                  //   ontap: () {
                  //     Get.toNamed(AppRoutes.signinScreen);
                  //   },
                  // ),
                  SpaceWidget(height: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
