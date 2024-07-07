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
      expenses: json["expeexpensesnditure"],
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
  final String icon;
  final double money;
  final String name;
  final String desc;
  final BillType type;
  final String? tag;

  BillItem({
    required this.money,
    required this.name,
    required this.desc,
    required this.type,
    required this.icon,
    this.tag
  });


  factory BillItem.fromJson(Map<String, dynamic> json) => BillItem(
      money: json["money"],
      name: json["name"],
      desc: json["desc"],
      type: json["type"],
      icon: json["icon"],
      tag: json["tag"]
  );

  Map<String, dynamic> toJson() => {
    "money": money,
    "name": name,
    "desc": desc,
    "type": type,
    "icon": icon,
    "tag": tag
  };
}

enum BillType {
  cloth,
  catering,
  housing,
}