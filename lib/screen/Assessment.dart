import 'package:dreezeacademy/screen/taketest.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dreezeacademy/Size_Config/Config.dart';
import 'package:dreezeacademy/apptheme/app_theme.dart';
class Assessment extends StatefulWidget {
  static final routeName = '/assesmemt';
  @override
  _AssessmentState createState() => _AssessmentState();
}

class _AssessmentState extends State<Assessment> {
  String dropdownValue = 'SS1';
  int paperNo =1;
 String exam ="WASSCE";
 String subject="Mathematics";
 bool dependence =true;




 @override
  void didChangeDependencies() {
   if(dependence) {
   //   final arg = ModalRoute.of(context).settings.arguments;
   // print(arg.toString());
   //
   //
   //     dependence = false;

   }

     super.didChangeDependencies();

  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      
      child: Scaffold(

        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            height: Config.yMargin(context, 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: Config.yMargin(context, 8),
                  // padding: const EdgeInsets.all(12.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                      child: Text("Assessments", style: appThemeDark.textTheme.title,)),
                ),

                TabBar(
                  indicatorColor: Color.fromRGBO(67, 59, 238, 0.56),
                  indicatorWeight: 4.0,
                  tabs: [
                  FlatButton(onPressed: (){}, child:Text("Local",style: appThemeDark.textTheme.title,)),
                  FlatButton(onPressed: (){}, child:Text("Take test",style: appThemeDark.textTheme.title,))
                ],),
               Expanded(
                 child: TabBarView(

                     children: [

                       Column(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         //    height: Config.yMargin(context, 90),
                         children: [

                           Container(
                               height: 167,
                               width: 167,
                          //  color: Colors.black54,
                             margin: const EdgeInsets.only(top: 20),
                             child:Center(
                               child: Stack(
                                 children: [
                                   Align(
                                     alignment: Alignment.center,
                                     child: Container(
                                       height: 167,
                                       width: 167,
                                       decoration: BoxDecoration(
                                           gradient: LinearGradient( 
                                               begin: Alignment.centerRight, 
                                               end: Alignment.centerLeft, 
                                               colors: [Color.fromRGBO(54, 207, 255, 0.62), Color.fromRGBO(67, 59, 238, 0.62)]),
                                         //  color: Color.fromRGBO(113, 98, 206,1),
                                        // color: Color.fromRGBO(99, 206, 194,1),
                                         borderRadius: BorderRadius.circular(90)

                                       ),
                                     ),
                                   ),
                                   Align(
                                     alignment: Alignment.center,
                                     child: Container(

                                     height: 101,
                                       width: 101,
                                       decoration: BoxDecoration(
                                         color: Colors.white,
                                         borderRadius: BorderRadius.circular(90)
                                       ),
                                       child: Column(
                                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                         children: [
                                           Text("21st", style: TextStyle(
                                             color:  Color.fromRGBO(67, 59, 228, 1),
                                             fontFamily: 'Raleway',
                                             fontSize: 11,
                                             fontWeight: FontWeight.w700,
                                           )),

                                           Text("83%", style: TextStyle(
                                             color: Colors.black,
                                             fontFamily: 'Raleway',
                                             fontSize: 16,
                                             fontWeight: FontWeight.w700,
                                           )),
                                           Text("Attempted 24", style: TextStyle(
                                             color: Colors.black,
                                             fontFamily: 'Raleway',
                                             fontSize: 8,
                                             fontWeight: FontWeight.w400,
                                           ))
                                         ],
                                       ),

                                     ),
                                   ),
                                   Align(
                                     alignment: Alignment.topCenter,
                                     child: Container(
                                     height: 30,
                                       width: 167,
                                       decoration: BoxDecoration(
                                         color: Colors.transparent,
                                         borderRadius: BorderRadius.circular(90)
                                       ),

                                     ),
                                   )
                                  

                                 ],
                               ),
                             )
                           ),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               IconButton(icon: Icon(
                                 Icons.save_alt_sharp,
                                 color: Colors.black54,
                               ), onPressed: (){}),
                               IconButton(icon: Icon(
                                 Icons.share,
                                 color: Colors.black54,
                               ), onPressed: (){})
                             ],
                           ),

                           SizedBox(height: 20,),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Container(
                                 height: Config.yMargin(context, 15),
                                 width: Config.xMargin(context, 45),
                                 child: Card(
                                   child: Center(
                                     child: Padding(
                                       padding: const EdgeInsets.only(top:8.0, bottom: 8.0),
                                       child: Row(
                                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: [
                                           Column(
                                             mainAxisAlignment: MainAxisAlignment.spaceAround,
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                             children: [
                                               Text("83%", style: appThemeDark.textTheme.title,),
                                               Text("+23.54", style: appThemeDark.textTheme.display2,),
                                               Text("Success", style: appThemeDark.textTheme.title,)
                                             ],
                                           ),
                                           CircleAvatar(
                                             radius: 20,
                                             backgroundColor: Colors.blue,

                                             child: Icon(
                                               Icons.stacked_line_chart_outlined,
                                               color: Colors.white,
                                             ),
                                           ),
                                         ],
                                       ),
                                     ),
                                   ),
                                 ),
                               ),
                               Container(
                                 height: Config.yMargin(context, 15),
                                 width: Config.xMargin(context, 45),
                                 child: Card(
                                   child: Center(
                                     child: Padding(
                                       padding: const EdgeInsets.only(top:8.0, bottom: 8.0),
                                       child: Row(
                                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: [
                                           Column(
                                             mainAxisAlignment: MainAxisAlignment.spaceAround,
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                             children: [
                                               Text("27%", style: appThemeDark.textTheme.title,),
                                               Text("-2.54", style: appThemeDark.textTheme.display2,),
                                               Text("Failed", style: appThemeDark.textTheme.title,)
                                             ],
                                           ),
                                           CircleAvatar(
                                             radius: 20,
                                             backgroundColor: Colors.red,

                                             child: Icon(
                                               Icons.stacked_line_chart_outlined,
                                               color: Colors.white,
                                             ),
                                           ),
                                         ],
                                       ),
                                     ),
                                   ),
                                 ),
                               )
                             ],
                           ),
                           SizedBox(height: 20,),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Container(
                                 height: Config.yMargin(context, 15),
                                 width: Config.xMargin(context, 45),

                                 child: Card(
                                   child: Padding(
                                     padding: const EdgeInsets.only(top:8.0, bottom: 8.0, left: 16),
                                     child: Column(
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         Text("24", style: appThemeDark.textTheme.title,),
                                         SizedBox(height: 15,),
                                         Text("Attempted", style: appThemeDark.textTheme.title,)
                                       ],
                                     ),
                                   ),
                                 ),
                               ),


                               Column(
                                 children: [
                                   InkWell(
                                     child: Container(
                                         height: Config.yMargin(context,4),
                                         width: Config.xMargin(context, 40),
                                         margin: const EdgeInsets.only(top: 10),
                                         decoration: BoxDecoration(
                                             borderRadius: BorderRadius.circular(5),
                                             color: appThemeDark.primaryColor
                                         ),
                                         child: Center(child: Text("Start Test",style: TextStyle(
                                             color: Colors.white
                                         ),))),
                                     onTap: (){

                                     },
                                   ),
                                   InkWell(
                                     child: Container(
                                         height: Config.yMargin(context,4),
                                         width: Config.xMargin(context, 40),
                                         margin: const EdgeInsets.only(top: 10),
                                         decoration: BoxDecoration(
                                             borderRadius: BorderRadius.circular(5),
                                             color: appThemeDark.primaryColor
                                         ),
                                         child: Center(child: Text("Start Quiz",style: TextStyle(
                                             color: Colors.white
                                         ),))),
                                     onTap: (){

                                     },
                                   )
                                 ],
                               ),


                             ],
                           )

                         ],


                       ),
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [
                           Text("Take test",style: appThemeDark.textTheme.title,),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text("EXAM",style: appThemeDark.textTheme.title),
                               Container(
                                 padding: const EdgeInsets.only(left:8.0,right: 8.0),
                                 //  p: const EdgeInsets.only(left: 4),
                                 width: Config.xMargin(context,30),
                                 height: Config.yMargin(context, 5),
                                 decoration: BoxDecoration(
                                     color: Colors.black12,
                                     borderRadius: BorderRadius.circular(5),
                                     border: Border.all(color: Colors.black12)
                                 ),
                                 child: DropdownButton<String>(
                                   value:exam,
                                   icon: Icon(Icons.keyboard_arrow_down),
                                   iconSize: 20,
                                   elevation: 16,
                                   isExpanded: true,
                                   style: TextStyle(
                                     //  color: Colors.deepPurple
                                   ),
                                   underline: Container(
                                       height: 2,
                                       color: Colors.transparent
                                   ),
                                   onChanged: (String newValue) {
                                     setState(() {
                                       exam = newValue;

                                     });


                                   },

                                   items: <String>["WASSCE","JAMB"]
                                       .map<DropdownMenuItem<String>>((String value) {
                                     return DropdownMenuItem<String>(
                                       value: value,
                                       child: Text(value.toString(), style: TextStyle(
                                           fontSize: 14,
                                           fontWeight: FontWeight.w400,
                                           color: Colors.black
                                       ),),
                                     );
                                   })
                                       .toList(),
                                 ),
                               ),
                             ],
                           ),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text("SUBJECT",style: appThemeDark.textTheme.title),
                               Container(
                                 padding: const EdgeInsets.only(left:8.0,right: 8.0),
                                 //  p: const EdgeInsets.only(left: 4),
                                 width: Config.xMargin(context,30),
                                 height: Config.yMargin(context, 5),
                                 decoration: BoxDecoration(
                                     color: Colors.black12,
                                     borderRadius: BorderRadius.circular(5),
                                     border: Border.all(color: Colors.black12)
                                 ),
                                 child: DropdownButton<String>(
                                   value:subject,
                                   icon: Icon(Icons.keyboard_arrow_down),
                                   iconSize: 20,
                                   elevation: 16,
                                   isExpanded: true,
                                   style: TextStyle(
                                     //  color: Colors.deepPurple
                                   ),
                                   underline: Container(
                                       height: 2,
                                       color: Colors.transparent
                                   ),
                                   onChanged: (String newValue) {
                                     setState(() {
                                       subject = newValue;

                                     });


                                   },

                                   items: <String>["Mathematics","Physics","Chemistry","Biology", "Chemistry","English","Economics"]
                                       .map<DropdownMenuItem<String>>((String value) {
                                     return DropdownMenuItem<String>(
                                       value: value,
                                       child: Text(value.toString(), style: TextStyle(
                                           fontSize: 14,
                                           fontWeight: FontWeight.w400,
                                           color: Colors.black
                                       ),),
                                     );
                                   })
                                       .toList(),
                                 ),
                               ),
                             ],
                           ),

                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text("PAPER",style: appThemeDark.textTheme.title),
                               Container(
                                 padding: const EdgeInsets.only(left:8.0,right: 8.0),
                                 //  p: const EdgeInsets.only(left: 4),
                                 width: Config.xMargin(context,20),
                                 height: Config.yMargin(context, 5),
                                 decoration: BoxDecoration(
                                     color: Colors.black12,
                                     borderRadius: BorderRadius.circular(5),
                                     border: Border.all(color: Colors.black12)
                                 ),
                                 child: DropdownButton<int>(
                                   value:paperNo,
                                   icon: Icon(Icons.keyboard_arrow_down),
                                   iconSize: 20,
                                   elevation: 16,
                                   isExpanded: true,
                                   style: TextStyle(
                                     //  color: Colors.deepPurple
                                   ),
                                   underline: Container(
                                       height: 2,
                                       color: Colors.transparent
                                   ),
                                   onChanged: (int newValue) {
                                     setState(() {
                                       paperNo = newValue;

                                     });


                                   },

                                   items: <int>[1,2,3,4,5,6,7]
                                       .map<DropdownMenuItem<int>>((int value) {
                                     return DropdownMenuItem<int>(
                                       value: value,
                                       child: Text(value.toString(), style: TextStyle(
                                           fontSize: 14,
                                           fontWeight: FontWeight.w400,
                                           color: Colors.black
                                       ),),
                                     );
                                   })
                                       .toList(),
                                 ),
                               ),
                             ],
                           ),


                           Container(
                             width: Config.xMargin(context, 100),
                             height: Config.yMargin(context, 6.5),
                             decoration: BoxDecoration(
                                 color: appThemeDark.buttonColor,
                                 borderRadius: BorderRadius.circular(15)
                             ),
                             child: FlatButton(
                               onPressed: (){

                              Navigator.of(context).pushNamed(TakeTest.routeName, arguments: {"exam":"$exam","paper":"Paper $paperNo","subject":"$subject"});

                               },
                               child: Text('Continue',style: appThemeDark.textTheme.display3,),
                             ),
                           ),


                         ],


                       ),
                     ], ),
               ),

              ],
            ),
          ),



        ),
      ),
    );
  }
}
