import 'package:flutter/material.dart';
import 'package:mtrack/models/bill_model.dart';

class DebugUtil {
  static Bill buildBill(double balance, double income, double expenditure) {
    BillItem billItem = BillItem(money: 10, desc: '豆腐饼', tag: Colors.orange.value, type: BillType.catering);
    BillItem billItem2 = BillItem(money: 100, desc: '茶叶蛋，面包', tag: Colors.orange.value, type: BillType.catering);
    BillPerDay billPerDay = BillPerDay(billItemList: [billItem, billItem2], date: '2024-01-10');
    BillPerDay billPerDay2= BillPerDay(billItemList: [billItem], date: '2024-07-11');
    Bill bill = Bill(billPerDayList: [billPerDay, billPerDay2], balance: balance, income: income, expenses: 10);
    return bill;
  }
}