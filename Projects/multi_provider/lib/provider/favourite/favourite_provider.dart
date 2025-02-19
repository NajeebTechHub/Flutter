import 'package:flutter/cupertino.dart';

class favouriteProvider extends ChangeNotifier{

  List<int> _selectedItem = [];
  List<int> get selectedItem => _selectedItem;

  void addItem(int value){
    selectedItem.add(value);
    notifyListeners();
  }

  void removeItem(int value){
    selectedItem.remove(value);
    notifyListeners();
  }

  void removeItemAt(int value){
    selectedItem.removeAt(value);
    notifyListeners();
  }

 }