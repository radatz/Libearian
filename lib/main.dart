import 'package:flutter/material.dart';
import 'package:flutterloginproject/user.dart';
import 'auth.dart';
import 'root.dart';
import 'package:provider/provider.dart';



void main() {

  runApp(new MyApp());


}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return StreamProvider<User>.value(
      value: Auth().user,
      child: new MaterialApp(
          debugShowCheckedModeBanner: false,
        title: 'Loogin page',
        theme: new ThemeData(

        ),
        home: new RootPage(auth: new Auth())
      ),
    );
  }
}

