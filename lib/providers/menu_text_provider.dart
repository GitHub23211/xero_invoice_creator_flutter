import 'package:flutter/material.dart';

class MenuTextProvider extends ChangeNotifier {
  String text;
  MenuTextProvider({this.text = 'Welcome!'});

  void changeText(String newText) {
    text = newText;
    notifyListeners();
  }
}
