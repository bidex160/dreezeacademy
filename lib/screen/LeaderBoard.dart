import 'package:dreezeacademy/Model/LeaderModel.dart';
import 'package:dreezeacademy/Size_Config/Config.dart';
import 'package:dreezeacademy/apptheme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Model/LeaderModel.dart';

class LeaderBoard extends StatefulWidget {
  @override
  _LeaderBoardState createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  String dropdownValue = 'SS1';
  int _selection = 1;
  List<LeaderBoardModel> _leaderlist = [];
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
                    Text(
                      "Leaderboard",
                      style: appThemeDark.textTheme.title,
                    ),
                    Row(
                      children: [
                        IconButton(
                            icon: Icon(Icons.search),
                            onPressed: () {
                              showSearch(
                                  context: context,
                                  delegate: MoviesSearchDelegate(_leaderlist));
                            }),
                        IconButton(
                            icon: Icon(Icons.filter_list), onPressed: () {}),
                        Container(
                          padding: const EdgeInsets.all(3.0),
                          height: Config.yMargin(context, 4),
                          decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black12)),
                          child: DropdownButton<String>(
                            value: dropdownValue,
                            icon: Icon(Icons.keyboard_arrow_down),
                            iconSize: 20,
                            elevation: 16,
                            style: TextStyle(
                                //  color: Colors.deepPurple
                                ),
                            underline:
                                Container(height: 2, color: Colors.transparent),
                            onChanged: (String newValue) {
                              setState(() {
                                dropdownValue = newValue;
                              });
                            },
                            items: <String>['SS1', 'SS2', 'SS3']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                ),
                              );
                            }).toList(),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 50),
                  height: Config.yMargin(context, 18),
                  width: Config.xMargin(context, 60),
                  child: Center(
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            height: 110,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "1",
                                  style: TextStyle(
                                      fontFamily: 'Raleway',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.blue, width: 2),
                                    borderRadius: BorderRadius.circular(90),
                                  ),
                                  child: CircleAvatar(
                                    radius: 40,
                                    backgroundImage:
                                        AssetImage('images/biology.png'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 35,
                          child: Row(
                            children: [
                              Text(
                                "2",
                                style: TextStyle(
                                    fontFamily: 'Raleway',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    AssetImage('images/chemistry.png'),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 25,
                          right: 25,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundImage:
                                    AssetImage('images/physics.png'),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "3",
                                style: TextStyle(
                                    fontFamily: 'Raleway',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //    height: Config.yMargin(context, 90),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Container(
                              height: Config.yMargin(context, 4),
                              child: FlatButton(
                                child: Text(
                                  "Local",
                                  style: appThemeDark.textTheme.title,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _selection = 1;
                                  });
                                },
                              ),
                            ),
                            Container(
                              height: 4,
                              width: 20,
                              decoration: BoxDecoration(
                                  color: _selection == 1
                                      ? Colors.lightBlue
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(15)),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: Config.yMargin(context, 4),
                              child: FlatButton(
                                child: Text(
                                  "International",
                                  style: appThemeDark.textTheme.title,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _selection = 2;
                                  });
                                },
                              ),
                            ),
                            Container(
                              height: 4,
                              width: 20,
                              decoration: BoxDecoration(
                                  color: _selection == 2
                                      ? Colors.lightBlue
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(15)),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: Config.yMargin(context, 4),
                              child: FlatButton(
                                child: Text(
                                  "State",
                                  style: appThemeDark.textTheme.title,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _selection = 3;
                                  });
                                },
                              ),
                            ),
                            Container(
                              height: 4,
                              width: 20,
                              decoration: BoxDecoration(
                                  color: _selection == 3
                                      ? Colors.lightBlue
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(15)),
                            )
                          ],
                        )
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: 10,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (ctx, index) {
                            return Container(
                              //  height: Config.yMargin(context, 3.5),
                              child: ListTile(
                                leading: Text(
                                  (index + 1).toString(),
                                  style: appThemeDark.textTheme.title,
                                ),
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Name",
                                      style: appThemeDark.textTheme.title,
                                    ),
                                    Text("84%",
                                        style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black54)),
                                  ],
                                ),
                                trailing: Text(
                                  "24 Attempted",
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black54),
                                ),
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MoviesSearchDelegate extends SearchDelegate<LeaderBoardModel> {
  List<LeaderBoardModel> _leaderboardList;
  MoviesSearchDelegate(this._leaderboardList);

  // @override
  // ThemeData appBarTheme(BuildContext context) {
  //   final ThemeData theme = ThemeData.dark();
  //   return theme.copyWith(
  //       cursorColor: appThemeDark.buttonColor,
  //       inputDecorationTheme: InputDecorationTheme(
  //
  //           hintStyle: TextStyle(color: theme.primaryTextTheme.title.color),
  //           filled: true,
  //
  //           fillColor: appThemeDark.primaryColorLight,
  //           border: OutlineInputBorder(
  //             borderRadius: BorderRadius.all(Radius.circular(15)),
  //             borderSide: BorderSide(color:Colors.white),
  //           ),
  //           focusedBorder: OutlineInputBorder(
  //
  //             borderRadius: BorderRadius.all(Radius.circular(15)),
  //             borderSide: BorderSide(color:Colors.white),
  //           ),
  //           isDense: true,
  //           contentPadding: EdgeInsets.only(top: 25, left: 10),
  //           enabledBorder: OutlineInputBorder(
  //               borderRadius: BorderRadius.circular(15)
  //           )),
  //       primaryColor:  Color.fromRGBO(33, 32, 41, 1),
  //       primaryColorLight:Color.fromRGBO(33, 32, 41, 1),
  //       primaryColorDark: Colors.blueGrey.shade900,
  //       scaffoldBackgroundColor: Color.fromRGBO(24, 22, 29, 1),
  //       primaryIconTheme: theme.primaryIconTheme.copyWith(color: Colors.white),
  //       backgroundColor:   Color.fromRGBO(24, 22, 29, 1),
  //
  //       primaryColorBrightness: Brightness.dark,
  //       primaryTextTheme: theme.primaryTextTheme,
  //       textTheme: theme.textTheme.copyWith(
  //           title: theme.textTheme.title
  //               .copyWith(color: theme.primaryTextTheme.title.color)));
  // }
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () async {
            await SystemChrome.setEnabledSystemUIOverlays(
                SystemUiOverlay.values);
            Navigator.pop(context);
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () async {
          await SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
          Navigator.pop(context);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
        child: Text(
      "You have not select any item...",
      style: TextStyle(color: Colors.white, fontSize: 12),
      overflow: TextOverflow.ellipsis,
    ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    var mylist = query.isEmpty
        ? this._leaderboardList
        : this
            ._leaderboardList
            .where((element) =>
                element.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
    print(query);
    print(mylist.length);
    return mylist.isEmpty
        ? Center(
            child: Text(
            "No Result Found...",
            style: TextStyle(color: Colors.white, fontSize: 30),
          ))
        : ListView.builder(
            itemCount: mylist.length,
            itemBuilder: (ctx, index) {
              return Container(
                //  height: Config.yMargin(context, 3.5),
                child: ListTile(
                  leading: Text(
                    (index + 1).toString(),
                    style: appThemeDark.textTheme.title,
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Name",
                        style: appThemeDark.textTheme.title,
                      ),
                      Text("84%",
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black54)),
                    ],
                  ),
                  trailing: Text(
                    "24 Attempted",
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54),
                  ),
                ),
              );
            });
  }
}
