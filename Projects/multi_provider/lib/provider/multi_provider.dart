import 'package:flutter/cupertino.dart';

class multiProvider extends ChangeNotifier{

  double  _value1 = 1.0;
  double get value1 => _value1;

  double _value = 0.0;
  double get value => _value;

  void setValue(double val){
    _value = val;
    _value1 = 1.0;
    _value1 = _value1 - val;
    notifyListeners();
  }
}