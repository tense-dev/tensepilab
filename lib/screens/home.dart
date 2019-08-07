//Scaffold ดึงตรีม
// Column(children: <Widget>[showAppName(),showAppName()],), //viewgroup
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Explicit
  double myWidth = 120.0;
  double myH1 = 36.0;
  double myFontButton = 18.0;
  Color myColorButton = Colors.yellow[800];

  // Medtod
  Widget signUpButton() {
    return Container(
      width: 220.0,
      child: OutlineButton(
        borderSide: BorderSide(color: myColorButton),
        child: Text(
          'Sign Up',
          style: TextStyle(color: myColorButton),
        ),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        color: myColorButton,
        onPressed: () {},
      ),
    );
  }

  Widget signInButton() {
    return Container(
      width: 220.0,
      child: RaisedButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        color: myColorButton,
        child: Text(
          'Sign In',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: () {},
      ),
    );
  }

  Widget showLogo() {
    return Container(
      alignment: Alignment.center,
      child: Container(
        width: myWidth,
        height: myWidth,
        child: Image.asset('images/logo.png'),
      ),
    );
  }

  Widget showAppName() {
    return Text(
      'TENSE PILAB',
      style: TextStyle(
          fontSize: myH1,
          color: Colors.purpleAccent,
          fontWeight: FontWeight.bold,
          fontFamily: 'Lora-Regular'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: RadialGradient(
                colors: [Colors.white, Colors.blueGrey], radius: 1.2)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            showLogo(),
            showAppName(),
            signInButton(),
            signUpButton(),
          ],
        ),
      ),
    );
  }
}
