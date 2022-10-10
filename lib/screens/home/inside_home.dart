import 'common_libs.dart';

part 'widgets/status_bar.dart';
part 'widgets/home_app_bar.dart';

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
