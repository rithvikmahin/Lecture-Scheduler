import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Base-Container',
        home: Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              // Sets the image and course selection in a column.
              children: [
                SizedBox(height: 60),
                Center(child: imageSection), 
                courseSelection
                ],
            )));
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
    ClassButton("MATH 241")
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
  
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      OutlineButton( // Using outline buttons
          onPressed: () {

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
