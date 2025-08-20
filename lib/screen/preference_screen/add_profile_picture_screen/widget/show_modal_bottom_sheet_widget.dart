import 'package:flutter/material.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/widgets/text_widget.dart';

class ShowModalBottomSheetWidget extends StatelessWidget {
  const ShowModalBottomSheetWidget({
    super.key,
    required this.onTakePhoto,
    required this.onChooseFromGallery,
  });
  final void Function() onTakePhoto;
  final void Function() onChooseFromGallery;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.camera_alt_outlined),
              title: Align(
                alignment: Alignment.centerLeft,
                child: TextWidget.blackLight(text: AppStrings.takePhoto),
              ),
              onTap: () {
                onTakePhoto();
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.image),
              title: Align(
                alignment: Alignment.centerLeft,
                child: TextWidget.blackLight(
                  text: AppStrings.chooseFromGallery,
                ),
              ),
              onTap: () {
                onChooseFromGallery();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
