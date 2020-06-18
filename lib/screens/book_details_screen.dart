import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterloginproject/database.dart';
import 'package:provider/provider.dart';

import '../providers/books.dart';

class BookDetailScreen extends StatelessWidget {
  // final String title;
  // final double price;

  // ProductDetailScreen(this.title, this.price);
  static const routeName = '/book-detail';

  @override
  Widget build(BuildContext context) {
    final productId =
    ModalRoute.of(context).settings.arguments as String; // is the id!
    final loadedProduct = Provider.of<Books>(
      context,
      listen: false,
    ).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
        backgroundColor: Color.fromRGBO(181, 154, 87, 1),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                loadedProduct.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '\$${loadedProduct.price}',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                loadedProduct.description,
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ),
            FlatButton(
              child: Text('purchase'),
              onPressed: () async {
                Database(uid: loadedProduct.id).updateBookData(loadedProduct.id, loadedProduct.title, loadedProduct.author, loadedProduct.description, loadedProduct.price, loadedProduct.imageUrl);
              },
            ),
          ],
        ),
      ),
    );
  }
}
