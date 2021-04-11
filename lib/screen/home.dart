
import 'package:dreezeacademy/Size_Config/Config.dart';
import 'package:dreezeacademy/screen/mycourses.dart';
import 'package:dreezeacademy/account/profile.dart';
import 'package:dreezeacademy/apptheme/app_theme.dart';
import 'package:dreezeacademy/screen/Assessment.dart';
import 'package:dreezeacademy/screen/LeaderBoard.dart';
import 'package:dreezeacademy/screen/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class HomeScreen extends StatefulWidget {
  static final routeName = '/home';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _cIndex = 0;


  List<dynamic> _body = [Welcome(),MyCourses(),Assessment(),LeaderBoard(),Profile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appThemeDark.backgroundColor,

      body: _body[_cIndex],


   floatingActionButton: Container(
     height: 40,
     child: FloatingActionButton(

       backgroundColor: appThemeDark.primaryColor,
       onPressed: (){

       },
       child: Stack(
         children: [
           Icon(
             Icons.notifications
           ),
           Icon(

             Icons.circle,
             color: Colors.red,
             size: 10,
           )
         ],
       ),
     ),
   ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        backgroundColor: appThemeDark.backgroundColor,
        type: BottomNavigationBarType.shifting ,
       selectedItemColor: appThemeDark.primaryColor,
        selectedIconTheme: IconThemeData(
          color: appThemeDark.primaryColor
        ),
        unselectedItemColor: Colors.black54,
        unselectedIconTheme: IconThemeData(
          color: Colors.black54
        ),
        currentIndex: _cIndex,
        items: [

          BottomNavigationBarItem(
              title: Text("Home"),
              icon: Icon(
                Icons.home,
                size: 24,
             //   color: Colors.black54,
              )),
          BottomNavigationBarItem(
            title: Text("Class"),
              icon: Icon(
                  Icons.video_collection_outlined,
                size: 24,
              )),
          BottomNavigationBarItem(
              title: Text("Assessments"),
              icon: Icon(
                Icons.library_books_outlined,
                size: 24,

              )),
          BottomNavigationBarItem(
              title: Text("Compete"),
              icon: Icon(
                  Icons.wine_bar,
                size: 24,
              )),

          BottomNavigationBarItem(
              title: Text("Account"),
              icon: Icon(
                  Icons.person,
                size: 24,

              )),


          // BottomNavigationBarItem(
          //     title: Text("Class"),
          //     icon: Icon(
          //         Icons.video_collection_outlined
          //     )),
        ],
        onTap: _incrementTab,
      ),
    );


  }
  void _incrementTab(index) {
    setState(() {
      _cIndex = index;
    });

  }
}
