import 'dart:ui';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_project/Screens/cartScreen.dart';
import 'package:second_project/models/product.dart';
import 'package:second_project/providers/cartprovid.dart';

class productDetails extends StatefulWidget {
  static String id = 'ProductDetails';
  Product product;
  productDetails({this.product});

  @override
  _productDetailsState createState() => _productDetailsState();
}

class _productDetailsState extends State<productDetails> {

  List<Product> products = [
    Product(
      imgurl: 'image/5.jpg',
      name: 'jorden',
      type: 'jorden Nike',
      price: '700 ',
    ),
    Product(
      imgurl:
          'image/IW503605_tile_1.717.jpg.transform.article_image_335_2x.webp',
      name: 'Oleves',
      type: 'Classic WatchMer',
      price: '4500 ',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(children: [
          Container(
            child: Hero(
                tag: "image-${widget.product.imgurl}",
                child: Image.asset(
                  widget.product.imgurl,
                  width: double.infinity,
                  height: 350.h,
                )),
          ),
          Hero(
            tag: "name-${widget.product.name}",
            child: Text(
              widget.product.name,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Hero(
              tag: "type-${widget.product.type}",
              child: Text(
                widget.product.type,
                style: TextStyle(
                  color: Colors.grey,
                ),
              )),
          Hero(
              tag: "price-${widget.product.price}",
              child: Text(
                widget.product.price,
                style: TextStyle(
                  color: Colors.deepPurple,
                ),
              )),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                          onTap: () {

                            setState(() {
                               widget.product.counter >(1)?   widget.product.counter=widget.product.counter -1:widget.product.counter=0;
                            }) ;



                          },
                          child: Icon(
                            Icons.remove,
                            size: 35.sp,
                          )),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                      '2',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30.sp),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                          onTap: () {
                            setState(() {
                              widget.product.counter=widget.product.counter +1;
                            });

                              // p.plus() ;
                          },
                          child: Icon(
                            Icons.add,
                            size: 35.sp,
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20.h, 35.h, 30.h, 30.h),
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Price',
                      style: TextStyle(
                          color: Colors.green[500],
                          fontWeight: FontWeight.bold,
                          fontSize: 30.sp),
                    )),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                  child: Row(children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10.h, 30.h, 53.h, 0.h),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(18.h)),
                        child: TextButton(
                            onPressed: () {},
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.h, right: 10.h),
                              child: Text(
                                widget.product.price,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ))),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(0.h, 30.h, 10.h, 0.h),
                    child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.black87,
                                borderRadius: BorderRadius.circular(15.h)),
                            child: Consumer<CartList>(
                                builder: (context, cartList, child) {
                              for (var product in cartList.cartList) {
                                if (product == widget.product) {
                                  return InkWell(
                                    onTap: () {
                                      cartList.removeProduct(widget.product);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(widget.product.name +
                                          '  Removed From the cart'),
                                        backgroundColor: Colors.red,
                                        duration: Duration(milliseconds: 550),
                                      ));
                                    },
                                    onDoubleTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return cartScreen(
                                          product: widget.product,
                                        );
                                      }));
                                    },
                                    child: Row(
                                      children: [
                                        FloatingActionButton.extended(
                                            icon: Icon(
                                              Icons.check_circle,
                                              color: Colors.white,
                                            ),
                                            label: Text(
                                              'Add To Cart',
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ))
                                      ],
                                    ),
                                  );
                                }
                              }
                              return InkWell(
                                onTap: () {
                                  cartList.addProduct(widget.product);
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(widget.product.name +
                                        '  Added From the cart'),
                                    backgroundColor: Colors.grey,
                                  ));
                                },
                                onDoubleTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return cartScreen(
                                      product: widget.product,
                                    );
                                  }));
                                },
                                child: Row(
                                  children: [
                                    FloatingActionButton.extended(
                                        icon: Icon(
                                          Icons.check_circle_outline,
                                          color: Colors.white,
                                        ),
                                        label: Text(
                                          'Add To Cart',
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ))
                                  ],
                                ),
                              );
                            }))))
              ])),
            ),
          ),
        ]),
      ),
    );
  }

}
