import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:red_tangerine/constant/app_images.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/routes/route_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MainAppEntry extends StatelessWidget {
  const MainAppEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return GetMaterialApp(
          themeMode: ThemeMode.light,
          theme: ThemeData(
            brightness: Brightness.light,
            scaffoldBackgroundColor: Colors.white,
          ),
          title: AppStrings.appName,
          debugShowCheckedModeBanner: false,
          initialRoute: RouteManager.initial,
          builder: (context, child) => Container(
            decoration: BoxDecoration(
              color: Colors.white,
              // image: DecorationImage(
              //   image: AssetImage(AppImages.backgroundImage),
              //   fit: BoxFit.cover,
              // ),
            ),
            child: child,
          ),
          getPages: RouteManager.getPages(),
        );
      },
    );
  }
}
