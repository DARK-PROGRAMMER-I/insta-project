import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/user_model.dart';

class InsideHome extends StatefulWidget {
  const InsideHome({Key? key}) : super(key: key);

  @override
  State<InsideHome> createState() => _InsideHomeState();
}

class _InsideHomeState extends State<InsideHome> {
  @override
  Widget build(BuildContext context) {
    UserModel? userprovider = Provider.of<UserModel?>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(userprovider != null ? userprovider.name.toString() : 'user'),
        )
    );
  }
}
