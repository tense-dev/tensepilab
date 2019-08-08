import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tense_pilab/screens/show_api_web.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
//explicite

//medtod

  Widget showSignOut() {
    return IconButton(
      icon: Icon(Icons.exit_to_app),
      onPressed: () {
        processSignOut();
      },
    );
  }

  Future<void> processSignOut() async {
    await firebaseAuth.signOut().then((response) {
      exit(0);
    });
  }

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Widget myWidget = ShowApiWeb();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Service'),
        actions: <Widget>[showSignOut()],
      ),
      body: myWidget,
    );
  }
}
