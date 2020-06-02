import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final String uid;
  Database({ this.uid });

  final CollectionReference bookCollection = Firestore.instance.collection('bookData');

  Future updateUserData(String name, String book) async {
    return await bookCollection.document(uid).setData({
      'name' : name,
      'book' : book,
    });
  }
}