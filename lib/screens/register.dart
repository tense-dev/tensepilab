import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tense_pilab/screens/my_service.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
// Explicit
  final formKey = GlobalKey<FormState>();
  String nameString, emailString, passwordString;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

// Medtod
  Widget nameText() {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(
          Icons.people,
          size: 30.0,
          color: Colors.green,
        ),
        labelText: 'Name : ',
        labelStyle: TextStyle(color: Colors.green),
        helperText: 'Type Your Name',
        helperStyle: TextStyle(color: Colors.yellow[700]),
        hintText: 'English only',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please Fill Name in Blank';
        }
      },
      onSaved: (String value) {
        nameString = value;
      },
    );
  }

  Widget emailText() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        icon: Icon(
          Icons.email,
          size: 30.0,
          color: Colors.blue,
        ),
        labelText: 'Email : ',
        labelStyle: TextStyle(color: Colors.blue),
        helperText: 'Type Your Email',
        helperStyle: TextStyle(color: Colors.yellow[700]),
        hintText: 'you@mail.com',
      ),
      validator: (String value) {
        if (!((value.contains('@')) && (value.contains('.')))) {
          return 'Please Keep Format Type Email';
        }
      },
      onSaved: (String value) {
        emailString = value;
      },
    );
  }

  Widget passwordText() {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(
          Icons.lock,
          size: 30.0,
          color: Colors.red,
        ),
        labelText: 'Password : ',
        labelStyle: TextStyle(color: Colors.red),
        helperText: 'Type Your Password',
        helperStyle: TextStyle(color: Colors.yellow[700]),
        hintText: 'More 6 Character',
      ),
      validator: (String value) {
        if (value.length < 6) {
          return 'Please More 6 Character';
        }
      },
      onSaved: (String value) {
        passwordString = value;
      },
    );
  }

  Widget groupText() {
    return Form(
      key: formKey,
      child: ListView(
        padding: EdgeInsets.only(top: 80.0, left: 50.0, right: 50.0),
        children: <Widget>[nameText(), emailText(), passwordText()],
      ),
    );
  }

  Widget registerButton() {
    return IconButton(
      tooltip: 'Register Firebase',
      icon: Icon(Icons.cloud_upload),
      iconSize: 36.0,
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print(
              'name = $nameString,email=$emailString,password=$passwordString');
          uploadValueToFirebase();
        }
      },
    );
  }

  Future<void> uploadValueToFirebase() async {
    await firebaseAuth
        .createUserWithEmailAndPassword(
            email: emailString, password: passwordString)
        .then((response) {
      print('Register Success');
      setUpDisplayName();
    }).catchError((response) {
      print('response = ${response.toString()}');
      String title = response.code;
      String message = response.message;
      myAlert(title, message);
    });
  }

  //thread
  Future<void> setUpDisplayName() async {
    await firebaseAuth.currentUser().then((response) {
      UserUpdateInfo  userUpdateInfo = UserUpdateInfo();
      userUpdateInfo.displayName = nameString;
      response.updateProfile(userUpdateInfo);

      var myService = MaterialPageRoute(builder: (BuildContext context) => MyService());
      Navigator.of(context).pushAndRemoveUntil(myService, (Route<dynamic> route) => false);
    });
  }

  void myAlert(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: Text('Register'),
        actions: <Widget>[registerButton()],
      ),
      body: groupText(),
    );
  }
}
