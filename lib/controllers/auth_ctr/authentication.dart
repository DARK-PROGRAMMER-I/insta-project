import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Auth{
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _store = FirebaseFirestore.instance;


  Future<bool> signUp({required String name, required String email, required String pass,required String bio})async{
    String response = 'Error signing-up';
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
      response = e.toString();
      print(response);
    }
    print(response);
    return false;
  }


}