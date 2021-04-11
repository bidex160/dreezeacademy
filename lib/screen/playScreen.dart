import 'package:dreezeacademy/Model/playModel.dart';
import 'package:dreezeacademy/Size_Config/Config.dart';
import 'package:dreezeacademy/apptheme/app_theme.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';

class PlayScreen extends StatefulWidget {
  static final routeName = '/class';
  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  Stream<List<VideosModelProvider>> stream;
  VideosModelProvider _currentPlaying = VideosModelProvider();
  List<VideosModelProvider> topics = [];
  FlickManager flickManager;
  VideoPlayerController _controller;
  var _disposed = false;
  int _playing = -1;
  var _duration = 0;
  var _position = 0;
  String error = "";
  Future<List<VideosModelProvider>> getData(String topic) async {
    List<VideosModelProvider> list = [];
    var map = {"videoT": "fractions"};
    var uri = Uri.https('www.dreezeacademy.com', '/videos_app.php', map);
    var url = 'https://www.dreezeacademy.com/videos_app.php?videoT=fractions';

    var response = await http.get(uri);
    if (response.statusCode == 200) {
      try {
        var parsedJson = jsonDecode(response.body) as Map<String, dynamic>;
        parsedJson.forEach((key, value) {
          var second = value as Map<String, dynamic>;
          VideosModelProvider _json = VideosModelProvider.fromJson(second);
          list.add(_json);
        });
        setState(() {
          _currentPlaying = list[0];
        });
        _initializeAndPlay();
        // print("${_currentPlaying.videoSource.replaceAll(' ', "%20")}");
        // player.setDataSource("https://www.dreezeacademy.com${_currentPlaying.videoSource.replaceAll(' ', "%20")}", autoPlay: true,);
        return list;
      } catch (Exception) {
        print(Exception.toString());
        return list;
      }
    } else {
      return list;
    }
  }

  void _initializeAndPlay() async {
    // print("_initializeAndPlay ---------> $index");
    try {
      final controller = VideoPlayerController.network(
          "https://www.dreezeacademy.com${_currentPlaying.videoSource.replaceAll(' ', "%20")}");
      final old = _controller;
      _controller = controller;
      if (old != null) {
        old.removeListener(_onControllerUpdated);
        await old.pause();
      }
      setState(() {
        //   _title =widget.channels[pageIndex].subhead[index].title;
        debugPrint("---- controller changed");
      });

      controller
        ..initialize().then((_) {
          debugPrint("---- controller initialized");
          old?.dispose();
          controller.addListener(_onControllerUpdated);
          controller.play();
          setState(() {
            _playing = 0;
          });
        });

      flickManager = FlickManager(
          autoPlay: true,
          autoInitialize: true,
          videoPlayerController: controller);
    } catch (e) {
      setState(() {
        error = e.toString();
      });
    }
  }

  Future<void> _onControllerUpdated() async {
    if (_disposed) return;
    final controller = _controller;
    if (controller == null) return;
    if (!controller.value.isInitialized) return;
    final position = await controller.position;
    final duration = controller.value.duration;
    if (position == null || duration == null) return;

    final playing = controller.value.isPlaying;
    final isEndOfClip =
        position.inMilliseconds > 0 && position.inSeconds == duration.inSeconds;

    // blocking too many updation
    final interval = position.inMilliseconds / 250.0;

    if (playing) {
      setState(() {
        _duration = duration.inMilliseconds;
        _position = position.inMilliseconds;
      });
    }

    // handle clip end
  }

  void _changeVideo(VideosModelProvider currentPlaying) async {
    print(
        "https://www.dreezeacademy.com${currentPlaying.videoSource.replaceAll(' ', "%20")}");
    final controller = VideoPlayerController.network(
        "https://www.dreezeacademy.com${currentPlaying.videoSource.replaceAll(' ', "%20")}");
    final old = _controller;
    _controller = controller;
    if (old != null) {
      old.removeListener(_onControllerUpdated);
      await old.pause();
      //  old?.dispose();
    }
    setState(() {
      //   _title =widget.channels[pageIndex].subhead[index].title;
      debugPrint("---- controller changed");
    });

    controller
      ..initialize().then((_) {
        debugPrint("---- controller initialized");
        old?.dispose();
        controller.addListener(_onControllerUpdated);
        controller.play();
        setState(() {});
      });
    flickManager.handleChangeVideo(controller);
  }

