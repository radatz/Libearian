import 'package:flutter/material.dart';
import 'package:flutterloginproject/user.dart';
import 'package:provider/provider.dart';
import './NavDrawer.dart';
import 'database.dart';

class Rentals extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: Database(uid: user.uid).userData,
        builder: (context, snapshot) {
          if(snapshot.hasData) {

            UserData userData = snapshot.data;

            return Scaffold(
              appBar: AppBar(
                title: Text('Rental Page'),
              ),
              drawer: NavDrawer(),
            );
          }
          else {
            return null; //loading page?
          }
        }
    );
  }
}