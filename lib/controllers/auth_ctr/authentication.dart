import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Auth{
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _store = FirebaseFirestore.instance;


  Future<bool> signUp({required String name, required String email, required String pass,required String bio})async{

    try{
      UserCredential creds = await _auth.createUserWithEmailAndPassword(email: email, password: pass);

      // For storing other info in database
      _store.collection('user').doc(creds.user!.uid).set({
        'name': name,
        'email': email,
        'bio': bio,
        'uid': creds.user!.uid,
        'followers' : [],
        'following' : []
      });
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
      return false;
    }
  }


}