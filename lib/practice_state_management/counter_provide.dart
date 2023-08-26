import 'package:flutter/cupertino.dart';

class CounterProvide extends ChangeNotifier {
  int _number = 0;

  int get counter => _number;

  void decrease() {
    _number--;
    notifyListeners();
  }

  void incres() {
    _number++;
    notifyListeners();
  }
}
