import 'dart:async';
import 'dart:convert';

import 'package:dreezeacademy/Model/taketestModel.dart';
import 'package:dreezeacademy/Size_Config/Config.dart';
import 'package:dreezeacademy/apptheme/app_theme.dart';
import 'package:dreezeacademy/screen/Assessment.dart';
import 'package:flutter/cupertino.dart';
//import 'package:dreezeacademy/database/databaseopener.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TakeTest extends StatefulWidget {
  static final routeName = '/test';
  @override
  _TakeTestState createState() => _TakeTestState();
}

class _TakeTestState extends State<TakeTest> {
  String _year = "";
  String _exam = "";
  String _paper = "";
  int _counter = 1;
  String _selectedOption = "N";
  final interval = const Duration(seconds: 1);
  Timer _timer;
  bool _lastQuestion = false;
  bool _timeUp = false;
  List<TakeTestProvider> questions = [];
  bool _disposed = false;
  // final dbHelper = DataBaseOpener.instance;

  final int timerMaxSeconds = 50;

  int currentSeconds = 0;
  Map<int, String> options = Map();
  Stream<List<TakeTestProvider>> stream;

  Future<List<TakeTestProvider>> getData(
      String year, String exam, String subject) async {
    print("Imhere");
    List<TakeTestProvider> list = [];
    // var url = Uri.https("www.dreezeacademy.com", "/topicMobile.php", { "year" : "$year" ,"exam" : "$exam" ,"subject" : "$subject" });
    // print("Imhere");
    //  var response  = await http.get(url);
    //  var url = 'https://www.dreezeacademy.com/QandA.php';
    //  var map = {"videoT": "fractions"};
    var uri = Uri.https('www.dreezeacademy.com', '/QandA.php');

    var response = await http.get(uri);
    if (response.statusCode == 200) {
      // String stringre = response.body.toString();
      try {
        var parsedJson = jsonDecode(response.body) as List;
        for (int i = 0; i < parsedJson.length; i++) {
          TakeTestProvider _json = TakeTestProvider.fromJson(parsedJson[i]);
          list.add(_json);
        }

        return list;
      } catch (Exception) {
        print(Exception.toString());
        return list;
      }
    } else {
      return list;
    }
  }

  void _NextFunction() {
    if (_counter < 50) {
      if (options.containsKey(_counter)) {
        setState(() {
          _selectedOption = options[_counter];
        });
      } else {
        _selectedOption = "N";
      }

      setState(() {
        _selectedOption = "N";
        _counter++;
      });
    } else {
      setState(() {
        _lastQuestion = true;
      });

      setState(() {
        _selectedOption = "N";
        _counter++;
      });
    }
  }

