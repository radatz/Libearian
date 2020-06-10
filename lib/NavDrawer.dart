import 'package:flutter/material.dart';
import 'package:flutterloginproject/user.dart';
import 'package:provider/provider.dart';
import 'package:flutterloginproject/database.dart';

import 'load.dart';

class NavDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
      stream: Database(uid: user.uid).userData,
      builder: (context, snapshot) {

        UserData userData = snapshot.data;

        if(snapshot.hasData){

          return Drawer(

              child: Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    color: Theme
                        .of(context)
                        .primaryColor,
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: 100,
                            height: 100,
                            margin: EdgeInsets.only(
                              top: 30,
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png'
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Text(
                            userData.name,
                            style: TextStyle(
                              fontSize: 22,
                            ),
                          ),
                          Text('username@Email.com'),
                        ],
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text(
                      'Rentals',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/Rentals');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text(
                      'Favorites',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/Favorites');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/Profile');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text(
                      'Settings',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    onTap: null,
                  ),
                  ListTile(
                    leading: Icon(Icons.arrow_back),
                    title: Text(
                      'Logout',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    onTap: null,
                  ),
                ],
              )
          );
        } else {
          return Load();
        }
      }
    );
  }
}
