import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? name;
  final String? postId;
  final String? description;
  final String? uid;
  final List? likes;
  final String ?postImgUrl;
  final DateTime? dateCreated;

  UserModel({
    this.name,
    this.uid,
    this.postId,
    this.likes,
    this.description,
    this.postImgUrl,
    this.dateCreated,
  });

  Map<String, dynamic> toJson() => {
    'name': name ,
    'postId': postId ,
    'description': description ,
    'uid': uid ,
    'likes' : [],
    'postImgUrl': postImgUrl ,
    'dateCreated' : dateCreated,
  };

  UserModel fromJson(DocumentSnapshot snapshot){
    var snap = snapshot.data() as Map<String, dynamic>;
    return UserModel(
        name: snap['name'],
        bio: snap['bio'],
        uid: snap['uid'],
        followers: snap['followers'],
        folowing: snap['folowing'],
        imgUrl: snap['imgUrl']
    );
  }

}