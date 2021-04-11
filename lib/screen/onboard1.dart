import 'package:dreezeacademy/Size_Config/Config.dart';
import 'package:dreezeacademy/apptheme/app_theme.dart';
import 'package:dreezeacademy/screen/onboard2.dart';
import 'package:flutter/material.dart';

class OnboardOne extends StatefulWidget {
  static final routeName = '/onboard1';
  @override
  _OnboardOneState createState() => _OnboardOneState();
}

class _OnboardOneState extends State<OnboardOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor:appThemeDark.backgroundColor ,
      body: SafeArea(


      child: Container(
        height: Config.yMargin(context, 100),
       padding: const EdgeInsets.only(bottom: 20),
       color:appThemeDark.backgroundColor ,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
//background: #433BEE;
           children: [
             FlatButton(onPressed: (){
               Navigator.of(context).pushNamed(OnboardTwo.routeName);
             },
                 child: Text("Skip",style: appThemeDark.textTheme.display1 )),

             Container(
               height: Config.yMargin(context, 20),
               width: Config.xMargin(context, 100),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Text("Subjects for every class", style: appThemeDark.textTheme.display2),
                   SizedBox(height: 5,),
                   Text("If learning has always been a problem", style: appThemeDark.textTheme.display3),
                   Text("welcome to great learning", style: appThemeDark.textTheme.display3),
                   SizedBox(height: 15,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,

                     children: [
                       Container(
                         height: 10,
                         width: 14,
                         decoration: BoxDecoration(
                           color: appThemeDark.primaryColor,
                           borderRadius: BorderRadius.circular(20)

                         ),
                       ),
                       SizedBox(width: 4,),
                       Container(
                         height: 10,
                         width: 10,
                         decoration: BoxDecoration(
                             color: Colors.black12,
                             borderRadius: BorderRadius.circular(20)

                         ),
                       ),
                       SizedBox(width: 4,),
                       Container(
                         height: 10,
                         width: 10,
                         decoration: BoxDecoration(
                             color: Colors.black12,
                             borderRadius: BorderRadius.circular(20)

                         ),
                       ),
                     ],
                   ),
                 ],
               ),
             ),

             InkWell(
               child: Container(
                 width: Config.xMargin(context, 30),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.end,

                   children: [
                     Text("Next", style: appThemeDark.textTheme.display1,),
                     SizedBox(width: 5,),
                     Icon(
                       Icons.arrow_forward,
                       color: appThemeDark.primaryColor,
                       size: 15,
                     ),
                     SizedBox(width: 30,)
                   ],
                 ),
               ),
               onTap: (){
                 Navigator.of(context).pushNamed(OnboardTwo.routeName);
               },
             ),

             // Container(
             //   height: Config.yMargin(context, 100),
             // ),
           ],
         ),
      ),
      ),
    );
  }
}
