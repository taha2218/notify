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
    ChannelsScreen(),
    ProfilePage(),
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
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 1,
      title: Text(
        "Notifier",
        textAlign: TextAlign.center,
        style: GoogleFonts.ubuntu(textStyle: TextStyle(color: Colors.black.withOpacity(0.88),fontSize: 18,fontWeight: FontWeight.w500)),
      ),
      actions: [
        IconButton(icon: Icon(Icons.exit_to_app,size: 22,), onPressed: (){Navigator.pop(context);})
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
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.black.withOpacity(0.75),
      selectedItemColor: Colors.indigo[800],
      currentIndex: _currentIndex,
      onTap: (value){
        if (value == 2) Get.toNamed('profile');
        else _indexProvider.indexOfScreen = value;
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, size: 27,),
          title: Text("Home",style: TextStyle(color: Colors.black, fontSize: 11),),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.view_headline, size: 27), 
          title: Text("Channels",style: TextStyle(color: Colors.black, fontSize: 11),)
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person, size: 27),
          title: Text("Profile",style: TextStyle(color: Colors.black, fontSize: 11),),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark, size: 27), 
          title: Text('BookMark',style: TextStyle(color: Colors.black, fontSize: 11),),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.info, size: 27),
          title: Text('About',style: TextStyle(color: Colors.black, fontSize: 11),)),
      ],
    );
  }

}