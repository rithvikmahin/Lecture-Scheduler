import 'package:flutter/material.dart';
import './video.dart';
import 'package:flutter/services.dart' ;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations ([
          DeviceOrientation.portraitUp,
        ]);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Base-Container',
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            resizeToAvoidBottomPadding: false,
            backgroundColor: Colors.white,
            body: SingleChildScrollView(child: Column(
              // Sets the image and course selection in a column.
              children: [
                SizedBox(height: 70),
                Center(child: imageSection), 
                courseSelection
                ],
            ))
    ));
  }

  final Widget imageSection = Container(
      child: Image.asset(
    'images/logo2.jpg',
    height: 250,
    width: 400,
  ));

  final Widget courseSelection = Column(children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.center, 
      children: [
      Text('P L E A S E  S E L E C T  Y O U R  C L A S S', 
          style: TextStyle(fontFamily: 'Montserrat', fontSize: 17))
    ]),
    SizedBox(height: 24),
    ClassButton("CS 125", "08/14/2020"),
    SizedBox(height: 16),
    ClassButton("STAT 200", "08/13/2020")
  ]);
}
 /* 
  Makes specific button according to text.
  */
class ClassButton extends StatelessWidget {
  
  String className; // Variable for class name.
  String lectureDate;
  ClassButton(String className, String lectureDate) { // Constructor for text.
    this.className = className;
    this.lectureDate = lectureDate;
  }
  var dateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      OutlineButton( // Using outline buttons
        borderSide: BorderSide(
          color: Color(0xFF0C0C72), // Color of the border.
          style: BorderStyle.solid, // Style of the border.
          width: 1.2 // Width of the border.
        ),
        color: Colors.white,
        child: Container(
          child: Text(className,
              style: TextStyle(
                  color: Color(0xFF0C0C72), // Color of the Text.
                  fontFamily: 'Montserrat', // Font of the Text.
                  fontWeight: FontWeight.bold)) // Style of Font.
        ),
        onPressed: () {
          PopUp(className, lectureDate, dateTime.hour, dateTime.hour + 2);
        }
      )
    ]);
  }
}
class PopUp extends StatelessWidget {

  String className;
  String lectureDate;
  int currentLectureTime;
  int nextLectureTime;
  
  PopUp(String className, String lectureDate, int currentLectureTime, int nextLectureTime) {
    this.className = className;
    this.lectureDate = lectureDate;
    this.currentLectureTime = currentLectureTime;
    this.nextLectureTime = nextLectureTime;
  }
  
  @override
  Widget build(BuildContext context) {

    String urls = '{"CS 125" : {"1" : "-HDThjCQRgg"}, "STAT 200": {"1": "7OJrcBpYuVk"}}';
    Map urlsJson = jsonDecode(urls);
    String url = urlsJson[className]["1"];
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text(className, style: TextStyle(
            color: Color(0xFF0C0C72), // Color of the Text.
            fontFamily: 'Montserrat', // Font of the Text.
            fontWeight: FontWeight.bold)),
          content: Text("• This is the lecture from " + lectureDate + ". \n• The current lecture cycle started at " + currentLectureTime.toString() + "00 hours. \n• The next lecture starts at " + nextLectureTime.toString() + "00 hours.", 
          style: TextStyle(fontFamily: 'Montserrat')),
          actions: [
            RaisedButton(
              color: Color(0xFF0C0C72),
              child: Text('JOIN NOW', style: TextStyle(color: Colors.white, fontFamily: 'Montserrat')),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VideoPage(url: url)
                  )
                );
              },
            )
          ]
        );
      }
    );
  }
}