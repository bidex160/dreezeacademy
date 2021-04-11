import 'package:dreezeacademy/account/joinus.dart';
import 'package:dreezeacademy/apptheme/app_theme.dart';
import 'package:dreezeacademy/screen/Assessment.dart';
import 'package:dreezeacademy/screen/home.dart';
import 'package:dreezeacademy/screen/onboard1.dart';
import 'package:dreezeacademy/screen/onboard2.dart';
import 'package:dreezeacademy/screen/onboard3.dart';
import 'package:dreezeacademy/screen/playScreen.dart';
import 'package:dreezeacademy/screen/splash.dart';
import 'package:dreezeacademy/screen/taketest.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  SharedPreferences.setMockInitialValues({});
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appThemeDark,
      debugShowCheckedModeBanner: false,
      title: 'DreezeTv',
      initialRoute: '/',
      routes: {
        '/': (ctx) => SplashScreen(),
        HomeScreen.routeName: (ctx) => HomeScreen(),
        OnboardOne.routeName: (ctx) => OnboardOne(),
        OnboardTwo.routeName: (ctx) => OnboardTwo(),
        OnboardThree.routeName: (ctx) => OnboardThree(),
        JoinUS.routeName: (ctx) => JoinUS(),
        TakeTest.routeName: (ctx) => TakeTest(),
        Assessment.routeName: (ctx) => Assessment(),
        PlayScreen.routeName: (ctx) => PlayScreen()
        // Login.routeName:(ctx)=>Login(),
        //    SignUp.routeName:(ctx)=>SignUp(),
        // //   PlayerScreen.routeName:(ctx)=>PlayerScreen(),
        //    SubscriptionScreen.routeName:(ctx)=>SubscriptionScreen()
      },
    );
  }
}
