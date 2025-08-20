import 'package:flutter/material.dart';
import 'package:red_tangerine/constant/app_icons.dart';
import 'package:red_tangerine/widgets/Button_widget.dart';
import 'package:red_tangerine/widgets/app_background_widget.dart';
import 'package:red_tangerine/widgets/icon_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';

class MainLayoutScreen extends StatelessWidget {
  const MainLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackgroundWidget(
      body: Column(
        children: [
          Row(
            children: [
              IconWidget.custom(
                icon: AppIcons.splashIcon,
                width: 20,
                height: 5,
              ),
              Spacer(),
              ButtonWidget.icon(icon: AppIcons.notificationIcon, ontap: () {}),
              SpaceWidget(width: 10),
              ButtonWidget.icon(icon: AppIcons.settingIcon, ontap: () {}),
            ],
          ),
        ],
      ),
    );
  }
}
