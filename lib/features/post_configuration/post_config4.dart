import 'package:flutter/material.dart';

class PostConfig4 extends ChangeNotifier {
  bool egg = false;

  ToggleEgg() {
    egg = !egg;
    notifyListeners();
  }
}
