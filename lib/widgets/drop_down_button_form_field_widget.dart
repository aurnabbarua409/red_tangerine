import 'package:flutter/material.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/widgets/text_widget.dart';

class DropDownButtonFormFieldWidget extends StatelessWidget {
  const DropDownButtonFormFieldWidget({
    super.key,
    required this.items,
    this.initialValue,
    required this.onChanged,
  });
  final List<String> items;
  final String? initialValue;
  final void Function(dynamic value) onChanged;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: initialValue,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: AppColors.grey_900),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey_900),
          borderRadius: BorderRadius.circular(25),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: AppColors.grey_900),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: AppColors.grey_900),
        ),
      ),
      items: [
        for (int i = 0; i < items.length; i++)
          DropdownMenuItem(
            value: items[i],
            child: TextWidget.black(text: items[i]),
          ),
      ],
      onChanged: (value) {
        if (value != null) {
          onChanged(value.toString());
        }
      },
    );
  }
}
