import 'package:insta_project/models/uid.dart';

class UserModel {
  final String? name;
  final String? email;
  final String? bio;
  final String? uid;
  final List? followers;
  final List? folowing;
  final String ?imgUrl;

  UserModel({
    required this.name,
    required this.email,
    required this.bio,
    required this.uid,
    required this.followers,
    required this.folowing,
    required this.imgUrl,
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

}