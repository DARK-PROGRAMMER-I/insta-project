import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insta_project/controllers/auth_ctr/authentication.dart';
import 'package:insta_project/screens/home_screen.dart';
import 'package:insta_project/screens/register_screen.dart';
import 'package:insta_project/utils/colors.dart';
import 'package:insta_project/utils/dimensions.dart';
import 'package:insta_project/widgets/credential_form_field.dart';
import 'package:insta_project/widgets/custom_buttons.dart';
import 'package:insta_project/widgets/small_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _passCtr = TextEditingController();
  TextEditingController _emailCtr = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Auth auth = Auth();

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
            Spacer(),
            SvgPicture.asset('assets/images/logo.svg', color: AppColors.mainWhiteColor,),
            SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    CredentialFormField(
                        text: 'Enter your email',
                        controller: _emailCtr
                    ),
                    CredentialFormField(
                        text: 'Enter your password',
                        controller: _passCtr,
                      obscure: true,
                    ),
                    CustomButton(
                      text: 'Sign-In',
                      textColor: AppColors.whiteColor,
                      bold: true,
                      onpressed: ()async{
                        if(_formKey.currentState!.validate()){
                          bool reponse = await auth.signIn(email: _emailCtr.text, pass: _passCtr.text);
                          if(reponse){
                            // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login Successfull')));
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>HomeScreen() ));
                          }
                        }
                      },
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
                      SmallText(name: 'Dont have accout? ', bold: true, color: AppColors.mainWhiteColor,),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=> RegisterScreen()));
                      }, child: SmallText(name: 'Sign-up', bold: true))
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
