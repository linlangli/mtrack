import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class StorageUtil {
  static void get(String key, Function(Map<String, dynamic>?) callback) {
    SharedPreferences.getInstance().then((SharedPreferences sharedPreferences) {
      String str = sharedPreferences.getString(key) ?? '';
      dynamic data = jsonDecode(str);
      callback(data);
    });
  }
  
  static void set(String key, dynamic data) {
    SharedPreferences.getInstance().then((SharedPreferences sharedPreferences) {
      if(data is String) {
        sharedPreferences.setString(key, data);
      } else {
        String str = jsonEncode(data);
        sharedPreferences.setString(key, jsonEncode(data));
      }
    });
  }
}