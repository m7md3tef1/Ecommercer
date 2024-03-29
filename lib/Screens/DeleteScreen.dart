
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:second_project/models/product.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeleteProduct extends StatefulWidget {
  static String id = 'DeleteScreen';
  @override
  _DeleteProductState createState() => _DeleteProductState();
}

class _DeleteProductState extends State<DeleteProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete Product'),
      ),
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot>(
            stream: getProducts(),
            builder: (context, snapShots) {
              List<Product> products = [];
              for (var doc in snapShots.data.docs) {
                products.add(Product(
                  id: doc.id,
                  name: doc.get('name'),
                  Description: doc['Description'],
                  price: doc.get('prise'),
                  Size: doc.get('size'),
                  imgurl: doc.get('link'),
                ));
              }
              if (snapShots.hasData) {
                return GridView.builder(
                    itemCount: products.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: .7, crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return SimpleDialog(
                                  title: Text('Sure Delete'),
                                  children: [
                                    SimpleDialogOption(
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('Cancel')),
                                    ),
                                    SimpleDialogOption(
                                      child: InkWell(
                                          onTap: ()async {
                                            await  FirebaseFirestore.instance
                                                .collection('Product')
                                                .doc(products[index].id)
                                                .delete();
                                            Navigator.pop(context);
                                          },
                                          child: Text('Delete')),
                                    ),
                                  ],
                                );
                              });
                        },
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: SizedBox(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image:
                                        NetworkImage(products[index].imgurl),
                                      )),
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        'Name: ',
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      products[index].name,
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        'Price:  ',
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(products[index].price,
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    });
              }
                return Text('No Date');

            }),
      ),
    );
  }

  getProducts() {
    return FirebaseFirestore.instance.collection('Product').snapshots();
  }
}
