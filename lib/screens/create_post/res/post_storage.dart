import 'package:cloud_firestore/cloud_firestore.dart';


class PostStorage{
  FirebaseFirestore _store = FirebaseFirestore.instance;
  postThePost(Map<String, dynamic> data, String postId)async{
    try{
      _store.collection('userPosts').doc(postId).set(data);
      return true;
    }catch(e){
      print('error in post storage');
      print(e.toString());
      return false;
    }
  }
}