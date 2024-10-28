import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginAuthProvider extends ChangeNotifier {
  //* properties
  String? userAccessToken;

  //* methods
  void setUserAccessToken(String accessToken) async {
    userAccessToken = accessToken;
    if (userAccessToken != null) {
      print("set user Access Token is: $userAccessToken");
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('userAccessToken', userAccessToken!);
    }
    notifyListeners();
  }

  void getUserAccessToken() async {
    SharedPreferences.getInstance().then((prefs) {
      userAccessToken = prefs.getString('userAccessToken');
      notifyListeners();
    });
  }

  void removeUserAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('userAccessToken');
    notifyListeners();
  }
}
