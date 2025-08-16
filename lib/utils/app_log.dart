import 'dart:developer';

import 'package:flutter/foundation.dart';

void appLogger({required String title, required String message}) {
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
