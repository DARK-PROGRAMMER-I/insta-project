import 'package:flutter/foundation.dart';

class NavigationProvider with ChangeNotifier{
  int? _index = 0;
  int get index => index;

  selectedIndex(int indx){
    _index = indx;
    notifyListeners();
  }
}