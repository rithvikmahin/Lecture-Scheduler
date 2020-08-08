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
    child: Image.asset('images/logo.jpg')
  );

  final Widget courseSelection = Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center, 
      children: [
        Text('PLEASE SELECT YOUR CLASS')
      ],
    )
  );
}

