part of '../create_post_screen.dart';
class PostStreams{

  List<PostModel> getUserPosts(QuerySnapshot snapshot){
    return snapshot.docs.map((post)=> PostModel().fromJson(post)).toList();
  }
  Stream<List<PostModel>>get getPosts{
    FirebaseFirestore _store = FirebaseFirestore.instance;
    return _store.collection('userPosts').snapshots().map(getUserPosts);
  }
}