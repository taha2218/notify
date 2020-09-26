import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

import 'package:notification/pages/profile.dart';
import 'package:notification/providers/index.dart';
import 'package:notification/screens/aboutUs.dart';
import 'package:notification/screens/bookmark.dart';
import 'package:notification/screens/channels.dart';
import 'package:notification/screens/home.dart';


class HomePage extends StatelessWidget {

  final List<Widget> _screens = [
    HomeScreen(),
    ProfilePage(),
    ChannelsScreen(),
    BookMarkScreen(),
    AboutUsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:_buildAppbar(context),
        body: _buildBody(context),
        bottomNavigationBar: _buildBottomNavBar(context),
      ),
    );  
  }

  Widget _buildAppbar(BuildContext context) {

    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      title: Text(
        "Notifier",
        textAlign: TextAlign.center,
        style: GoogleFonts.ubuntu(textStyle: TextStyle(color: Colors.black.withOpacity(0.88),fontSize: 21,fontWeight: FontWeight.w600)),
      ),
      actions: [
        IconButton(icon: Icon(Icons.exit_to_app), onPressed: (){})
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    final _indexProvider = Provider.of<Index>(context);
    int _currentIndex = _indexProvider.indexOfScreen;
    return _screens[_currentIndex]; 
  }  

  Widget _buildBottomNavBar(context) {
    final _indexProvider = Provider.of<Index>(context);
    int _currentIndex = _indexProvider.indexOfScreen;
    return BottomNavigationBar(
      showSelectedLabels: true,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.black,
      selectedItemColor: Colors.indigo,
      currentIndex: _currentIndex,
      onTap: (value){
        if (value == 1) Get.toNamed('profile');
        else _indexProvider.indexOfScreen = value;
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home,),
          title: Text("Home",style: TextStyle(color: Colors.black, fontSize: 11),)
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person,), 
          title: Text("Profile",style: TextStyle(color: Colors.black, fontSize: 11),)
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.view_list,),
          title: Text("Channels",style: TextStyle(color: Colors.black, fontSize: 11),),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark_border,), 
          title: Text('BookMark',style: TextStyle(color: Colors.black, fontSize: 11),)
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.info_outline,),
          title: Text('About us',style: TextStyle(color: Colors.black, fontSize: 11),))
      ],
    );
  }

}