import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtrack/common/utils/debug_util.dart';
import 'package:mtrack/common/utils/time_util.dart';
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
  List<Color> tagList = [Colors.red, Colors.lightGreen, Colors.green, Colors.blue, Colors.lightBlue, Colors.yellow, Colors.orange, Colors.pink, Colors.grey];
  Color tag = Colors.orange;


  void loadBillList() {
    bill = DebugUtil.buildBill(50, 40, 10);
    update();
  }

  void setMoney(String money) {
    if(this.money == '0.0' || money == '0.0') {
      this.money = money;
    } else {
      this.money = '${this.money}$money';
    }
    update([AppString.bookkeepingModalGetBuilderId]);
  }

  void backMoney() {
    if(money == '0.0') {
      return;
    }
    money = money.substring(0, money.length - 1);
    if(money == '') {
      money = '0.0';
    }
    update([AppString.bookkeepingModalGetBuilderId]);
  }

  void setTag(Color tag) {
    this.tag = tag;
    update([AppString.bookkeepingModalGetBuilderId]);
  }

  void seType(BookkeepingType bookkeepingType) {
    this.bookkeepingType = bookkeepingType;
    update([AppString.bookkeepingModalGetBuilderId]);
  }

  void setDesc(String desc) {
    this.desc = desc;
  }

  void bookkeeping() {
    bill?.billPerDayList.forEach((billPerDay) {
      if(billPerDay.date == date) {
        billPerDay.billItemList.add(BillItem(money: double.parse(money), desc: desc, type: type, tag: tag.value));
      }
    });
    update([AppString.billPageGetBuilderId, AppString.bookkeepingModalGetBuilderId]);
  }

  String getType(BillType type) {
    String name = '';
    switch(type) {
      case BillType.catering:
        name = AppString.billTypeCatering;
        break;
      case BillType.cloth:
        name = AppString.billTypeCloth;
        break;
      case BillType.housing:
        name = AppString.billTypeHouse;
        break;
    }
    return name;
  }

  void reset() {
    desc = '';
    date = TimeUtil.getNowDate();
    tag = Colors.orange;
    type = BillType.cloth;
    money = '0.0';
    bookkeepingType = BookkeepingType.expenses;
    update([AppString.bookkeepingModalGetBuilderId]);
  }
}