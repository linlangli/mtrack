import 'package:flutter/material.dart';
import 'package:mtrack/common/extension/widget_extension.dart';
import 'package:mtrack/common/utils/device_util.dart';
import 'package:mtrack/common/utils/ui_util.dart';
import 'package:mtrack/constants/theme_color.dart';
import 'package:mtrack/controllers/bill/bill_controller.dart';
import 'package:get/get.dart';

class TagModal extends Dialog {
  TagModal({super.key});

  final controller = Get.find<BillController>();

  Widget tagWidget(BuildContext context, Color color) {
    return Container(
      width: 18,
      height: 18,
      decoration: BoxDecoration(borderRadius: UiUtil.radius(6), color: color),
    ).button(onTap: () {
      controller.setTag(color);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 64),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: ThemeColor.onThirdlyContainer.withOpacity(0.4), // 阴影的颜色和透明度
              spreadRadius: 5, // 阴影扩散的半径
              blurRadius: 7, // 阴影模糊的半径
              offset: const Offset(3, 3), // 阴影偏移的距离
            ),
          ],
          color: ThemeColor.onSecondaryContainer,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        width: DeviceUtil.deviceWidthScale(context, 1),
        height: DeviceUtil.deviceHeightScale(context, 0.2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                tagWidget(context, controller.tagList[0]),
                tagWidget(context, controller.tagList[1]),
                tagWidget(context, controller.tagList[2])
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                tagWidget(context, controller.tagList[3]),
                tagWidget(context, controller.tagList[4]),
                tagWidget(context, controller.tagList[5]),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                tagWidget(context, controller.tagList[6]),
                tagWidget(context, controller.tagList[7]),
                tagWidget(context, controller.tagList[8]),
              ],
            ),
          ],
        )
      ),
    );
  }
}