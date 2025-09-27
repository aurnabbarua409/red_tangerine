import 'package:flutter/material.dart';
import 'package:red_tangerine/widgets/space_widget.dart';
import 'package:red_tangerine/widgets/text_widget.dart';

class BulletTextWidget extends StatelessWidget {
  const BulletTextWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.circle, size: 8),
        SpaceWidget(width: 10),
        Expanded(
          child: TextWidget.black(
            text: text,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}
