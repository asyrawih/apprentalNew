import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          "Created By Hanan Asyrawi",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
