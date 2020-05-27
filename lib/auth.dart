

///////////////////Houses the  Firebase authentication methoods

import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

abstract class BaseAuth{
  Future<String> signInWithEmailAndPassword(String email, String password);
  Future<String> createUserWithEmailAndPassword(String email, String password);
  Future<void>sendPasswordResetEmail(String email);
  Future<String>currentUser();
  Future<void>signOut();
}

class Auth implements BaseAuth {


  Future<String> signInWithEmailAndPassword(String email, String password)async {
    AuthResult result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = result.user;
    return user.uid;
  }

  Future<String> createUserWithEmailAndPassword(String email, String password) async {
    AuthResult result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = result.user;
    user.sendEmailVerification();
    return user.uid;
  }

  Future<void>sendPasswordResetEmail(String email){// This posts a void error I'm not sure why since it has no return.
    FirebaseAuth.instance.sendPasswordResetEmail(email: email);

  }

  Future<String>currentUser() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    return user != null ? user.uid : null;
  }


  Future<void> signOut()async {
    await FirebaseAuth.instance.signOut();
  }
}