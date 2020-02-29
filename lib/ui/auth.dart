import 'package:apprental/services/sign_in.dart';
import 'package:apprental/ui/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthGoogle extends StatefulWidget {
  @override
  _AuthGoogleState createState() => _AuthGoogleState();
}

class _AuthGoogleState extends State<AuthGoogle> {
  Color textColor = Colors.white;

  @override
  void initState() {
    super.initState();
  }

  void login() {
    signInWithGoogle().whenComplete(() {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) {
            return HomePage();
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      backgroundColor: Colors.greenAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Center(
            child: Text(
              "I-RENT",
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w800 , letterSpacing: .5),
            ),
          ),
          Center(
            child: Text(
              "Silakan Login Terlebih Dahulu",
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w800 , letterSpacing: 1.5),
            ),
          ),
          Center(
            child: Container(
              height: 300,
              width: 300,
              child: Image.asset(
                "assets/images/icon.png",
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
          _signInButton()
        ],
      ),
    );
  }

  Widget _signInButton() {
    return OutlineButton(
      splashColor: Colors.grey,
      color: Colors.white,
      onPressed: () {
        // Ketika Success Push Ke Halaman Home Page
        login();
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
