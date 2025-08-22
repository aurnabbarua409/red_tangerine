import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/constant/app_icons.dart';
import 'package:red_tangerine/constant/app_images.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/widgets/Button_widget.dart';
import 'package:red_tangerine/widgets/richtext_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';
import 'package:red_tangerine/widgets/text_widget.dart';

class AuthScreenWidget extends StatelessWidget {
  const AuthScreenWidget({
    super.key,
    required this.body,
    this.footer,
    this.showLeading = true,
    this.showSkip = false,
    this.onTapShowSkip,
    this.footerButtonText,
    this.footerTextSubtitle,
    this.footerTextTitle,
    this.onTap,
    this.title,
    this.subtitle,
    this.formKey,
    this.onTapSign,
  });
  final List<Widget> body;
  final Widget? footer;
  final String? footerTextTitle;
  final String? footerTextSubtitle;
  final String? footerButtonText;
  final bool showLeading;
  final bool showSkip;
  final String? title;
  final String? subtitle;
  final GlobalKey? formKey;
  final void Function()? onTapShowSkip;
  final void Function()? onTap;
  final void Function()? onTapSign;
  @override
  Widget build(BuildContext context) {
    if (true) {
      return Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(AppImages.backgroundImage, fit: BoxFit.cover),
            ),

            SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: IntrinsicHeight(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            if (showLeading)
                              Align(
                                alignment: Alignment.centerLeft,
                                child: ButtonWidget.icon(
                                  icon: AppIcons.arrowLeft,
                                  height: 24,
                                  width: 24,
                                  ontap: () => Get.back(),
                                ),
                              ),

                            Expanded(
                              child: Center(
                                child: Form(
                                  key: formKey,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      if (title != null)
                                        TextWidget.header(text: title!),
                                      if (subtitle != null)
                                        TextWidget.blackLight(text: subtitle!),
                                      SpaceWidget(height: 20),
                                      ...body,
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            if (footerTextTitle != null &&
                                footerTextSubtitle != null)
                              Center(
                                child: RichtextWidget(
                                  title: footerTextTitle!,
                                  buttonTitle: footerTextSubtitle!,
                                  fontColor: AppColors.grey_900,
                                  ontap: onTapSign!,
                                ),
                              ),
                            if (onTap != null)
                              ButtonWidget(
                                text: footerButtonText ?? AppStrings.next,
                                ontap: onTap!,
                              ),
                          ],
                        ),
                      ),
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
}
