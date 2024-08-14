import 'package:flutter/material.dart';

class CounterModel extends ChangeNotifier {
  int _counter = 0;
double _value=10;
  int get counter => _counter;
  double  get valuess =>_value;

  void increment() {
    _counter++;
    notifyListeners(); // Notify all listeners that the state has changed
  }
   void dicrement() {
    _counter--;
    notifyListeners(); // Notify all listeners that the state has changed
  }

    void slider(double value) {
    _value=value;
    notifyListeners(); // Notify all listeners that the state has changed
  }
}