import 'package:firebase_auth/firebase_auth.dart';

class Auth{
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> signUp({required String name, required String email, required String pass,required String bio,})async{
    String response = 'Error signing-up';
    try{


    }catch(e){
      response = e.toString();
    }
    return response;
  }


}