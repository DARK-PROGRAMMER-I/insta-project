import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_project/controllers/auth_ctr/authentication.dart';
import 'package:insta_project/main.dart';
import 'package:insta_project/providers/user/user_provider.dart';
import 'package:insta_project/screens/auth/login_screen.dart';
import 'package:insta_project/utils/colors.dart';
import 'package:insta_project/utils/dimensions.dart';
import 'package:insta_project/utils/utils.dart';
import 'package:insta_project/widgets/credential_form_field.dart';
import 'package:insta_project/widgets/custom_buttons.dart';
import 'package:insta_project/widgets/small_text.dart';
import 'package:provider/provider.dart';

import '../../responsive/mobile_screen.dart';
import '../../responsive/responsive.dart';
import '../../responsive/web_screen.dart';

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
// Form Key
  final _formKey = GlobalKey<FormState>();
// Auth Class Initiallizaton
  Auth  auth = Auth();
// Image data
  XFile? image;
  void setImage()async{
    XFile? img = await pickImage(ImageSource.camera);
    setState((){
      image = img;
    });
  }
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
    final userprovider  = Provider.of<UserProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: Dimensions.pageHeight,
          width: Dimensions.pageWidth,
          padding: EdgeInsets.symmetric(horizontal: Dimensions.width30),
          child: Column(
            children: [
              Flexible(child: Container(), flex: 1,),
              Expanded(
                flex: 6,
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/images/logo.svg', color: AppColors.mainWhiteColor,),
                          SizedBox(height: Dimensions.height30,),
                          Stack(
                            children: [
                              image != null ?
                              CircleAvatar(
                                radius: Dimensions.radius45,
                                backgroundImage: FileImage(File(image!.path)),
                              ):
                              CircleAvatar(
                                radius: Dimensions.radius45,
                                backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbJLHWeA-NMFC1hod2-twQCb338iUWIlG4pLx56u_CQw&s'),
                              ),
                              Positioned(
                                // top: -10,
                                  bottom: -Dimensions.height10,
                                  right: -Dimensions.width5,
                                  child: IconButton(onPressed: (){
                                    setImage();
                                  }, icon: Icon(Icons.add_a_photo))
                              )
                              ],
                          ),
                          // Spacer(),
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
                              controller: _passCtr,
                            obscure: true,
                          ),
                          CredentialFormField(
                              text: 'Enter your bio',
                              controller: _bioCtr,

                          ),
                          userprovider.isLoading ? Center(child: CircularProgressIndicator(),):
                          CustomButton(
                            text: 'Sign-up',
                            textColor: AppColors.whiteColor,
                            bold: true,
                            onpressed: ()async{
                              if(_formKey.currentState!.validate()){
                                userprovider.loadingStatus(true);
                                bool response= await auth.signUp(
                                    name: _nameCtr.value.text,
                                    email: _emailCtr.text,
                                    pass: _passCtr.text,
                                    bio: _bioCtr.text,
                                    file: File(image!.path)
                                );
                                // print(response);
                                if(response){
                                  userprovider.loadingStatus(false);
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Sign-up Successfull')));
                                  Navigator.push(context, MaterialPageRoute(builder: (_)=> ResponsiveLayout(
                                    webScreenLayout: WebScreen(),
                                    mobileScreenLayout: MobileScreen(),

                                  )));
                                }
                              }else{
                                print('here im ');
                              }
                            },
                            color: AppColors.greyColor,
                          ),
                          SizedBox(height: Dimensions.height20,),
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
                      )
                  ),
                ),
              ),
              // Spacer(),
              Flexible(child: Container(), flex: 1,),
            ],
          ),
        ),
      ),
    );
  }
}
