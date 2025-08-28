import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppCommonFunctions {
  static Future<String> onClickedCalender(BuildContext context) async {
    final now = DateTime.now();
    final DateTime? pickedDate = await showDatePicker(
      initialDate: now,
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime(3000),
    );
    if (pickedDate != null) {
      return DateFormat('yyyy-MM-dd').format(pickedDate);
    }
    return "";
  }
}
