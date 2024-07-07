import 'package:flutter/material.dart';
import 'package:mtrack/constants/theme_color.dart';

class ThemeFont {
  static TextStyle titlePrimary({double fontSize = 14, Color fontColor = ThemeColor.onPrimary}) {
    return TextStyle(fontSize: fontSize, color: fontColor, fontWeight: FontWeight.bold);
  }

  static TextStyle titleSecondary({double fontSize = 16, Color fontColor = ThemeColor.onPrimary}) {
    return TextStyle(fontSize: fontSize, color: fontColor, fontWeight: FontWeight.bold);
  }

  static TextStyle titleThirdly({double fontSize = 18, Color fontColor = ThemeColor.onPrimary}) {
    return TextStyle(fontSize: fontSize, color: fontColor, fontWeight: FontWeight.bold);
  }

  static TextStyle labelPrimary({double fontSize = 11, Color fontColor = ThemeColor.onPrimary}) {
    return TextStyle(fontSize: fontSize, color: fontColor.withOpacity(0.3), fontWeight: FontWeight.normal);
  }

  static TextStyle labelSecondary({double fontSize = 12, Color fontColor = ThemeColor.onPrimary}) {
    return TextStyle(fontSize: fontSize, color: fontColor.withOpacity(0.3), fontWeight: FontWeight.normal);
  }

  static TextStyle bodyPrimary({double fontSize = 12, Color fontColor = ThemeColor.onPrimary}) {
    return TextStyle(fontSize: fontSize, color: fontColor, fontWeight: FontWeight.normal);
  }

  static TextStyle bodySecondary({double fontSize = 13, Color fontColor = ThemeColor.onPrimary}) {
    return TextStyle(fontSize: fontSize, color: fontColor, fontWeight: FontWeight.normal);
  }

  static TextStyle bodyThirdly({double fontSize = 14, Color fontColor = ThemeColor.onPrimary}) {
    return TextStyle(fontSize: fontSize, color: fontColor, fontWeight: FontWeight.normal);
  }

  static TextStyle warmPrimary({double fontSize = 12, Color fontColor = ThemeColor.onPrimary}) {
    return TextStyle(fontSize: fontSize, color: fontColor, fontWeight: FontWeight.bold);
  }

  static TextStyle warmSecondary({double fontSize = 13, Color fontColor = ThemeColor.onPrimary}) {
    return TextStyle(fontSize: fontSize, color: fontColor, fontWeight: FontWeight.bold);
  }

  static TextStyle warmThirdly({double fontSize = 14, Color fontColor = ThemeColor.onThirdly}) {
    return TextStyle(fontSize: fontSize, color: fontColor, fontWeight: FontWeight.bold);
  }
}