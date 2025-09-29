import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/constant/app_icons.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/preference_screen/add_profile_picture_screen/controller/add_profile_picture_controller.dart';
import 'package:red_tangerine/widgets/Button_widget.dart';
import 'package:red_tangerine/widgets/common_screen_widget.dart';
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
    return CommonScreenWidget(
      showLeading: true,
      showProgressbar: true,
      progress: 0.39,
      fromUpdate: _controller.fromUpdate.value,
      appbarTitle: AppStrings.photos,
      title: AppStrings.addPhotosTitle,
      subtitle: AppStrings.addPhotosSubtitle,
      body: [
        Obx(
          () => Container(
            width: 203,
            height: 239,
            decoration: BoxDecoration(
              color: AppColors.grey_50,
              borderRadius: BorderRadius.circular(10),
              image: _controller.image.value != null
                  ? DecorationImage(
                      image: FileImage(_controller.image.value!),
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
        ),

        SpaceWidget(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {},
              child: DottedBorder(
                options: RoundedRectDottedBorderOptions(
                  color: AppColors.grey_100,
                  radius: Radius.circular(10),
                  dashPattern: [8, 8],
                ),
                child: SizedBox(
                  width: 44,
                  height: 44,
                  child: Icon(Icons.add, color: AppColors.white_700),
                ),
              ),
            ),
            SpaceWidget(width: 9),
            InkWell(
              onTap: () {},
              child: DottedBorder(
                options: RoundedRectDottedBorderOptions(
                  color: AppColors.grey_100,
                  radius: Radius.circular(10),
                  dashPattern: [8, 8],
                ),
                child: SizedBox(
                  width: 44,
                  height: 44,
                  child: Icon(Icons.add, color: AppColors.white_700),
                ),
              ),
            ),
            SpaceWidget(width: 9),
            InkWell(
              onTap: () {},
              child: DottedBorder(
                options: RoundedRectDottedBorderOptions(
                  color: AppColors.grey_100,
                  radius: Radius.circular(10),
                  dashPattern: [8, 8],
                ),
                child: SizedBox(
                  width: 44,
                  height: 44,
                  child: Icon(Icons.add, color: AppColors.white_700),
                ),
              ),
            ),
            SpaceWidget(width: 9),
            InkWell(
              onTap: () {},
              child: DottedBorder(
                options: RoundedRectDottedBorderOptions(
                  color: AppColors.grey_100,
                  radius: Radius.circular(10),
                  dashPattern: [8, 8],
                ),
                child: SizedBox(
                  width: 44,
                  height: 44,
                  child: Icon(Icons.add, color: AppColors.white_700),
                ),
              ),
            ),
          ],
        ),
        SpaceWidget(height: 30),
        TextWidget(
          text: AppStrings.addMorePhotoLater,
          fontColor: AppColors.white_900,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        SpaceWidget(height: 15),
        Obx(() {
          if (_controller.imageList.isNotEmpty) {
            return SizedBox(
              height: 300, // give GridView a fixed height
              child: GridView.builder(
                itemCount: _controller.imageList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20.0,
                  crossAxisSpacing: 20.0,
                  childAspectRatio: 1.5,
                ),
                itemBuilder: (context, index) => GestureDetector(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.grey_50,
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: FileImage(_controller.imageList[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Container();
          }
        }),
      ],

      onTap: _controller.onNext,
      onUpdate: _controller.onUpdate,
    );
  }
}
