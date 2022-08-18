import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

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
          backgroundColor: Colors.red,
          content: Text(message, textAlign: TextAlign.center,),
        )
    );
  }
}

