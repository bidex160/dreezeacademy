
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

ThemeData appThemeDark = ThemeData (
  //9f2bff67,59,238,1
  primaryColor: Color.fromRGBO(67, 59, 238, 1),
  accentColor: Color.fromRGBO(67, 59, 238, 1),
  primaryColorLight: Color.fromRGBO(33, 32, 41, 1),
  primaryColorDark: Colors.black,
  backgroundColor:   Colors.white,

  splashColor: Colors.transparent,
  inputDecorationTheme: InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      //    borderRadius: BorderRadius.all(Radius.circular(15)),
      borderSide: BorderSide(color:Color.fromRGBO(88,88,89,1)),

    ),

    focusedBorder: OutlineInputBorder(
      //  borderRadius: BorderRadius.all(Radius.circular(15)),

      borderSide: BorderSide( color: Color.fromRGBO(88,88,89,1)),

    ),



    border: OutlineInputBorder(
      //   borderRadius: BorderRadius.all(Radius.circular(15)),
      borderSide: BorderSide(color:  Color.fromRGBO(88,88,89,1)),
    ),

  ),

  iconTheme: ThemeData.light().primaryIconTheme.copyWith(
    color:Color.fromRGBO(88,88,89,1),
  ),
 primaryIconTheme: ThemeData.light().primaryIconTheme.copyWith(

 ),
  buttonColor: Color.fromRGBO(67,59,238,1),

  buttonTheme: ThemeData.light().buttonTheme.copyWith(
      buttonColor: Color.fromRGBO(67,59,238,1),

    textTheme: ButtonTextTheme.primary,

   shape: RoundedRectangleBorder(
   borderRadius: BorderRadius.circular(5)

   )

  ),
  textTheme: ThemeData.light().textTheme.copyWith(

    title: TextStyle(
        fontFamily: 'Raleway',
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color:Colors.black54

    ),
    button: TextStyle(),
//subhead subject
    subhead: TextStyle(
        fontFamily: 'Raleway',
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        color:Colors.black
      //fontWeight: FontWeight.bold,

    ),
//display e.g labqeltext textfield
    display1: TextStyle(
        fontFamily: 'Raleway',
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: Color.fromRGBO(67,59,238,1),

    ),

    //display e.g textfield style
    display2: TextStyle(
        fontFamily: 'Raleway',
        fontSize: 15,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        color: Color.fromRGBO(88,88,89,1)
    ),
//button text
    display3: TextStyle(
        fontFamily: 'Raleway',
        fontSize: 16,
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.normal,
        color: Colors.white

    ),
    display4: TextStyle(
        fontFamily: 'Raleway',
        fontSize: 12,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        color:  Color.fromRGBO(67, 59, 238, 1),

    ),

//subtitle paper
    subtitle: TextStyle(
        fontFamily: 'Raleway',
        fontSize: 20,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        color:Colors.black
    ),



  ),


  appBarTheme:AppBarTheme(
      // iconTheme: IconThemeData(
      //   color: Colors.white, //change your color here
      // ),
   elevation: 0,
    color: Colors.transparent,
      textTheme:  ThemeData.light().textTheme.copyWith(
        title: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color:Color.fromRGBO(88, 88, 88, 1)
          //fontStyle: FontStyle.italicbackground: 88,88,89,1;
        ),

      )

  ),


);

