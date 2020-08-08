import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Base-Container',
      home: Scaffold(
        body: imageSection
      )
      );
  }

  final Widget imageSection = Container(
    child: Image.asset('images/logo.jpg')
  );
}

