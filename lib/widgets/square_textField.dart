import 'package:flutter/material.dart';
import 'package:insta_project/utils/colors.dart';
import 'package:insta_project/utils/dimensions.dart';

class SquareTextFields extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  final Color color;
  const SquareTextFields({Key? key,
    required this.text,
    required this.controller,
    this.color = const Color(0xffa0a09f),

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric( horizontal: Dimensions.width20,),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: Dimensions.width25, vertical: Dimensions.height5),
            hintText: text,
            hintStyle: TextStyle(
                color: AppColors.smallTextColor,
                fontWeight: FontWeight.w300,
                fontSize: Dimensions.bigText,

            ),
            fillColor: AppColors.buttonBackgroundColor,
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.buttonBackgroundColor),
                borderRadius: BorderRadius.circular(Dimensions.radius15)
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.buttonBackgroundColor),
                borderRadius: BorderRadius.circular(Dimensions.radius15)
            )
        ),
      ),
    );
  }
}
