import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:tense_pilab/models/profile_model.dart';

class ShowApiWeb extends StatefulWidget {
  @override
  _ShowApiWebState createState() => _ShowApiWebState();
}

class _ShowApiWebState extends State<ShowApiWeb> {
//Explicit
  String urlApi = 'https://jsonplaceholder.typicode.com/photos';
  List<ProfileModel> profileModels = [];

  //Medtod
  @override
  void initState() {
    super.initState();
    readAouWeb();
  }

  Future<void> readAouWeb() async {
    var response = await http.get(urlApi);
    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      for (var myModel in result) {
        ProfileModel profile = ProfileModel.fromAPI(myModel);
        setState(() {
          profileModels.add(profile);
        });
      }
    }
  }

  Widget myLayoutListView(int index) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Image.network(profileModels[index].url),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Text(profileModels[index].title),
          )
        ],
      ),
    );
  }

//GestureDetector จับการคลิก
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: profileModels.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          child: myLayoutListView(index),
          onTap: () {
            print('You Click ${profileModels[index].title}');
          },
        );
      },
    );
  }
}
