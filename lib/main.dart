import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_project/controllers/auth_ctr/authentication.dart';
import 'package:insta_project/models/user_model.dart';
import 'package:insta_project/providers/navigation_provider.dart';
import 'package:insta_project/providers/user/user_provider.dart';
import 'package:insta_project/responsive/mobile_screen.dart';
import 'package:insta_project/responsive/responsive.dart';
import 'package:insta_project/responsive/web_screen.dart';
import 'package:insta_project/screens/create_post/providers/post_provider.dart';
import 'package:insta_project/screens/home_screen.dart';
import 'package:insta_project/screens/login_screen.dart';
import 'package:insta_project/utils/colors.dart';
import 'package:provider/provider.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyCbj6_aH4lI99Nl5QvjL6XNQp7KpCNnsfQ",
          authDomain: "insta-project-733bc.firebaseapp.com",
          projectId: "insta-project-733bc",
          storageBucket: "insta-project-733bc.appspot.com",
          messagingSenderId: "288788525575",
          appId: "1:288788525575:web:35f5089c075302f58030a2"
      )
    );
  }else{
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ChangeNotifierProvider(create: (_) => PostProvider()),
        StreamProvider<UserModel?>.value(
            initialData: null,
            value: Auth().userData,
        )

      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'instagram Clone',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: mobileBackgroundColor,

        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snap){
            if(snap.connectionState == ConnectionState.active){
              if(snap.hasData){
                return  ResponsiveLayout(
                  webScreenLayout: WebScreen(),
                  mobileScreenLayout: MobileScreen(),

                );
              }else if(snap.hasError){
                return Scaffold(body: Center(child: Text(snap.error.toString()),),);
              }else{
                return LoginScreen();
              }
            }
            else if(snap.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }
            return LoginScreen();
          },
        ),
      ),
    );
  }
}
