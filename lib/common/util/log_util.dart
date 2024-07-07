import 'package:flutter/material.dart';

class LogUtil {
  static void log(String tag, String message, { bool isDebug = true }) {
    if (isDebug) {
      debugPrint('🚀 TAG: $tag | MESSAGE: $message');
    } else {
      print('🚀 TAG: $tag | MESSAGE: $message');
    }
  }
}