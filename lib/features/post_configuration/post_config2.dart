import 'package:flutter/material.dart';

class PostConfig2 extends ChangeNotifier {
  bool egg2 = true;

  void toggleEgg() {
    egg2 = !egg2;
    notifyListeners(); // 듣고 있는 모든 value를 전부 바꿔줌
  }
}

final postConfig2 = PostConfig2();
