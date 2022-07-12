
import 'package:flutter/material.dart';
import 'package:insta_project/utils/dimensions.dart';

class BigText extends StatelessWidget {
  String name;
  Color color ;
  double size = 0;
  BigText({ required this.name, this.color = const Color(0xff212089), this.size = 0});

  @override
  Widget build(BuildContext context) {
    return Text(
        name ,
        maxLines: 1,
        style: TextStyle(

            overflow: TextOverflow.ellipsis,
            fontSize: size  == 0 ? Dimensions.bigText : size != 0 ? Dimensions.pageHeight / (860/size): size ,
            color: color , fontFamily: 'Roboto',
            fontWeight: FontWeight.w900, letterSpacing: 2 )
    );
  }
}