import 'package:get/get.dart';
import 'package:mtrack/common/util/debug_util.dart';
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
  BillType? billType;


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

  void addBill() {

  }
}