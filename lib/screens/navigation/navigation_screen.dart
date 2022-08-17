import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insta_project/providers/navigation_provider.dart';
import 'package:provider/provider.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  List<Widget> _pages = [];
  @override
  Widget build(BuildContext context) {
    final navProvider = Provider.of<NavigationProvider>(context);
    return Scaffold(
      body: _pages[navProvider.index],

      bottomNavigationBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.house, size: 18,),
              label: 'home'
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.searchengin, size: 18,),
            label: 'search'
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.circlePlus, size: 18,),
            label: 'add'

          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.heartCircleBolt, size: 18,),
            label: 'Favourite'
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.circleUser, size: 18,),
            label: 'profile'
          ),

        ],
      ),
    );
  }
}
