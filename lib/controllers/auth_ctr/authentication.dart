import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:insta_project/resources/storage_methods.dart';


class Auth{
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _store = FirebaseFirestore.instance;
  FirebaseStorage _storage = FirebaseStorage.instance;
  StorageMethod method = StorageMethod();


  Future<bool> signUp({required String name, required String email, required String pass,required String bio, required Uint8List file})async{

    try{
      UserCredential creds = await _auth.createUserWithEmailAndPassword(email: email, password: pass);
      // Store Image to Firebase Storage
      String imgUrl = await method.uploadImagetoStorage('profilePics', file, false);
      // For storing other info in database
      await _store.collection('user').doc(creds.user!.uid).set({
        'name': name ?? '',
        'email': email ?? '',
        'bio': bio ?? '',
        'uid': creds.user!.uid ?? '',
        'followers' : [],
        'following' : [],
        'imgUrl': imgUrl ?? '',
      });

      await _storage.ref('profile/}').putData(file);
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