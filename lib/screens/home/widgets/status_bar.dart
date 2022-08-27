part of '../home_screen.dart';
class StatusBar extends StatefulWidget {
  const StatusBar({Key? key}) : super(key: key);

  @override
  State<StatusBar> createState() => _StatusBarState();
}

class _StatusBarState extends State<StatusBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height85,
      child: ListView.builder(
          itemCount: 6,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index){
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width10,),
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
    );
  }
}
