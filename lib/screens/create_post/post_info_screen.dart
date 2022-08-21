import 'dart:io';
import 'package:flutter/material.dart';
import '../../utils/dimensions.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insta_project/screens/create_post/providers/post_provider.dart';
import 'package:insta_project/utils/colors.dart';
import 'package:provider/provider.dart';
import '../../utils/dimensions.dart';
import '../../widgets/big_text.dart';

part 'widgets/post_info_appbar.dart';
part 'widgets/image_description.dart';
class PostInfoScreen extends StatefulWidget {
  File? imgFile;
  PostInfoScreen({Key? key, this.imgFile}) : super(key: key);

  @override
  State<PostInfoScreen> createState() => _PostInfoScreenState();
}

class _PostInfoScreenState extends State<PostInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.square(Dimensions.height70),
          child: PostInfoAppbar()
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }


}
