import 'package:flutter/material.dart';
import 'package:insta_project/utils/colors.dart';
import 'package:insta_project/utils/dimensions.dart';

class TextWrap extends StatelessWidget {
  final String text;
  const TextWrap({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: Dimensions.width20, vertical: Dimensions.width20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
                child: Text(
                  text,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: AppColors.greyColor),
                  overflow: TextOverflow.clip,
                ))
          ],
        ));
  }
}

