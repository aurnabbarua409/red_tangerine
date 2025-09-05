import 'package:flutter/material.dart';
import 'package:red_tangerine/widgets/custom_calendar_picker.dart';

class AppCommonFunctions {
  static Future<String> onClickedCalender(BuildContext context) async {
    var now = DateTime.now().toString();
    await showDialog(
      context: context,
      builder: (context) {
        return CustomCalendarPicker(onSelect: (data) => now = data);
      },
    );
    return now.toString();
  }
}
