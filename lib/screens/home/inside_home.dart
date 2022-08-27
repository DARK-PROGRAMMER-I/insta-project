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
          SizedBox(height: Dimensions.height50,),
          HomeAppbar(),

          Expanded(
            child: ListView.builder(
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){
                return Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width10, vertical: Dimensions.height20),
                child: Container(
                  height: Dimensions.height50,
                  width: Dimensions.width50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.mainWhiteColor
                  ),
                ),
              );
            }),
          )
        ],
      ),

    );
  }
}
