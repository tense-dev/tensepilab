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

  // Medtod
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[showLogo(), showAppName()],
      ),
    );
  }
}
