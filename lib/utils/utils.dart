import 'package:another_flushbar/flushbar.dart';
import 'package:enough_giphy_flutter/enough_giphy_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_project/utils/colors.dart';
import 'package:insta_project/utils/dimensions.dart';
import 'package:insta_project/widgets/small_text.dart';

pickImage(ImageSource source)async{
  ImagePicker picker = ImagePicker();
  XFile? image = await picker.pickImage(source: source);

  if(image != null){
    return image.readAsBytes();
  }else{
    'Error picking Image';
  }
}

class Utils{
  static toastMessage(String message){
    Fluttertoast.showToast(msg: message);
  }

  static flushMessage(String message, BuildContext context){
    Flushbar(
      message: message,
      duration: Duration(seconds: 3),
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: Colors.red,
      icon: Icon(Icons.error, color: Colors.white,),
    )..show(context);
  }

  static showSnakbar(String message, BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(seconds: 2),
          backgroundColor: Colors.red,
          content: SmallText(name: message, bold: true, color: AppColors.mainWhiteColor,align: true,),
        )
    );
  }
  static spinKit({Color? color}) => SpinKitRipple(
    color: color ?? AppColors.redColor,
    size: Dimensions.height20
  );
}

