import 'package:cloud_firestore/cloud_firestore.dart';

class CommentModel {

  final String? name;
  final String? commentId;
  final String? comment;
  final String? uid;
  final DateTime? dateCreated;
  final String? profImage;

  CommentModel({

    this.name,
    this.commentId,
    this.comment,
    this.uid,
    this.profImage,
    this.dateCreated
  });

  Map<String, dynamic> toJson() => {

    'name': name ,
    'commentId': commentId ,
    'comment': comment ,
    'uid': uid ,
    'profImage' : profImage,
    'dateCreated' : dateCreated,
  };

  CommentModel fromJson(DocumentSnapshot snapshot){
    var snap = snapshot.data() as Map<String, dynamic>;
    return CommentModel(
        name: snap['name'],
        commentId: snap['commentId'],
        comment: snap['comment'],
        uid: snap['uid'],
        profImage: snap['profImage'],
        dateCreated: snap['dateCreated'],

    );
  }

}