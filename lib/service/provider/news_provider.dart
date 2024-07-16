import 'package:flutter/material.dart';


class NewsProvider extends ChangeNotifier {
    
  bool isButtonPressed = false;

  void isBookMarked() {
    isButtonPressed = !isButtonPressed;
    notifyListeners();
  }
}