  void _PreviousFunction() {
    if (_counter != 0) {
      setState(() {
        _counter--;
        _selectedOption = "N";
      });
    }
    if (options.containsKey(_counter)) {
      setState(() {
        _selectedOption = options[_counter];
      });
    } else {
      _selectedOption = "N";
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    final arg =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final year = arg['paper'];
    final exam = arg['exam'];
    final subject = arg['subject'];

    stream = new Stream.fromFuture(getData(year, exam, subject));
    setState(() {
      _year = year;
      _exam = exam;
      _paper = subject;
    });
    print(year);

    print(exam);
    print(subject);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final arg =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;

    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
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
                    "Assessments",
                    style: appThemeDark.textTheme.title,
                  ),
                  Text(
                    "$timerText",
                    style: appThemeDark.textTheme.title,
                  ),
                ],
              ),
            ),
            Card(
              child: Container(
                height: Config.yMargin(context, 6),
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "$_year",
                      style: appThemeDark.textTheme.title,
                    ),
                    Row(
                      children: [
                        Text(
                          "Question",
                          style: appThemeDark.textTheme.display1,
                        ),
                        Container(
                          padding: const EdgeInsets.all(3.0),
                          child: DropdownButton<int>(
                            value: _counter,
                            icon: Icon(Icons.keyboard_arrow_down),
                            iconSize: 20,
                            elevation: 16,
                            style: TextStyle(
                                //  color: Colors.deepPurple
                                ),
                            underline:
                                Container(height: 2, color: Colors.transparent),
                            onChanged: (int newValue) {
                              setState(() {
                                _counter = newValue;
                              });
                            },
                            items: <int>[
                              1,
                              2,
                              3,
                              4,
                              5,
                              6,
                              7,
                              8,
                              9,
                              10,
                              11,
                              12,
                              13,
                              14,
                              15,
                              16,
                              17,
                              18,
                              19,
                              20,
                              21,
                              22,
                              23,
                              24,
                              25,
                              26,
                              27,
                              28,
                              29,
                              30
                            ].map<DropdownMenuItem<int>>((int value) {
                              return DropdownMenuItem<int>(
                                value: value,
                                child: Text(
                                  value.toString(),
                                  style: appThemeDark.textTheme.display1,
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Stack(
              children: [
                new SizedBox(
                  height: 2.5,
                  child: new Container(
                    margin:
                        new EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                    height: 2.5,
                    color: appThemeDark.buttonColor,
                  ),
                ),
                Container(
                  height: 5,
                  child: ListView.builder(
                    itemCount: 50,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (ctx, indexcolor) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Container(
                          height: 5,
                          width: 5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(45),
                              color: appThemeDark.buttonColor),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: Config.yMargin(context, 5),
              child: ListView.builder(
                  itemCount: 50,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 5.5),
                      child: Text(index.toString()),
                    );
                  }),
            ),
            StreamBuilder(
                stream: stream,
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (!snapshot.hasData) {
                    return Expanded(
                      child: Center(
                          child: CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(
                            appThemeDark.buttonColor),
                      )),
                    );
                  }
                  startTimeout();
                  questions = snapshot.data;
                  return Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: Config.yMargin(context, 23),
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Question $_counter",
                                style: appThemeDark.textTheme.title,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text("${questions[_counter - 1].question}"),
                              Expanded(
                                child: Container(),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 15,
                                        width: 63,
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        decoration: BoxDecoration(
                                            color: Color.fromRGBO(
                                                129, 206, 172, 1),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Icon(
                                              Icons.bookmark_border,
                                              size: 9.27,
                                              color: Colors.white,
                                            ),
                                            Text(
                                              "Bookmark",
                                              style: TextStyle(
                                                  fontSize: 7,
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        height: 15,
                                        width: 56,
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        decoration: BoxDecoration(
                                            color:
                                                Color.fromRGBO(249, 24, 24, 1),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Icon(
                                              Icons.flag,
                                              size: 9.27,
                                              color: Colors.white,
                                            ),
                                            Text(
                                              "Flag",
                                              style: TextStyle(
                                                  fontSize: 7,
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      InkWell(
                                        child: Container(
                                          height: 15.53,
                                          width: 22.81,
                                          decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  129, 206, 172, 1),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Center(
                                            child: Icon(
                                              Icons.arrow_back,
                                              size: 9.27,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          _PreviousFunction();
                                        },
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      InkWell(
                                        child: Container(
                                          height: 15.53,
                                          width: 22.81,
                                          decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  107, 17, 253, 1),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Center(
                                            child: Icon(
                                              Icons.arrow_forward_outlined,
                                              size: 9.27,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          _NextFunction();
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Options",
                                  style: appThemeDark.textTheme.title,
                                ),
                                InkWell(
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 25,
                                        width: 25,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(90),
                                            border: Border.all(
                                                color: _selectedOption == "A"
                                                    ? appThemeDark.buttonColor
                                                    : Colors.black)),
                                        child: Center(child: Text("A")),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("${questions[_counter - 1].chA}")
                                    ],
                                  ),
                                  onTap: () {
                                    _SelectedMethod("A", _counter);
                                  },
                                ),
                                InkWell(
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 25,
                                        width: 25,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(90),
                                            border: Border.all(
                                                color: _selectedOption == "B"
                                                    ? appThemeDark.buttonColor
                                                    : Colors.black)),
                                        child: Center(child: Text("B")),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("${questions[_counter - 1].chB}")
                                    ],
                                  ),
                                  onTap: () {
                                    _SelectedMethod("B", _counter);
                                  },
                                ),
                                InkWell(
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 25,
                                        width: 25,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(90),
                                            border: Border.all(
                                                color: _selectedOption == "C"
                                                    ? appThemeDark.buttonColor
                                                    : Colors.black)),
                                        child: Center(child: Text("C")),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("${questions[_counter - 1].chC}")
                                    ],
                                  ),
                                  onTap: () {
                                    _SelectedMethod("C", _counter);
                                  },
                                ),
                                InkWell(
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 25,
                                        width: 25,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(90),
                                            border: Border.all(
                                                color: _selectedOption == "D"
                                                    ? appThemeDark.buttonColor
                                                    : Colors.black)),
                                        child: Center(child: Text("D")),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("${questions[_counter - 1].chD}")
                                    ],
                                  ),
                                  onTap: () {
                                    _SelectedMethod("D", _counter);
                                  },
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
    ));
  }

  void _SelectedMethod(String option, int counter) {
    setState(() {
      _selectedOption = option;
    });
    if (options.containsKey(counter)) {
      options.update(counter, (value) => option);
    } else {
      options.putIfAbsent(counter, () => option);
    }
  }

  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';
  startTimeout([int milliseconds]) {
    var duration = interval;
    _timer = Timer.periodic(duration, (timer) {
      if (!_disposed) {
        setState(() {
          // print(timer.tick);
          currentSeconds = timer.tick;
          if (timer.tick >= timerMaxSeconds || _timeUp == true) {
            if (!options.containsKey(_counter)) {
              _SelectedMethod("N", _counter);
            }
            timer.cancel();
            _Finish();
            // _controllerA.dispose();
            // _controllerB.dispose();

          }
        });
      }
    });
  }

  void _Finish() {
    // for(int i = 0; i < questions.length;i++) {
    //    Map<String, dynamic> row = {
    //      DataBaseOpener.columequestion: '${questions[0].question}',
    //      DataBaseOpener.columechA: '${questions[0].chA}',
    //      DataBaseOpener.columechB: '${questions[0].chB}',
    //      DataBaseOpener.columechC: '${questions[0].chC}',
    //      DataBaseOpener.columechD: '${questions[0].chD}',
    //      DataBaseOpener.columeAnswer: '${questions[0].choice}',
    //      DataBaseOpener.columeSelected: '${options[0]}'
    //    };
    //    dbHelper.inserttest(row, "$_year $_exam $_paper".replaceAll(' ', ''));
    //  }
    Navigator.of(context).pushReplacementNamed(Assessment.routeName);
  }
}
