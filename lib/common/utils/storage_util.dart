import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageUtil {
  static final Map<String, Box> _boxStore = <String, Box>{};

  static void sGet(String key, Function(Map<String, dynamic>?) callback) {
    SharedPreferences.getInstance().then((SharedPreferences sharedPreferences) {
      String str = sharedPreferences.getString(key) ?? '';
      dynamic data = jsonDecode(str);
      callback(data);
    });
  }
  
  static void sSet(String key, dynamic data) {
    SharedPreferences.getInstance().then((SharedPreferences sharedPreferences) {
      if(data is String) {
        sharedPreferences.setString(key, data);
      } else {
        sharedPreferences.setString(key, jsonEncode(data));
      }
    });
  }

  static String? hGet(String name, String key, String value) {
    Box? box = _boxStore[name];
    if(box == null) {
      return null;
    }
    return box.get(key);
  }

  static void hSet<T>(String name, String key, String value) async {
    Box? box = _boxStore[name];
    if(box == null) {
      box = await Hive.openBox<T>(name);
      _boxStore[name] = box;
    }
    box.put(key, value);
  }
}