  @override
  void didChangeDependencies() {
    // final args =
    //     ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    // String topic = args['topic'];
    // stream = new Stream.fromFuture(getData(topic));
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    _initializeAndPlay();
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                height: Config.yMargin(context, 33),
                // color: Colors.red,
                child: Column(
                  children: [
                    _currentPlaying != null
                        ? AspectRatio(
                            aspectRatio: 16 / 9,
                            child: FlickVideoPlayer(
                                //   wakelockEnabledFullscreen: true,

                                flickManager: flickManager),
                          )
                        : AspectRatio(
                            aspectRatio: 16 / 9,
                            child: Container(
                              color: appThemeDark.primaryColorDark,
                              child: Center(
                                  child: CircularProgressIndicator(
                                valueColor: new AlwaysStoppedAnimation<Color>(
                                    Colors.white),
                              )),
                            ),
                          ),
                    Container(
                      padding: const EdgeInsets.only(left: 23, right: 23),
                      child: Row(
                        children: [
                          IconButton(
                              icon: Icon(Icons.thumb_up),
                              onPressed: () {
                                print(_currentPlaying.videoSource);
                              }),
                          IconButton(
                              icon: Icon(Icons.thumb_down), onPressed: () {}),
                          Expanded(child: Container()),
                          IconButton(icon: Icon(Icons.share), onPressed: () {})
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // StreamBuilder(
              //     stream: stream,
              //     builder:
              //         (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              //       if (!snapshot.hasData) {
              //         return Expanded(
              //           child: Center(
              //               child: CircularProgressIndicator(
              //             valueColor: new AlwaysStoppedAnimation<Color>(
              //                 appThemeDark.buttonColor),
              //           )),
              //         );
              //       }
              //       topics = snapshot.data;
              //       return Container();
              //       //  return Expanded(
              //       //     child: ListView.builder(
              //       //         padding: const EdgeInsets.only(left: 23, right: 23),
              //       //         itemCount: topics.length,
              //       //         shrinkWrap: true,
              //       //         itemBuilder: (ctx, index) {
              //       //           return InkWell(
              //       //             child: Padding(
              //       //               padding: const EdgeInsets.only(bottom: 30),
              //       //               child: Container(
              //       //                 decoration: BoxDecoration(
              //       //                   borderRadius: BorderRadius.circular(5),
              //       //                   //  color: Colors.grey
              //       //                 ),
              //       //                 height: 60,
              //       //                 child: Row(
              //       //                   mainAxisAlignment: MainAxisAlignment.start,
              //       //                   crossAxisAlignment:
              //       //                       CrossAxisAlignment.start,
              //       //                   children: [
              //       //                     Container(
              //       //                         height: 36,
              //       //                         padding:
              //       //                             const EdgeInsets.only(top: 5),
              //       //                         child: Image.asset(
              //       //                             'images/biology.png')),
              //       //                     SizedBox(
              //       //                       width: 10,
              //       //                     ),
              //       //                     Column(
              //       //                       mainAxisAlignment:
              //       //                           MainAxisAlignment.spaceAround,
              //       //                       crossAxisAlignment:
              //       //                           CrossAxisAlignment.start,
              //       //                       children: [
              //       //                         Text(
              //       //                           "${topics[index].videoName}",
              //       //                           style: appThemeDark.textTheme.title,
              //       //                         ),
              //       //                         Text("$error"),
              //       //                         if (index == _playing)
              //       //                           Container(
              //       //                             height: 3,
              //       //                             width: 213.59,
              //       //                             alignment: Alignment.centerLeft,
              //       //                             decoration: BoxDecoration(
              //       //                                 color: Color.fromRGBO(
              //       //                                     224, 240, 255, 1),
              //       //                                 borderRadius:
              //       //                                     BorderRadius.circular(
              //       //                                         45)),
              //       //                             child: FractionallySizedBox(
              //       //                               heightFactor: 1,
              //       //                               widthFactor: _duration != 0
              //       //                                   ? (_position / _duration)
              //       //                                   : 0.1,
              //       //                               alignment:
              //       //                                   FractionalOffset.centerLeft,
              //       //                               child: Container(
              //       //                                 decoration: BoxDecoration(
              //       //                                     color: appThemeDark
              //       //                                         .buttonColor,
              //       //                                     borderRadius:
              //       //                                         BorderRadius.circular(
              //       //                                             45)),
              //       //                               ),
              //       //                             ),
              //       //                           ),
              //       //                         Text(_duration > 0
              //       //                             ? "${((_position / _duration) * 100).toStringAsFixed(2)}%"
              //       //                             : "0%"),
              //       //                       ],
              //       //                     ),
              //       //                     // if(index == _playing)   Icon(
              //       //                     //        Icons.music_note)
              //       //                   ],
              //       //                 ),
              //       //               ),
              //       //             ),
              //       //             onTap: () {
              //       //               setState(() {
              //       //                 _currentPlaying = topics[index];
              //       //                 _playing = index;
              //       //               });
              //       //               _changeVideo(_currentPlaying);
              //       //             },
              //       //           );
              //       //         }
              //       //         ),
              //       //   );
              //     }
              //     ),
            ],
          ),
        ),
      ),
    );
  }
}
