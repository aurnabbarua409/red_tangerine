import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/constant/app_icons.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/preference_screen/add_profile_picture_screen/controller/add_profile_picture_controller.dart';
import 'package:red_tangerine/widgets/Button_widget.dart';
import 'package:red_tangerine/widgets/auth_screen_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';
import 'package:red_tangerine/widgets/text_widget.dart';

class AddProfilePictureScreen extends StatefulWidget {
  const AddProfilePictureScreen({super.key});

  @override
  State<AddProfilePictureScreen> createState() =>
      _AddProfilePictureScreenState();
}

class _AddProfilePictureScreenState extends State<AddProfilePictureScreen> {
  final _controller = Get.put(AddProfilePictureController());

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
      appbarTitle: AppStrings.photos,
      title: AppStrings.addProfilePicture,
      subtitle: AppStrings.makeProfileFeelPersonal,
      body: [
        Container(
          width: 200,
          height: 240,
          decoration: BoxDecoration(
            color: AppColors.grey_50,
            borderRadius: BorderRadius.circular(20),
            image: _controller.image != null
                ? DecorationImage(
                    image: FileImage(_controller.image!),
                    fit: BoxFit.cover,
                  )
                : null,
          ),

          child: ButtonWidget.icon(
            icon: AppIcons.cameraIcon,
            ontap: () {
              _controller.onClickCamera(context);
            },
          ),
        ),
        SpaceWidget(height: 30),
        TextWidget(
          text: AppStrings.addMorePhotoLater,
          fontColor: AppColors.white_900,
          fontSize: 0.25,
        ),
        SpaceWidget(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DottedBorder(
              options: RoundedRectDottedBorderOptions(
                color: AppColors.grey_100,
                radius: Radius.circular(15),
                dashPattern: [8, 8],
              ),
              child: SizedBox(
                width: 60,
                height: 60,
                child: Icon(Icons.add, color: AppColors.grey_100),
              ),
            ),
            SpaceWidget(width: 15),
            TextWidget(
              text: AppStrings.addMorePhoto,
              fontSize: 0.278,
              fontColor: AppColors.white_700,
            ),
          ],
        ),
      ],

      onTap: _controller.onNext,
      onUpdate: _controller.onUpdate,
    );
  }
}
