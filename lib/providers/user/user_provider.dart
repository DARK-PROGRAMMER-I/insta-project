import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import '../../models/user_model.dart';

class UserProvider with ChangeNotifier{



  bool _isLoading = false;
  bool get isLoading => _isLoading;
  loadingStatus(bool status){
    _isLoading = status;
    notifyListeners();
  }
}