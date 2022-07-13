import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insta_project/utils/colors.dart';
import 'package:insta_project/utils/dimensions.dart';
import 'package:insta_project/widgets/credential_form_field.dart';
import 'package:insta_project/widgets/custom_buttons.dart';
import 'package:insta_project/widgets/small_text.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _passCtr = TextEditingController();
  TextEditingController _emailCtr = TextEditingController();
  TextEditingController _nameCtr = TextEditingController();
  TextEditingController _bioCtr = TextEditingController();

  @override
  void dispose(){
    super.dispose();
    _emailCtr.dispose();
    _passCtr.dispose();
    _nameCtr.dispose();
    _bioCtr.dispose();
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
              Spacer(),
              SvgPicture.asset('assets/images/logo.svg', color: AppColors.mainWhiteColor,),
              SingleChildScrollView(
                child: Form(
                    child: Column(
                      children: [
                        CredentialFormField(
                            text: 'Enter your Name',
                            controller: _nameCtr
                        ),
                        CredentialFormField(
                            text: 'Enter your email',
                            controller: _emailCtr
                        ),
                        CredentialFormField(
                            text: 'Enter your password',
                            controller: _passCtr
                        ),
                        CustomButton(
                          text: 'Sign-up',
                          textColor: AppColors.whiteColor,
                          bold: true,
                          onpressed: (){},
                          color: AppColors.smallTextColor,
                        ),
                        SizedBox(height: Dimensions.height20,),

                      ],
                    )
                ),
              ),
              Spacer(),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SmallText(name: 'Already have an accout? ', bold: true, color: AppColors.mainWhiteColor,),
                      TextButton(onPressed: (){}, child: SmallText(name: 'Login', bold: true))
                    ],
                  )),
              SizedBox(
                height: Dimensions.height30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
