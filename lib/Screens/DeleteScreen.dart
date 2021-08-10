import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:second_project/models/product.dart';

class DeleteScreen extends StatefulWidget {
  const DeleteScreen({Key key}) : super(key: key);

  @override
  _DeleteScreenState createState() => _DeleteScreenState();
}

class _DeleteScreenState extends State<DeleteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete Product'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: getProducts(),
        builder: (context, snapshots) {
          List<Product>products = [];
          if (snapshots.hasData) {
            for (var doc in snapshots.data.docs) {
              products.add(Product(
                id: doc.id,
                Description: doc.get('Description'),
                name: doc.get('name'),
                price: doc.get('price'),
                Size: doc.get('size'),
              ));
            }
          }
          return GridView.builder(
            itemCount: products.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                    FirebaseFirestore.instance.collection('product').doc(products[index].id).delete();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        image: DecorationImage(
                          image: AssetImage('image/5.jpg'),
                        )),
                    child: Text(products[index].name),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  getProducts() {
    return FirebaseFirestore.instance.collection('Product').snapshots();
  }
}
