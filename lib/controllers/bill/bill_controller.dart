import 'package:get/get.dart';
import 'package:mtrack/common/util/debug_util.dart';
import 'package:mtrack/common/util/log_util.dart';
import 'package:mtrack/common/util/time_util.dart';
import 'package:mtrack/constants/app_string.dart';
import 'package:mtrack/models/bill_model.dart';

enum BookkeepingType {
  income,
  expenses
}

class BillController extends GetxController {
  Bill? bill;
  String money = '0.0';
  BookkeepingType bookkeepingType = BookkeepingType.expenses;
  BillType type = BillType.cloth;
  String date = TimeUtil.getNowDate();
  String desc = '';
  String tag = '';


  void loadBillList() {
    bill = DebugUtil.buildBill(50, 40, 10);
    update();
  }

  void setMoney(String money) {
    this.money = money;
    update([AppString.bookkeepingModalGetBuilderId]);
  }

  void setMoneyType(BookkeepingType bookkeepingType) {
    this.bookkeepingType = bookkeepingType;
    update([AppString.bookkeepingModalGetBuilderId]);
  }

  void bookkeeping() {
    bill?.billPerDayList.forEach((billPerDay) {
      LogUtil.log('BillController', 'billPerDay.date: ${billPerDay.date}, date: $date');
      if(billPerDay.date == date) {
        billPerDay.billItemList.add(BillItem(money: double.parse(money), desc: desc, type: type, tag: 0xFFFFB33C));
        LogUtil.log('BillController', 'billItemList.len: ${billPerDay.billItemList.length}');
      }
    });
    update();
  }
}