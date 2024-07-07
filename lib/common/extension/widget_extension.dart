import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Widget backgroundColor(Color color) {
    return Container(
      color: color,
      child: this,
    );
  }

  Widget translate(double dx, double dy) {
    return Transform.translate(
      offset: Offset(dx, dy), // 微调Y轴位置
      child: this,
    );
  }

  Widget button({
    GestureTapCallback? onTap,
    GestureTapCallback? onDoubleTap,
    GestureLongPressCallback? onLongTap,
    double? padding
  }) {
    return GestureDetector(
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      onLongPress: onLongTap,
      child: padding != null ? Container(
        padding: EdgeInsets.all(padding),
        color: Colors.transparent,
        child: this,
      ) : this
    );
  }

  Widget infinity() {
    return SizedBox(
      height: double.infinity,
      child: this,
    );
  }
}
