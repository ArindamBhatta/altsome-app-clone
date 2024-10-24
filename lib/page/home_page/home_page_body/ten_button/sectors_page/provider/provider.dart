import 'package:flutter/material.dart';
// import 'package:home_page/model/model_three.dart';
// import '../../../../../repo/repo.dart';

class ToggleProvider extends ChangeNotifier {
  int? unfoldedCardIndex;

  void toggleVisibility(int index) {
    if (unfoldedCardIndex == index) {
      unfoldedCardIndex = null;
    } else {
      unfoldedCardIndex = index;
    }
    notifyListeners();
  }
}
