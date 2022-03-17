import 'package:flutter/cupertino.dart';
import 'package:second_project/models/product.dart';

class CartList extends ChangeNotifier
{
  List<Product> cartList=[];
  addProduct(Product)
  {
    cartList.add(Product);
    notifyListeners();
  }
  removeProduct(Product)
  {
    cartList.remove(Product);
    notifyListeners();
  }


}