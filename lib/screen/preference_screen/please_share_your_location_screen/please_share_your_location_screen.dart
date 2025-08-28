import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_icons.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/preference_screen/please_share_your_location_screen/controller/please_share_your_location_controller.dart';
import 'package:red_tangerine/widgets/Button_widget.dart';
import 'package:red_tangerine/widgets/auth_screen_widget.dart';
import 'package:red_tangerine/widgets/textformfield_widget.dart';

class PleaseShareYourLocationScreen extends StatefulWidget {
  const PleaseShareYourLocationScreen({super.key});

  @override
  State<PleaseShareYourLocationScreen> createState() =>
      _PleaseShareYourLocationScreenState();
}

class _PleaseShareYourLocationScreenState
    extends State<PleaseShareYourLocationScreen> {
  final _controller = Get.put(PleaseShareYourLocationController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.onInitital();
  }

  @override
  Widget build(BuildContext context) {
    return AuthScreenWidget(
      fromUpdate: _controller.fromUpdate.value,
      appbarTitle: AppStrings.location,
      title: AppStrings.pleaseShareYourLocation,
      subtitle: AppStrings.weCanHelpConnectWithParent,
      body: [
        TextformfieldWidget(
          controller: _controller.locationController,
          validator: (value) {},
          label: AppStrings.useMyCurrentLocation,
          suffixIcon: ButtonWidget.icon(
            icon: AppIcons.locationFixedIcon,
            ontap: () {},
          ),
        ),
      ],

      onTap: _controller.onNext,
      onUpdate: _controller.onUpdate,
    );
  }
}
