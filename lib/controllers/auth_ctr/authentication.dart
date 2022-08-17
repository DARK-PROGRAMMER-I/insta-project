import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:insta_project/resources/storage_methods.dart';
import '../../models/user_model.dart';


class Auth{
  FirebaseAuth _auth = FirebaseAuth.instance;
  CollectionReference _storeRef = FirebaseFirestore.instance.collection('user');

  StorageMethod method = StorageMethod();

  Future<UserModel> getUserData()async{
    String uid = await FirebaseAuth.instance.currentUser!.uid;
    DocumentSnapshot snap =await _storeRef.doc(uid).get();
    return UserModel().fromJson(snap);
  }


  Future<bool> signUp({required String name, required String email, required String pass,required String bio, required Uint8List file})async{
    try{
      UserCredential creds = await _auth.createUserWithEmailAndPassword(email: email, password: pass);
      // Store Image to Firebase Storage
      String imgUrl = await method.uploadImagetoStorage('profilePics', file, false);
      print(imgUrl);
      // For storing other info in database
      await _storeRef.doc(creds.user!.uid).set(
          UserModel(
            name: name,
            email: email,
            bio: bio,
            uid: creds.user!.uid,
            followers: [],
            folowing: [],
            imgUrl: imgUrl,
          ).toJson()
      );
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
      return true;
    }catch(e){
      print(e.toString());
      return false;
    }
  }
}