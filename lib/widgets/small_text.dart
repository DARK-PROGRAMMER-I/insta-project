import 'package:flutter/material.dart';
import 'package:insta_project/utils/dimensions.dart';

class SmallText extends StatelessWidget {
  String name;
  Color color ;
  double size = 0;
  double height;
  bool bold;
  SmallText(
      {required this.name,
        required this.bold,
        this.size = 0,
        this.color = const Color(0xffa0a09f),
        this.height = 1.2});
  TextOverflow overflow = TextOverflow.visible;
  @override
  Widget build(BuildContext context) {
    return Text(
      name ,
      style: TextStyle(
        fontSize: size  == 0 ? Dimensions.smallText : size != 0 ? Dimensions.pageHeight / (860/size): size ,
        color: color , fontFamily: 'Roboto', height: height,
        fontWeight: bold == true ? FontWeight.w600: FontWeight.normal,
        letterSpacing: 0.70
      ),
      overflow: overflow,
    );
  }
}