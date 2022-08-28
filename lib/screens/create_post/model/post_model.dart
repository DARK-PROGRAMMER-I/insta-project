import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {

  final String? name;
  final String? postId;
  final String? description;
  final String? uid;
  final List? likes;
  final String ?postImgUrl;
  final DateTime? dateCreated;
  final String? profImage;

  PostModel({

    this.profImage,
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
    'profImage' : profImage
  };

  PostModel fromJson(DocumentSnapshot snapshot){
    var snap = snapshot.data() as Map<String, dynamic>;
    return PostModel(
        name: snap['name'],
        description: snap['description'],
        uid: snap['uid'],
        postId: snap['postId'],
        likes: snap['likes'],
        postImgUrl: snap['postImgUrl'],
        dateCreated: snap['dateCreated'],
        profImage: snap['profImage']
    );
  }

}