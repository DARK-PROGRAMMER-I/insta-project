import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class PostProvider with ChangeNotifier{
  AssetPathEntity? _selected;
  AssetPathEntity? get selected => _selected;
  getSelected(AssetPathEntity select){
    _selected = select;
    notifyListeners();
    return select;
  }
}