import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/constant/app_icons.dart';
import 'package:red_tangerine/constant/app_images.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/main_layout_screens/profile_screen/profile_screen_datails/widgets/app_bar_widget.dart';
import 'package:red_tangerine/widgets/Button_widget.dart';
import 'package:red_tangerine/widgets/richtext_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';
import 'package:red_tangerine/widgets/text_widget.dart';

class CommonScreenWidget extends StatelessWidget {
  CommonScreenWidget({
    super.key,
    required this.body,
    this.footer,
    this.showLeading = false,
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
    this.fromUpdate = false,
    this.onUpdate,
    this.appbarTitle,
    this.progress = 1,
    this.showProgressbar = false,
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
  final bool fromUpdate;
  String? appbarTitle;
  final void Function()? onTapShowSkip;
  final void Function()? onTap;
  final void Function()? onTapSign;
  void Function()? onUpdate;
  final double progress;
  final bool showProgressbar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: fromUpdate ? 0 : 20),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (showLeading && !fromUpdate)
                        Align(
                          alignment: Alignment.centerLeft,
                          child: ButtonWidget.icon(
                            icon: AppIcons.arrowLeft,
                            height: 24,
                            width: 24,
                            ontap: () => Get.back(),
                          ),
                        ),
                      if (fromUpdate) AppBarWidget(title: appbarTitle!),
                      if (showProgressbar) ...[
                        SizedBox(height: 10),
                        Stack(
                          children: [
                            Container(
                              height: 30,
                              width:
                                  MediaQuery.of(context).size.width -
                                  (MediaQuery.of(context).size.width *
                                      progress),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                gradient: LinearGradient(
                                  colors: [
                                    AppColors.orange,
                                    AppColors.orangeLight,
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 30,

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(color: AppColors.claySolid),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 30,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextWidget.white(text: 'Child'),
                                    Container(
                                      height: 30,
                                      width: 1,
                                      color: AppColors.claySolid,
                                    ),
                                    TextWidget.white(text: 'You'),
                                    Container(
                                      height: 30,
                                      width: 1,
                                      color: AppColors.claySolid,
                                    ),
                                    TextWidget.white(text: 'Profile'),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                      ],
                      Expanded(
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: fromUpdate ? 20 : 0,
                            ),
                            child: Form(
                              key: formKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (title != null)
                                    TextWidget.header(text: title!),
                                  SpaceWidget(height: 10),
                                  if (subtitle != null)
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 40,
                                      ),
                                      child: TextWidget.blackLight(
                                        text: subtitle!,
                                      ),
                                    ),
                                  SpaceWidget(height: 20),
                                  ...body,
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      if (footerTextTitle != null && footerTextSubtitle != null)
                        Center(
                          child: RichtextWidget(
                            title: footerTextTitle!,
                            buttonTitle: footerTextSubtitle!,
                            fontColor: AppColors.grey_900,

                            ontap: onTapSign!,
                          ),
                        ),
                      if (onTap != null && !fromUpdate)
                        ButtonWidget(
                          text: footerButtonText ?? AppStrings.continue_,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          ontap: onTap!,
                        ),
                      if (fromUpdate)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ButtonWidget.normal(
                            margin: EdgeInsets.all(0),
                            textColor: AppColors.white,
                            backgroundColor: AppColors.orange,
                            borderColor: AppColors.orange,
                            text: AppStrings.update,
                            height: 50,
                            ontap: onUpdate!,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
