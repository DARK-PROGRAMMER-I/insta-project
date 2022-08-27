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
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.redColor
                          ),
                        ),
                        Column(
                          children: [
                            SmallText(name: 'account name', bold: true, size: Dimensions.height20,align: false,),
                            SmallText(name: 'specialities', bold: false,align: false,)
                          ],
                        )
                      ],
                    )

                  ],
                )
              ],
            ),
          )

        ],
      ),

    );
  }
}
