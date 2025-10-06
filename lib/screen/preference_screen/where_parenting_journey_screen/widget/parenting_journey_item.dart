import 'package:flutter/material.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/utils/responsive_size.dart';
import 'package:red_tangerine/widgets/space_widget.dart';

class ParentingJourneyItem extends StatelessWidget {
  const ParentingJourneyItem({
    super.key,

    required this.ontap,
    required this.isParenting,
    required this.text,
    required this.icon,
  });
  final void Function() ontap;
  final bool isParenting;
  final String text;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: ResponsiveSize.width(60),
        height: 75,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isParenting ? AppColors.orangeLight : AppColors.transparent,
          border: Border.all(
            color: isParenting ? AppColors.orangeLight : AppColors.white_700,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Text(icon, style: TextStyle(fontSize: 20,        fontFamily: 'Manrope',)),
            SpaceWidget(width: 10),
            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: AppColors.grey_700,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,        fontFamily: 'Manrope',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
