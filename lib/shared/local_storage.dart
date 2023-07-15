import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static Future<void> saveResponseObject(dynamic responseObject) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonString = jsonEncode(responseObject);
    await prefs.setString('response_object', jsonString);
  }

  static Future<dynamic> getResponseObject() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString('response_object');
    if (jsonString != null) {
      return jsonDecode(jsonString);
    }
    return null;
  }
}