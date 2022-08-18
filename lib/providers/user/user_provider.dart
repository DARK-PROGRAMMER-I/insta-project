import 'package:flutter/foundation.dart';
import 'package:insta_project/controllers/auth_ctr/authentication.dart';
import '../../models/user_model.dart';

class UserProvider with ChangeNotifier{
  UserModel? _user;
  UserModel? get user => _user;

  // Future<void> refreshUser()async{
  //   _user = await Auth().getUserData();
  //   notifyListeners();
  // }
}