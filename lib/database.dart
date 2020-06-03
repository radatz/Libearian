import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterloginproject/book.dart';
import 'package:flutterloginproject/user.dart';

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

  // book list frm snapshot
  List<Book> _bookListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Book(
        name: doc.data['name'] ?? '',
        book: doc.data['book'] ?? ''
      );
    }).toList();
  }

  UserData _userSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      book: snapshot.data['book']
    );
  }

  Stream<List<Book>> get books {
    return bookCollection.snapshots().map(_bookListFromSnapshot);
  }

  Stream<UserData> get userData {
    return bookCollection.document(uid).snapshots().map(_userSnapshot);
  }
}

