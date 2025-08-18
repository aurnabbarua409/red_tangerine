import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_icons.dart';
import 'package:red_tangerine/widgets/Button_widget.dart';
import 'package:red_tangerine/widgets/app_background_widget.dart';

class AuthScreenWidget extends StatelessWidget {
  const AuthScreenWidget({
    super.key,
    required this.body,
    this.footer,
    this.showLeading = true,
  });
  final Widget body;
  final Widget? footer;
  final bool showLeading;
  @override
  Widget build(BuildContext context) {
    return AppBackgroundWidget(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showLeading)
            ButtonWidget.icon(
              icon: AppIcons.arrowLeft,
              ontap: () => Get.back(),
            ),
          Expanded(child: Center(child: body)),
          if (footer != null) Center(child: footer),
        ],
      ),
    );
  }
}
