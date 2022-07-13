import 'package:flutter/material.dart';
import 'package:insta_project/utils/dimensions.dart';
import 'package:insta_project/widgets/small_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final double textSize;
  final Color textColor;
  final bool bold;
  final double height;
  final bool icon;
  final IconData iconData;
  final Color iconColor;
  // final Function onpressed;
  final VoidCallback onpressed;
  const CustomButton({
    Key? key,
    required this.text,
    required this.textColor,
    required this.bold,
    this.color = const Color(0xff0077b6),
    this.textSize = 0,
    this.height = 0,
    this.icon = false,
    this.iconData = Icons.circle,
    this.iconColor = const Color(0xff3b5998),
    required this.onpressed,


  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.width20, vertical: Dimensions.height10),
      child: GestureDetector(
        onTap: onpressed,
        child: InkWell(
          child: Container(
            width: Dimensions.pageHeight,
            height: height == 0 ? Dimensions.height55: height,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(Dimensions.radius10)
            ),
            child: icon == true ? Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(iconData, color: iconColor,),
                  SizedBox(width: Dimensions.width5,),
                  SmallText(
                        name: text,
                        bold: bold,
                        color: textColor,
                        size: textSize == 0?  Dimensions.height20 : textSize,
                      ),
                ],
              ),
            ) :
            Center(
             child: SmallText(
              name: text,
              bold: bold,
              color: textColor,
              size: textSize == 0?  Dimensions.height20 : textSize,
            )),
          ),
        ),
      ),
    );
  }
}
