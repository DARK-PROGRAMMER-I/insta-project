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

class CommentStream{

  List<CommentModel> getComments(QuerySnapshot snapshot){
    return snapshot.docs.map((comment)=> CommentModel().fromJson(comment)).toList();
  }
  Stream<List<CommentModel>>get getCommens{
    FirebaseFirestore _store = FirebaseFirestore.instance;
    FirebaseAuth _auth = FirebaseAuth.instance;
    return _store.collection('userPosts').doc(_auth.currentUser?.uid).collection('comments').snapshots().map(getComments);
  }
}