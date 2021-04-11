import 'package:dreezeacademy/Size_Config/Config.dart';
import 'package:dreezeacademy/apptheme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {

  String dropdownValue = 'SS1';
  String username="";
  String filterValue = "";
  @override
  void initState() {
   fetchdetails();
    super.initState();
  }
  void fetchdetails()async{
    final sharedPreferences = await SharedPreferences.getInstance();
   setState(() {
     username = sharedPreferences.getString('username');
   });

  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(

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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Dreeze Learning", style: appThemeDark.textTheme.title,),

                    Row(
                      children: [
                        IconButton(icon: Icon(
                            Icons.search
                        ), onPressed: (){
                          fetchdetails();
                        }),
                        PopupMenuButton<String>(

                          itemBuilder: (context) => [
                            PopupMenuItem(
                                value: "maths",
                                child: Text("Maths")),
                            PopupMenuItem(
                                value: "physics",
                                child: Text("Physics")),
                            PopupMenuItem(
                                value: "chemistry",
                                child: Text("Chemistry")),
                            PopupMenuItem(
                                value: "gov",
                                child: Text("Gov")
                            ),

                            PopupMenuItem(
                                value: "econs",
                                child: Text("Economics")
                            ),
                          ],
                          icon: Icon(Icons.filter_list) ,

                          initialValue: "maths",
                          onCanceled: (){

                          },
                          onSelected: (value){
                            setState(() {
                              filterValue = value;
                            });
                          },
                        ),
                        Container(
                          padding: const EdgeInsets.all(3.0),
                          height: Config.yMargin(context, 4),
                          margin: const EdgeInsets.only(left: 4),
                          decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black12)
                          ),
                          child: DropdownButton<String>(
                            value: dropdownValue,
                            icon: Icon(Icons.keyboard_arrow_down),
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
                            items: <String>['SS1', 'SS2', 'SS3']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value, style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black
                                ),),
                              );
                            })
                                .toList(),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      //    height: Config.yMargin(context, 90),
                      children: [

                        Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage: AssetImage("images/daLogo.png"),
                            ),
                            SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Welcome", style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 17
                                )),
                                Text(username != null?username:"",style: appThemeDark.textTheme.title,)
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.lightBlue.shade100,

                                  child: Icon(
                                    Icons.replay,
                                    color: Colors.blue.shade900,
                                  ),
                                ),
                                Text("Topics")
                              ],
                            ),
                            Column(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.lightGreen.shade100,

                                  child: Icon(
                                    Icons.stacked_line_chart_outlined,
                                    color: Colors.green.shade900,
                                  ),
                                ),
                                Text("Learning Stats")
                              ],
                            ),
                            Column(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.deepPurple.shade100,

                                  child: Icon(
                                    Icons.question_answer,
                                    color: Colors.deepPurple.shade900,
                                  ),
                                ),
                                Text("Q&A")
                              ],
                            ),
                            Column(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.deepOrange.shade100,

                                  child: Icon(
                                    Icons.replay,
                                    color: Colors.deepOrange.shade400,
                                  ),
                                ),
                                Text("Bookmarks")
                              ],
                            ),

                          ],
                        ),
                        SizedBox(height: 30,),
                        Text("Top Courses", style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 12

                        ),),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: Config.yMargin(context, 17),
                              width: Config.xMargin(context, 43),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                //  border: Border.all(color: Colors.pink)
                              ),
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage('images/mathematics.png')
                                        )
                                    ),
                                    //      child: Image.asset('images/mathematics.png')
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      padding: const EdgeInsets.all(8.0),
                                      height: Config.yMargin(context, 3.5),
                                      width: Config.xMargin(context, 100),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8),
                                            bottomRight: Radius.circular(8)),
                                        color: Colors.pink,
                                      ),

                                      child: Text("Mathematics", style:  TextStyle(
                                          fontFamily: 'Raleway',
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 11

                                      ),),
                                    ),
                                  ),


                                ],
                              ),
                            ),
                            Container(
                              height: Config.yMargin(context, 17),
                              width: Config.xMargin(context, 43),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                //  border: Border.all(color: Colors.pink)
                              ),
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage('images/physics.png')
                                        )
                                    ),
                                    //      child: Image.asset('images/mathematics.png')
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      padding: const EdgeInsets.all(8.0),
                                      height: Config.yMargin(context, 3.5),
                                      width: Config.xMargin(context, 100),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8),
                                            bottomRight: Radius.circular(8)),
                                        color: Colors.green.shade800,
                                      ),

                                      child: Text("Physics", style:  TextStyle(
                                          fontFamily: 'Raleway',
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 11

                                      ),),
                                    ),
                                  ),


                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: Config.yMargin(context, 17),
                              width: Config.xMargin(context, 43),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                //  border: Border.all(color: Colors.pink)
                              ),
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage('images/biology.png')
                                        )
                                    ),
                                    //      child: Image.asset('images/mathematics.png')
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      padding: const EdgeInsets.all(8.0),
                                      height: Config.yMargin(context, 3.5),
                                      width: Config.xMargin(context, 100),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8),
                                              bottomRight: Radius.circular(8)),
                                          color: Colors.orange
                                      ),

                                      child: Text("Biology", style:  TextStyle(
                                          fontFamily: 'Raleway',
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 11

                                      ),),
                                    ),
                                  ),


                                ],
                              ),
                            ),
                            Container(
                              height: Config.yMargin(context, 17),
                              width: Config.xMargin(context, 43),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                //  border: Border.all(color: Colors.pink)
                              ),
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage('images/chemistry.png')
                                        )
                                    ),
                                    //      child: Image.asset('images/mathematics.png')
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      padding: const EdgeInsets.all(8.0),
                                      height: Config.yMargin(context, 3.5),
                                      width: Config.xMargin(context, 100),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8),
                                            bottomRight: Radius.circular(8)),
                                        color: Colors.brown,
                                      ),

                                      child: Text("Chemistry", style:  TextStyle(
                                          fontFamily: 'Raleway',
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 11

                                      ),),
                                    ),
                                  ),


                                ],
                              ),
                            ),
                          ],
                        ),


                      ],


                    )),
              ),
            ],
          ),
        ),



      ),
    );
  }
}
