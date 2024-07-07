import 'package:intl/intl.dart';

class TimeUtil {
  static String getNowDate({String format = 'yyyy-MM-dd'}) {
    var now = DateTime.now();
    var formatter = DateFormat(format);
    return formatter.format(now);
  }
}