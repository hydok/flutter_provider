import 'package:flutter/material.dart';
import 'package:http/http.dart';

class CountProvider extends ChangeNotifier {

  int _count = 0;
  int get count => _count;


  void plus(){
    _count++;
    notifyListeners();
  }

  void minus(){
    _count--;
    notifyListeners();
  }




}
