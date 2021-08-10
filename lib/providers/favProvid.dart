import 'package:flutter/cupertino.dart';
import 'package:second_project/models/product.dart';

class FavouriteList extends ChangeNotifier
{
  List<Product> favList=[];
  addProduct(Product)
  {
    favList.add(Product);
    notifyListeners();
  }
  removeProduct(Product)
  {
    favList.remove(Product);
    notifyListeners();
  }
}