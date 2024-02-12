// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Use this ``` NsAlertInfo("Information", "Messages to show"); ```
SnackbarController NsAlertInfo(String title, msg) {
  return Get.snackbar(title, msg,
      backgroundColor: Colors.purple.shade400,
      duration: const Duration(seconds: 3),
      colorText: Colors.white,
      icon: const Icon(
        Icons.warning,
        color: Colors.white,
      ),
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.BOTTOM);
}

/// Use this Example.<br/>
/// ```var resMsg = response.body == null ? response.statusText : response.body.message;```<br/>
/// ```NsAlertError("Process failed", resMsg);```
SnackbarController NsAlertError(String title, msg) {
  return Get.snackbar(title, msg,
      backgroundColor: Colors.red.shade400,
      duration: const Duration(seconds: 1),
      colorText: Colors.white,
      icon: const Icon(
        Icons.warning,
        color: Colors.white,
      ),
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.BOTTOM);
}
