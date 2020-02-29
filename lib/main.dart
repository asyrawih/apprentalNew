// import 'package:apprental/ui/HomePage.dart';
import 'package:apprental/ui/auth.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Irent',
      theme: ThemeData(
        // primaryColor: Color.fromRGBO(58, 66, 86, 1.0),
        primaryColor: Colors.greenAccent
      ),
      home: AuthGoogle(),
      debugShowCheckedModeBanner: false,
    );
  }
}
