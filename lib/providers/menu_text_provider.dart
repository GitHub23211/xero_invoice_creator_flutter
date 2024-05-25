import 'package:flutter/material.dart';

class MenuTextProvider extends ChangeNotifier {
  String text;
  MenuTextProvider({this.text = 'test'});

  void changeText(String newText) {
    text = newText;
    notifyListeners();
  }
}
