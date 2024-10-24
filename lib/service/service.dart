import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class Service {
  static Future<Map<String, dynamic>?> accessFirstData() async {
    String url1 = 'https://cp.altsome.com/api/web-home?sys_id=1';

    try {
      final response = await http.post(Uri.parse(url1));

      if (response.statusCode == 200) {
        print('Successfully loaded first API data JSON');
        Map<String, dynamic> data1 = json.decode(response.body);
        return data1;
      } else {
        print('Failed to load data1. Status code: ${response.statusCode}');
        return null;
      }
    } catch (error) {
      print('Error occurred while loading first API data: $error');
      return null;
    }
  }

  static Future<Map<String, dynamic>?> accessSecondData() async {
    String url2 =
        'https://cp.altsome.com/api/web-home-coins?sys_id=1&currency=usd';

    try {
      final response = await http.post(Uri.parse(url2));

      if (response.statusCode == 200) {
        print('Successfully loaded second API data JSON');
        Map<String, dynamic> data2 = json.decode(response.body);
        return data2;
      } else {
        print('Failed to load data2. Status code: ${response.statusCode}');
        return null;
      }
    } catch (error) {
      print('Error occurred while loading second API data: $error');
      return null;
    }
  }

  static Future<Map<String, dynamic>?> accessSectorsData() async {
    String url3 = 'https://cp.altsome.com/api/web-sectors?sys_id=1';
    try {
      final response = await http.post(Uri.parse(url3));
      if (response.statusCode == 200) {
        // print('Successfully loaded Sectors API data JSON');
        Map<String, dynamic> data3 = json.decode(response.body);
        return data3;
      } else {
        print('Failed to load Sectors. Status code: ${response.statusCode}');
        return null;
      }
    } catch (error) {
      print('Error occurred while loading second API data: $error');
      return null;
    }
  }
}
