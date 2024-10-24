import 'package:flutter/material.dart';

class SpecificationProvider extends ChangeNotifier {
  Map<String, int?> storeCardIndex = {
    "tt": null,
    "tg": null,
    "tr": null,
    "tl": null,
    "rt": null,
  };

  void cardState(int index, String cardSpecificKey) {
    if (storeCardIndex[cardSpecificKey] == index) {
      storeCardIndex[cardSpecificKey] = null;
    } else {
      storeCardIndex[cardSpecificKey] = index;
    }
    notifyListeners();
  }

  void reset() {
    storeCardIndex = {};
    notifyListeners();
  }
}
