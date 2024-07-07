import 'dart:convert';

class Bill {
  final double expenses;
  final List<BillPerDay> billPerDayList;
  final double income;
  final double balance;

  Bill({
    required this.billPerDayList,
    required this.balance,
    required this.income,
    required this.expenses
  });


  factory Bill.fromJson(Map<String, dynamic> json) {
    List<dynamic> billPerDay = jsonDecode(json["billPerDayList"]);
    List<BillPerDay> billPerDayList = [];
    for (var item in billPerDay) {
      billPerDayList.add(BillPerDay.fromJson(item));
    }
    return Bill(
      billPerDayList: json["billPerDayList"],
      balance: json["balance"],
      income: json["income"],
      expenses: json["expenses"],
    );
  }

  Map<String, dynamic> toJson() => {
    "billPerDayList": billPerDayList,
    "balance": balance,
    "income": income,
    "expenses": expenses
  };
}

class BillPerDay {
  final String date;
  final List<BillItem> billItemList;

  BillPerDay({
    required this.billItemList,
    required this.date,
  });

  factory BillPerDay.fromJson(Map<String, dynamic> json) {
    List<dynamic> billItems = jsonDecode(json["billItemList"]);
    List<BillItem> billItemList = [];
    for (var billItem in billItems) {
      billItemList.add(BillItem.fromJson(billItem));
    }
    return BillPerDay(
      billItemList: billItemList,
      date: json["date"],
    );
  }

  Map<String, dynamic> toJson() => {
    "billItemList": billItemList,
    "date": date,
  };
}

class BillItem {
  final double money;
  final String desc;
  final BillType type;
  final int? tag;

  BillItem({
    required this.money,
    required this.desc,
    required this.type,
    required this.tag
  });


  factory BillItem.fromJson(Map<String, dynamic> json) => BillItem(
      money: json["money"],
      desc: json["desc"],
      type: json["type"],
      tag: json["tag"]
  );

  Map<String, dynamic> toJson() => {
    "money": money,
    "desc": desc,
    "type": type,
    "tag": tag
  };
}

enum BillType {
  cloth,
  catering,
  housing,
}