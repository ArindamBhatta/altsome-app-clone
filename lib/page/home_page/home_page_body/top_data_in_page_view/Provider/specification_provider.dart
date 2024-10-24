import 'package:flutter/material.dart';

class SpecificationProvider extends ChangeNotifier {
  int? unfoldedCardIndex;

  var storeLocalData = {
    "tt": 0,
    "tg": 0,
    "tr": 0,
    "tl": 0,
    "rt": 0,
  };

  void cardState(int index) {
    if (unfoldedCardIndex == index) {
      unfoldedCardIndex = null;
    } else {
      unfoldedCardIndex = index;
      storeLocalData["tt"] = index;
      storeLocalData["tg"] = index;
      storeLocalData["tr"] = index;
      storeLocalData["tl"] = index;
      storeLocalData["rt"] = index;
    }
    notifyListeners();
  }
}
