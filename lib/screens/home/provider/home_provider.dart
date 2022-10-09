// part of '../inside_home.dart';
import 'package:flutter/foundation.dart';

class HomeProvider with ChangeNotifier{
  bool? _liked = false;
  bool? get liked => _liked;
  getLikedStatus(bool? status){
    _liked = status;
    print(status);
    notifyListeners();
  }

  bool _isLikeAniamtion = false;
  bool get isLikeAniamtion => _isLikeAniamtion;
  getLikeAnimationStatus(bool status){
    _isLikeAniamtion = status;
    notifyListeners();
  }
}