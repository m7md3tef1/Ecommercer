import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import 'package:second_project/models/product.dart';
import 'dart:async';

import 'package:second_project/providers/cartprovid.dart';

class CartListBloc extends BlocBase{

 CartListBloc();

 var _listControler =BehaviorSubject<List<Product>>.seeded([]);

 CartList provider=CartList();

 Stream<List<Product>> get ListStream =>_listControler.stream;

 Sink<List<Product>> get ListSink =>_listControler.sink;

addToList(Product productss){
  ListSink.add(provider.addProduct(productss));
}
 removeFromList(Product productss){
   ListSink.add(provider.removeProduct(productss));
 }

 @override
 void dispose() {
   _listControler.close();
   super.dispose();
 }

}