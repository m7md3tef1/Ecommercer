import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:second_project/models/product.dart';

class Store {
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  addProduct(Product product) {
    fireStore.collection('Products').doc(product.id).set(product.toJson());
  }

  getAllProducts() {
    return fireStore.collection('Products').snapshots();
  }

  deleteProduct(id) {
    fireStore.collection('Products').doc(id).delete();
  }
}
