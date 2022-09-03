import 'package:flutter/material.dart';
import 'package:insta_project/screens/create_post/model/post_model.dart';
import 'package:insta_project/screens/home/inside_home.dart';
import 'package:provider/provider.dart';
import '../create_post/create_post_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<PostModel?>?>.value(
      initialData: null,
      value: PostStreams().getPosts,
      child: InsideHome(),
    );
  }
}
