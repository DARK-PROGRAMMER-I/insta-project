import 'package:flutter/foundation.dart';
import 'package:insta_project/controllers/auth_ctr/authentication.dart';
import '../../models/user_model.dart';

class UserProvider with ChangeNotifier{
  UserModel? _user = UserModel();
  UserModel? get user => _user;

  refreshUser()async{
    _user = await Auth().getUserData();
    notifyListeners();
    return _user;
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  loadingStatus(bool status){
    _isLoading = status;
    notifyListeners();
  }
}