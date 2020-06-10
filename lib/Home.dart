import 'package:flutter/material.dart';
import 'auth.dart';
import './NavDrawer.dart';

class HomePage extends StatelessWidget {
  HomePage({this.auth, this.onSignedOut}); // <=== Class Homepage, Istantiates Constructor auth.dart, and voidcallback
  final BaseAuth auth;
  final VoidCallback onSignedOut; //

// When creating methods, if the method is NOT specific to the home screen, consider making a seperate file with methods that you can call in.
  // For example, the auth.dart file contains All of the current firebase methods that have been called. Those methods were then imported into login-page, main, and root, home
  // this allows those methods to be called in and used in those files.
  void signOut()async{// This is the sign-out method, this method is called with the FlatButton below, and will sign the user out it is an Asynch method
    try {
      await auth.signOut();
      onSignedOut();

    } catch(error) {
    print(error);
    }


  }
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
        ),
        drawer: NavDrawer(),
        body: new FlatButton(
          child: new Text('Logout', ),
          onPressed: signOut,// This buttoon can be removed while designing assets, just make sure to include a button or inkwell with "onPressed: SignOut" this is important for functionality
        )

      // My suggestion would be to look at the way loginPagees build was designed, and factor out seperate sections, for buttons, text,images, etc. That way all we have
      // To do is to call in the individual pieces, and can reload seperate pages using the same assets in diffrent arrangesments ( Note: this is just a suggestion)


      );



  }
}