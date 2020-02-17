import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      body: _loginStack(),
    );
  }

  // ! Stack Screen
  Widget _loginStack() {
    return Stack(
      children: <Widget>[
        SingleChildScrollView(
          controller: _controller,
          child: Container(
            width: MediaQuery.of(context).size.width - (2 * 7) / 2,
            height: MediaQuery.of(context).size.height - (2 * 7) / 2,
          ),
        )
      ],
    );
  }

// * end Scafold Classs
}
