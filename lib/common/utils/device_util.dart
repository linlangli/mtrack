import 'package:flutter/cupertino.dart';

class DeviceUtil {
  static double deviceWidthScale(BuildContext context, double scale) {
    return MediaQuery.of(context).size.width * (scale);
  }

  static double deviceHeightScale(BuildContext context, double scale) {
    return MediaQuery.of(context).size.height * (scale);
  }
}