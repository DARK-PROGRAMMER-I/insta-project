part of 'home_screen.dart';

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
      body: Column(
        children: [
          SizedBox(height: Dimensions.height60,),
          HomeAppbar(),
          StatusBar(),
          Expanded(
              child: ListView.builder(
                itemCount: 5,
                  itemBuilder: (context, index){
                    return PostCard();
                  })
          ),


        ],
      ),

    );
  }
}
