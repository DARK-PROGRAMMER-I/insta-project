import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:insta_project/resources/storage_methods.dart';
import '../../models/user_model.dart';


class Auth{
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore fire_store = FirebaseFirestore.instance;

  StorageMethod method = StorageMethod();

  UserModel _getUserData(DocumentSnapshot snapshot){
    return UserModel().fromJson(snapshot);
  }

  Stream<UserModel> get userData {
    FirebaseFirestore fire_store = FirebaseFirestore.instance;
    return fire_store.collection('user').
    doc(FirebaseAuth.instance.currentUser?.uid).snapshots()
        .map(_getUserData);
  }

  String? getUserId(){
    return _auth.currentUser?.uid;
  }

  Future<bool> signUp({required String name, required String email, required String pass,required String bio, required File file})async{

    try{
      UserCredential creds =
      await _auth.createUserWithEmailAndPassword(email: email, password: pass);
      User? user = creds.user;
      String? imgUrl =
      await StorageMethod().uploadImagetoStorage('profilePics', file, false);
      // print(imgUrl);

      UserModel model = UserModel(
        imgUrl: imgUrl,
        folowing:[],
        followers:[],
        uid: user!.uid,
        bio: bio,
        email: email,
        name: name,
      );

      await fire_store.collection('user').doc(creds.user!.uid).set(model.toJson(),); // SetOptions(merge: true)
      userData;
      print('Success');
      return true;
    }catch(e){
      print(e.toString());
      print('Error');
    }
    return false;
  }

  Future<bool> signIn({required String email, required String pass})async{
    try{
      UserCredential creds  = await _auth.signInWithEmailAndPassword(email: email, password: pass);
      userData;
      return true;
    }catch(e){
      print(e.toString());
      return false;
    }
  }
}