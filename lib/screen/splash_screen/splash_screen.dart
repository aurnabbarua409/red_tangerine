import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_icons.dart';
import 'package:red_tangerine/screen/splash_screen/controller/splash_controller.dart';
import 'package:red_tangerine/widgets/icon_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        init: SplashController(),
        builder: (controller) =>
            Center(child: IconWidget(icon: AppIcons.splashIcon)),
      ),
    );
  }
}
