import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

enum CacheProperty { fearAndGreed, sectors }

Map<CacheProperty, String> _cacheProperties = {
  CacheProperty.fearAndGreed: 'cachingFirstApi',
  CacheProperty.sectors: 'cachingSectorsApi'
};

void cachingFirstData(CacheProperty key, Map<String, dynamic>? jsonData) async {
  print("store data in local storage");
  try {
    if (jsonData != null) {
      String encodedJson = jsonEncode(jsonData);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(_cacheProperties[key]!, encodedJson);
    }
  } catch (error) {
    print(error);
  }
}

Future<Map<String, dynamic>?> getCachingFirstData(CacheProperty key) async {
  print("get data from local storage");
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? data = prefs.getString(_cacheProperties[key]!);
  try {
    if (data != null) {
      Map<String, dynamic> jsonData = jsonDecode(data);
      return jsonData;
    }
  } catch (error) {
    print(error);
  }
  return null;
}
