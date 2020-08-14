import 'package:flutter/material.dart';
import './video.dart';
import 'package:flutter/services.dart' ;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);
      //MediaQuery.of(context).orientation == Orientation.landscape
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
    ClassButton("CS 125"),
    SizedBox(height: 16),
    ClassButton("STAT 200")
  ]);
}
 /* 
  Makes specific button according to text.
  */
class ClassButton extends StatelessWidget {
  String className; // Variable for class name.
  ClassButton(String className) { // Constructor for text.
    this.className = className;
  }
  var dateTime = DateTime.now();
  
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);

    String urls = '{"CS 125" : {"1" : "-HDThjCQRgg"}, "STAT 200": {"1": "7OJrcBpYuVk"}}';
    Map urlsJson = jsonDecode(urls);
    String url = urlsJson[className]["1"]; 

    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      OutlineButton( // Using outline buttons
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context){
                return AlertDialog(
                  title: Text(className, style: TextStyle(
                    color: Color(0xFF0C0C72), // Color of the Text.
                    fontFamily: 'Montserrat', // Font of the Text.
                    fontWeight: FontWeight.bold)),
                  content: Text("• This is the lecture from 08/14/2020. \n\n• The current lecture cycle is from 8 AM to 8:50 AM. \n\n• The next lecture starts at 9 AM.", style: TextStyle(
                    fontFamily: 'Montserrat', height: 1.5)),
                  actions: [
                    RaisedButton(
                      color: Color(0xFF0C0C72),
                      child: Text('JOIN NOW', style: TextStyle(fontFamily: 'Montserrat', color: Colors.white)),
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
          },
          borderSide: BorderSide(
            color: Color(0xFF0C0C72), // Color of the border.
            style: BorderStyle.solid, // Style of the border.
            width: 1.2, // Width of the border.
          ),
          color: Colors.white,
          child: Container(
            child: Text(className,
                style: TextStyle(
                    color: Color(0xFF0C0C72), // Color of the Text.
                    fontFamily: 'Montserrat', // Font of the Text.
                    fontWeight: FontWeight.bold)) // Style of Font.
          ))
    ]);
  }
}
