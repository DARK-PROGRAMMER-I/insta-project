import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:insta_project/widgets/svg_image.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:insta_project/utils/dimensions.dart';
import 'package:provider/provider.dart';

import '../../models/user_model.dart';
import '../../controllers/auth_ctr/authentication.dart';
import '../../models/user_model.dart';
import '../../utils/colors.dart';

part 'inside_home.dart';
part 'widgets/home_app_bar.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    return StreamProvider<UserModel?>.value(
        initialData: null,
        value: Auth().userData,
        child: InsideHome()
    );
  }
}
