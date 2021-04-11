import 'package:flutter/cupertino.dart';

class VideosModelProvider with ChangeNotifier{
  String theme;
  String videoTitle;
  String videoSource;
  String videoName;
  String videoAbout;
  String videoNote;


  VideosModelProvider({this.theme, this.videoTitle, this.videoSource, this.videoName, this.videoAbout,this.videoNote});

  //TakeTestProvider({this.question, this.chA,this.chB, this.chC,this.chD, this.choice, this.hint});
  factory  VideosModelProvider.fromJson(Map<String, dynamic> json){
    var classvideo =  VideosModelProvider(
      theme: json['question'] as String,
      videoTitle: json['videoTitle'] as String,
      videoSource: json['videoSource'] as String,
      videoName: json['videoName'] as String,
      videoAbout: json['videoAbout'] as String,
      videoNote: json['videoNote'] as String,

    );
    return classvideo;
  }
}