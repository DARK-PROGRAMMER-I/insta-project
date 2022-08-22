import 'package:flutter/material.dart';
import 'package:insta_project/providers/user/user_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userprovider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(userprovider.user!.name.toString()),
      ),
    );
  }
}
