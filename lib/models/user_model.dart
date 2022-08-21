import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? name;
  final String? email;
  final String? bio;
  final String? uid;
  final List? followers;
  final List? folowing;
  final String ?imgUrl;


  UserModel({
    this.name,
    this.email,
    this.bio,
    this.uid,
    this.followers,
    this.folowing,
    this.imgUrl,
  });

  Map<String, dynamic> toJson() => {
    'name': name ,
    'email': email ,
    'bio': bio ,
    'uid': uid ,
    'followers' : [],
    'following' : [],
    'imgUrl': imgUrl ,
  };

  UserModel fromJson(DocumentSnapshot snapshot){
    var snap = snapshot.data() as Map<String, dynamic>;
    return UserModel(
        name: snap['name'],
        email: snap['email'],
        bio: snap['bio'],
        uid: snap['uid'],
        followers: snap['followers'],
        folowing: snap['folowing'],
        imgUrl: snap['imgUrl']
    );
  }

}