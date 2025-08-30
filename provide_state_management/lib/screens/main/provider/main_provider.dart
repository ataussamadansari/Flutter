import 'package:flutter/material.dart';

class MainProvider with ChangeNotifier {
  int count = 0;

  void increment() {
    count++;
    notifyListeners();
  }
}