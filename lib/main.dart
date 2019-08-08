import 'package:flutter/material.dart'; // ใช้เสมอ
import 'package:tense_pilab/screens/home.dart';

//โต๊ะ
main() {
  runApp(MyApp());
}

//slt ทำหน้าที่ในการสร้างผ้าปูโต๊ะ ขึ้นมา
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
