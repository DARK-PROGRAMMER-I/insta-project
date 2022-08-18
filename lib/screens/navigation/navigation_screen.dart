import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insta_project/providers/navigation_provider.dart';
import 'package:insta_project/screens/create_post/create_post_screen.dart';
import 'package:insta_project/screens/home_screen.dart';
import 'package:insta_project/utils/colors.dart';
import 'package:insta_project/utils/colors.dart';
import 'package:insta_project/utils/colors.dart';
import 'package:insta_project/utils/colors.dart';
import 'package:insta_project/utils/colors.dart';
import 'package:provider/provider.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  List<Widget> _pages = [
    HomeScreen(),
    HomeScreen(),
    CreatePostScreen(),
    HomeScreen(),
    HomeScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    final navProvider = Provider.of<NavigationProvider>(context);
    return Scaffold(
      body: _pages[navProvider.index!],

      bottomNavigationBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.house, size: 18,color: navProvider.index == 0 ?  AppColors.mainWhiteColor : AppColors.blueColor,),

          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.searchengin, size: 18,color: navProvider.index == 1 ?  AppColors.mainWhiteColor : AppColors.blueColor,),

          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.circlePlus, size: 18,color: navProvider.index == 2 ?  AppColors.mainWhiteColor : AppColors.blueColor,),


          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.heartCircleBolt, size: 18,color: navProvider.index == 3 ?  AppColors.mainWhiteColor : AppColors.blueColor,),

          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.circleUser, size: 18,color: navProvider.index == 4 ?  AppColors.mainWhiteColor : AppColors.blueColor,),

          ),

        ],
        onTap: (value){
          navProvider.selectedIndex(value);
        },
      ),
    );
  }
}
