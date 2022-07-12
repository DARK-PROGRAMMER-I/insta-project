import 'package:flutter/material.dart';
import 'package:insta_project/utils/colors.dart';
import 'package:insta_project/utils/dimensions.dart';


class CredentialFormField extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  final Color color;
  final bool icon;
  final IconData iconData;
  final Color iconColor;
  const CredentialFormField(
      {
        Key? key,
        required this.text,
        required this.controller,
        this.color = const Color(0xffa0a09f),
        this.icon = false,
        this.iconData = Icons.circle,
        this.iconColor = const Color(0xff212089),

      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: Dimensions.height15,
          horizontal: Dimensions.width30 ),
      child: TextFormField(

        decoration: icon == true ? InputDecoration(
            suffixIcon: Icon(iconData, color: iconColor,size: Dimensions.icon24,),
            hintText: text,
            hintStyle: TextStyle(
                color: AppColors.smallTextColor,
                fontWeight: FontWeight.w400,
                fontSize: Dimensions.smallText
            ),
            fillColor: AppColors.buttonBackgroundColor,
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.buttonBackgroundColor),
                borderRadius: BorderRadius.circular(Dimensions.radius30)
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.buttonBackgroundColor),
                borderRadius: BorderRadius.circular(Dimensions.radius30)
            )
        ):

        InputDecoration(
            hintText: text,
            hintStyle: TextStyle(
                color: AppColors.smallTextColor,
                fontWeight: FontWeight.w400,
                 fontSize: Dimensions.smallText
            ),
            fillColor: AppColors.buttonBackgroundColor,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.buttonBackgroundColor),
              borderRadius: BorderRadius.circular(Dimensions.radius30)
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.buttonBackgroundColor),
              borderRadius: BorderRadius.circular(Dimensions.radius30)
            )
        ),
      ),
    );
  }
}
