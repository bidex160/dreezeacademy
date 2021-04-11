import 'dart:io';
import 'package:dreezeacademy/Size_Config/Config.dart';
import 'package:dreezeacademy/apptheme/app_theme.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File _imageFile;
  final ImagePicker _picker = ImagePicker();
  String username='';
  String email ='';
  String dropdownValue = 'Light';
  void fetchdetails() async{
    final  sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      username = sharedPreferences.getString('username');
      email = sharedPreferences.getString('email');
      if(sharedPreferences.getString("image") != null){
        _imageFile = File(sharedPreferences.getString("image").trim());
      }

    });

  }
  Future<void> imagepicker ()async{
    SharedPreferences.setMockInitialValues({});
    final  sharedPreferences = await SharedPreferences.getInstance();
    final picked = await _picker.getImage(source: ImageSource.gallery,);

    setState(() {
      _imageFile = File(picked.path) ;
    });
    sharedPreferences.setString("image", picked.path);


  }
  bool _switch =true;
  @override
  void initState() {
   fetchdetails();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: Config.yMargin(context, 24),
             decoration: BoxDecoration(
               color: Colors.white
             ),
              child: Stack(
                children: [
                   Container(
                     height: Config.yMargin(context, 20),
                     decoration: BoxDecoration(
                         color: Color.fromRGBO(106, 204,424,1)
                     ),
                   ),
                   Positioned(
                     left: 25,
                     bottom: 0,
                     child: Container(
                       child: Row(
                         children: [
                           Container(
                             color: Colors.transparent,
                             child: Stack(
                               alignment: Alignment.bottomRight,
                               children: [
                                  CircleAvatar(
                                   radius: 30,
                                   backgroundImage: AssetImage('images/physics.png'),
                                 ),
                                 Align(
                                   alignment: Alignment.bottomRight,

                                   child: Container(
                                     alignment: Alignment.bottomRight,
                                     height: Config.yMargin(context, 3.0),
                                   padding: const EdgeInsets.only(right: 6.0),
                                     width: Config.xMargin(context, 6.0),
                                     decoration: BoxDecoration(
                                         color: Colors.blue,
                                         borderRadius: BorderRadius.circular(90)
                                     ),
                                     child: IconButton(
                                         icon: Icon(
                                           Icons.edit_rounded,
                                           size: 15,
                                         ), onPressed:(){

                                     }),

                                   ),
                                 )
                               ],

                             ),
                           ),
                           SizedBox(width: 10,),
                           Column(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text(username != null?username:"Username",style: TextStyle(
                                   fontFamily: 'Raleway',
                                   fontSize: 20,
                                   fontWeight: FontWeight.w500,
                                   fontStyle: FontStyle.normal,
                                   color: Colors.white
                               ),),
                               SizedBox(height: 6,),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 children: [
                                   Icon(
                                     Icons.location_on_rounded,
                                     size: 15,
                                       color: Colors.black54
                                   ),
                                   Text("Ikeja,Lagos",style: TextStyle(
                                       fontFamily: 'Raleway',
                                       fontSize: 16,
                                       fontWeight: FontWeight.w400,
                                       fontStyle: FontStyle.normal,
                                       color: Colors.black54
                                   ),)
                                 ],
                               )
                             ],
                           )
                         ],
                       ),
                     ),
                   )
                ],
              ),
            ),
            SizedBox(height: Config.yMargin(context, 5),),


            Container(
              padding: const EdgeInsets.only(left: 17,right: 17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Text("Profile Settings", style: appThemeDark.textTheme.subtitle,),
              Divider(
                color: Colors.black54,
              ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     Text("Theme", style: TextStyle(
                         fontFamily: 'Raleway',
                         fontSize: 14,
                         fontWeight: FontWeight.w400,
                         fontStyle: FontStyle.normal,
                         color:Colors.black54
                     )),
                      Container(
                        padding: const EdgeInsets.all(3.0),
                        height: Config.yMargin(context, 4),

                        child: DropdownButton<String>(
                          value: dropdownValue,
                          icon: Icon(Icons.keyboard_arrow_down,
                          color: Colors.blue,),
                          iconSize: 20,
                          elevation: 16,
                          style: TextStyle(
                            //  color: Colors.deepPurple
                          ),
                          underline: Container(
                              height: 2,
                              color: Colors.transparent
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue = newValue;
                            });
                          },
                          items: <String>['Light', 'Dark']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value, style: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  color:Colors.black54
                              )),
                            );
                          })
                              .toList(),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Text("Push Notifications", style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color:Colors.black54
                      )),
                      Switch(value:_switch,
                          activeTrackColor: Colors.blue,


                     //   activeTrackColor: Colors.white,
                          activeColor: Colors.blue,

                          onChanged: (onChanged){
                               setState(() {
                                 _switch =onChanged;
                               });
                      })

                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: Config.yMargin(context, 5),),


            Container(
              padding: const EdgeInsets.only(left: 17,right: 17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Account", style: appThemeDark.textTheme.subtitle,),
                  Divider(
                    color: Colors.black54,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Two factor authentication", style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color:Colors.black54
                      )),
                     IconButton(icon: Icon(
                       Icons.arrow_forward_ios,
                       color: Colors.blue,
                       size: 15,

                     ), onPressed: (){})
                    ],
                  ),

                ],
              ),
            ),
            SizedBox(height: Config.yMargin(context, 5),),
            Container(
              padding: const EdgeInsets.only(left: 17,right: 17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Support", style: appThemeDark.textTheme.subtitle,),
                  Divider(
                    color: Colors.black54,
                  ),
                  SizedBox(height: 15,),
                  InkWell(
                    child: Text("Contact us", style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color:Colors.black54
                    )),
                    onTap: (){},
                  ),
                  SizedBox(height: 15,),
                  InkWell(
                    child: Text("FAQs", style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color:Colors.black54
                    )),
                    onTap: (){},
                  )
                ],
              ),
            )

          ],

        ));
  }
}
