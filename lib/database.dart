import 'package:cloud_firestore/cloud_firestore.dart';
import 'file:///C:/Users/alphaNet/Documents/Flutter/Libearian/lib/providers/book.dart';
import 'package:flutterloginproject/user.dart';

class Database {
  final String uid;
  Database({ this.uid });

  final CollectionReference bookCollection = Firestore.instance.collection('bookData');

  Future updateUserData(String name, String email, String phone, String pic) async {
    return await bookCollection.document(uid).setData({
      'name' : name,
      'email' : email,
      'phone' : phone,
      'pic' : pic,
    });
  }

  UserData _userSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      email: snapshot.data['email'],
      phone: snapshot.data['phone'],
      pic: snapshot.data['pic']
    );
  }


  Stream<UserData> get userData {
    return bookCollection.document(uid).snapshots().map(_userSnapshot);
  }
}

