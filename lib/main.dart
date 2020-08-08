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
          children: [
            imageSection,
            courseSelection
          ],

        )
      )
      );
  }

  final Widget imageSection = Container(
    child: Image.asset(
      'images/logo.jpg',
      height: 350,
      width: 400,
      )
  );

  final Widget courseSelection = Column (
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center, 
        children: [
          Text(
            'Please select your class',
            style: TextStyle(fontFamily: 'Montserrat'))
        ]
      ),

      Row(
        mainAxisAlignment: MainAxisAlignment.center, 
        children: [
          OutlineButton (
            onPressed: () {},
            borderSide: BorderSide (
            color: Color(0xFF0C0C72), //Color of the border
            style: BorderStyle.solid, //Style of the border
            width: 1.2, //width of the border
            ),
            color: Colors.white,
            child: Container (
              child: const Text (
                'CS 125', 
                style: TextStyle(color: Color(0xFF0C0C72), fontFamily: 'Montserrat', fontWeight: FontWeight.bold)),
            )
          )
        ]
      ) 
    ]
  );
}
