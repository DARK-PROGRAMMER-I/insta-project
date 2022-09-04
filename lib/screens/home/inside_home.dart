import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:insta_project/screens/home/widgets/post_card.dart';
import 'package:provider/provider.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../utils/utils.dart';
import '../../widgets/small_text.dart';
import '../../widgets/svg_image.dart';
import '../create_post/model/post_model.dart';

// part 'widgets/post_card.dart';
part 'widgets/status_bar.dart';
part 'widgets/home_app_bar.dart';
// part 'provider/home_provider.dart';
class InsideHome extends StatefulWidget {
  const InsideHome({Key? key}) : super(key: key);

  @override
  State<InsideHome> createState() => _InsideHomeState();
}

class _InsideHomeState extends State<InsideHome> {
  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<List<PostModel?>?>(context);

    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: Dimensions.height60,),
          HomeAppbar(),
          StatusBar(),
          PostCard(),
        ],
      ),

    );
  }
}
