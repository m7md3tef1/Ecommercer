import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_project/Screens/productDetails.dart';
import 'package:second_project/models/product.dart';
import 'package:second_project/providers/cartprovid.dart';
class cartScreen extends StatefulWidget {

  Product product;
cartScreen({this.product});

  @override
  _cartScreenState createState() => _cartScreenState();
}

class _cartScreenState extends State<cartScreen> {
  @override
  Widget build(BuildContext context) {
    var cartList =Provider.of<CartList>(context).cartList;
    return Scaffold(

      body: ListView.builder(
itemCount:cartList.length ,

          itemBuilder: (context,index)
          {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(


                child: Row(
                  children: [
                    CircleAvatar(backgroundColor: Colors.grey,radius: 60,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(cartList[index].name),

                        Text(cartList[index].price)
                      ],
                    )
                  ],
                ),


              ),
            );
          }),
    );
  }
}
