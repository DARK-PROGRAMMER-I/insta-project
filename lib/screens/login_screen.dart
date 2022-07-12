import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insta_project/utils/colors.dart';
import 'package:insta_project/utils/dimensions.dart';
import 'package:insta_project/widgets/credential_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _passCtr = TextEditingController();
  TextEditingController _emailCtr = TextEditingController();

  @override
  void dispose(){
    super.dispose();
    _emailCtr.dispose();
    _passCtr.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: Dimensions.pageHeight,
          width: Dimensions.pageWidth,
          padding: EdgeInsets.symmetric(horizontal: Dimensions.width30),
          child: Column(
            children: [
              Flexible(child: Container(), flex: 2,),
              SvgPicture.asset('assets/images/logo.svg', color: AppColors.mainWhiteColor,),
              CredentialFormField(
                  text: 'Enter your email',
                  controller: _emailCtr
              )

            ],
          ),
        ),
      ),
    );
  }
}
