import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_project/models/product.dart';
import 'package:second_project/providers/cartprovid.dart';

class productDetails extends StatefulWidget {

  static String id='ProductDetails';
  Product product;
productDetails({this.product});

@override
  _productDetailsState createState() => _productDetailsState();
}

class _productDetailsState extends State<productDetails> {
  int i=0;
  List<Product> products=[
    Product(imgurl:'image/5.jpg' ,name: 'jorden',type: 'jorden Nike',price: '700 L.E', ),
    Product(imgurl:'image/IW503605_tile_1.717.jpg.transform.article_image_335_2x.webp',name: 'Oleves',type: 'Classic WatchMer',price: '4500 L.E', ),
  ] ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(child:
            Image.asset(widget.product.imgurl,width: 500,height: 400,), ),
            Text(widget.product.name,style: TextStyle(color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold),),
            Text(widget.product.type, style: TextStyle(color: Colors.grey, fontSize: 15),),
            Text(widget.product.price,style:
            TextStyle(color: Colors.deepPurple, fontSize: 20),),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 40, 300, 0),
            child: Align(
                alignment: Alignment.bottomLeft,
                child: Text('Price',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
          ),
            Padding(
              padding: const EdgeInsets.fromLTRB(135, 8, 180, 0),
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  children: [
                  InkWell(
                     onTap: (){
                    setState(() {
                      i-=1;
                    });
                     },
                      child: Icon(Icons.remove,size: 30,)),
                    Text(i.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 50),),
                    InkWell(
                        onTap: (){
                         setState(() {
                           i+=1;
                         });
                        },

                        child: Icon(Icons.add,size: 35,)),
                  ],
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomRight,
              child: Container(

                  child:Row(
                    children:[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10,20,115,0),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                              decoration: BoxDecoration(
                                  color:Colors.green, borderRadius: BorderRadius.circular(22)),
                              child: TextButton(onPressed: (){}, child: Text('    90L.E    ',style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0,20,0,0),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            decoration: BoxDecoration(
                                color:Colors.black87, borderRadius: BorderRadius.circular(10)),
                              child: Consumer<CartList>(
                                builder: (context,cartlist,child) {
                                  for(var product in cartlist.cartList) {
                                    if(product ==widget.product) {
                                   return  InkWell(
                                        onTap: () {
                                          cartlist.removeProduct(widget.product);
                                        },
                                        child:
                                       Row(
                                         children: [
                                           FloatingActionButton.extended( icon: Icon(Icons.check_circle_outline,
                                         color: Colors.white,),
                                       label: Text('Add To Cart',
                                         style: TextStyle(fontSize: 15,
                                             color: Colors.white,
                                             fontWeight: FontWeight.bold),)

                                            ) ],),
                                      );
                                    } }

                                  return  InkWell(
                                    onTap: () {
                                      cartlist.addProduct(widget.product);
                                    },
                                    child:
                                    Row(
                                      children: [
                                        FloatingActionButton.extended( icon: Icon(Icons.check_circle_outline,
                                          color: Colors.white,),
                                            label: Text('Add To Cart',
                                              style: TextStyle(fontSize: 15,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),)

                                        ) ],),
                                  );

                                })),),
     ),


  ] ),

                  ),
                ),



          ],
        ),
      ),
    );
  }
}
