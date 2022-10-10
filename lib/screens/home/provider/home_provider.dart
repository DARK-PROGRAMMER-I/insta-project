import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:insta_project/controllers/auth_ctr/authentication.dart';
import 'package:insta_project/screens/create_post/model/comment_model.dart';
import 'package:uuid/uuid.dart';

class HomeProvider with ChangeNotifier{
  HomeProvider(){
    getUserId();
  }

  bool? _liked = false;
  bool? get liked => _liked;
  getLikedStatus(bool? status){
    _liked = status;
    print(status);
    notifyListeners();
  }

  bool _isLikeAniamtion = false;
  bool get isLikeAniamtion => _isLikeAniamtion;
  getLikeAnimationStatus(bool status){
    _isLikeAniamtion = status;
    notifyListeners();
  }

  String? userId;
  getUserId(){
    Auth auth = Auth();
    userId = auth.getUserId();
    notifyListeners();
  }

  updateLikes({required String postId, required String uid, required List likes})async{
    FirebaseFirestore fire_store = FirebaseFirestore.instance;

    try{
    // If userId is already present, we need to remove it to remove like.
      if(likes.contains(userId)){
        await fire_store.collection('userPosts').doc(postId).update({
          "likes" : FieldValue.arrayRemove([uid])
        });
      }else{
        await fire_store.collection('userPosts').doc(postId).update({
          "likes" : FieldValue.arrayUnion([uid])
        });
      }
    }catch(e){
      print(e.toString());
    }
  }

  postComment({
    required String postId,
   required String name,
   required String comment,
    required String uid,
   required String profImage,
   required String dateCreated,
  })async{
    FirebaseFirestore fire_store = FirebaseFirestore.instance;
    try{
      String commentId = Uuid().v1();
      CommentModel _comment = CommentModel(
        name: name,
        commentId: commentId,
        comment: comment,
        uid: uid,
        profImage: profImage,
        dateCreated: DateTime.now(),
      );
      await fire_store.collection('userPosts').doc(postId).collection('comments').doc(commentId).set(_comment.toJson());

    }catch(e){

    }
  }
}