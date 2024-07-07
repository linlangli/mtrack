import 'package:flutter/material.dart';

class UiUtil {
  static BorderRadiusGeometry radiusOnly(
      double tl, double tr, double bl, double br) {
    return BorderRadius.only(
        topLeft: Radius.circular(tl),
        topRight: Radius.circular(tr),
        bottomLeft: Radius.circular(bl),
        bottomRight: Radius.circular(br));
  }

  static BorderRadiusGeometry radius(double radius) {
    return BorderRadius.all(Radius.circular(radius));
  }
}
