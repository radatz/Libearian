import 'package:flutter/material.dart';
import 'package:flutterloginproject/user.dart';
import 'package:provider/provider.dart';
import './NavDrawer.dart';
import 'database.dart';

class Profile extends StatelessWidget {
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
                title: Text('Profile Page'),
                backgroundColor: Color.fromRGBO(181, 154, 87, 1),
              ),
              drawer: NavDrawer(),
              /*body: new Stack(
                children: <Widget>[
                  ClipPath(
                    child: Container(
                      color: Colors.orangeAccent,
                    ),
                  ),
                  Positioned(
                    width: 350.0,
                    height: MediaQuery.of(context).size.height / 5,
                  )
                ],
              ),*/
            );
          }
          else {
            return null; //loading page?
          }
        }
    );
  }
}
