import 'package:flutter/material.dart';
//import 'login_page.dart';
import 'auth.dart';
import 'root.dart';



void main() {

  runApp(new MyApp());


}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
        debugShowCheckedModeBanner: false,
      title: 'Loogin page',
      theme: new ThemeData(

      ),
      home: new RootPage(auth: new Auth())
    );
  }
}

