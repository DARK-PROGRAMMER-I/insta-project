import 'package:flutter/foundation.dart';
import 'package:insta_project/controllers/auth_ctr/authentication.dart';
import '../../models/user_model.dart';

class UserProvider with ChangeNotifier{
  UserModel? _user = UserModel();
  UserModel? get user => _user;

  String?  _name;
  String?  _email;
  String?  _bio;
  String?  _uid;
  List?  _followers;
  List?  _folowing;
  String ? _imgUrl;

  String?  get name => _name ;
  String?  get email => _email ;
  String?  get bio => _bio ;
  String? get  uid => _uid ;
  List?  get followers => _followers ;
  List? get  folowing => _folowing ;
  String ? get imgUrl => _imgUrl ;


  refreshUser()async{
    _user = await Auth().getUserData();
    _name = _user?.name;
    _email = _user?.email;
    _bio = _user?.bio;
    _uid = _user?.uid;
    _followers = _user?.followers;
    _folowing = _user?.folowing;
    _imgUrl = _user?.imgUrl;
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