import 'package:mtrack/models/bill_model.dart';

class DebugUtil {
  static Bill buildBill(double balance, double income, double expenditure) {
    BillItem billItem = BillItem(money: 10, name: '早餐', desc: '茶叶蛋，面包', icon: '', type: BillType.cloth);
    BillItem billItem2 = BillItem(money: 10, name: '晚餐', desc: '米饭', type:  BillType.cloth, icon: '');
    BillPerDay billPerDay = BillPerDay(billItemList: [billItem, billItem2], date: '2024-01-10');
    BillPerDay billPerDay2= BillPerDay(billItemList: [billItem], date: '2024-01-11');
    Bill bill = Bill(billPerDayList: [billPerDay, billPerDay2], balance: balance, income: income, expenses: 10);
    return bill;
  }
}