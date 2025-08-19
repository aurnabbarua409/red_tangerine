import 'dart:developer';

import 'package:flutter/foundation.dart';

Future<void> appLogger({
  required String title,
  required dynamic message,
}) async {
  if (kDebugMode) {
    log(
      "=========================================$title ======================================",
    );
    log(message);
    log(
      "====================================End============================================",
    );
  }
}
