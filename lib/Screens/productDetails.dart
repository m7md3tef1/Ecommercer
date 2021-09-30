import 'dart:ui';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter_bloc/flutter_bloc.dart'as route;
import 'package:flutter_bloc/flutter_bloc.dart'as route;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:second_project/bloc/cartListBloc.dart';
import 'package:second_project/models/product.dart';

class productDetails extends StatefulWidget {
  static String id = 'ProductDetails';
  Product product;
  productDetails({this.product});

  @override
  _productDetailsState createState() => _productDetailsState();
}

class _productDetailsState extends State<productDetails> {
  final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();
  addToCart(Product product) {
    bloc.addToList(product);
  }

  int i = 0;
  List<Product> products = [
    Product(
      imgurl: 'image/5.jpg',
      name: 'jorden',
      type: 'jorden Nike',
      price: '700 L.E',
    ),
    Product(
      imgurl:
          'image/IW503605_tile_1.717.jpg.transform.article_image_335_2x.webp',
      name: 'Oleves',
      type: 'Classic WatchMer',
      price: '4500 L.E',
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
                  width: 500.w,
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
            padding: EdgeInsets.fromLTRB(120.h, 8.h, 150.h, 8.h),
            child: Align(
              alignment: Alignment.center,
              child: Row(
                children: [
                  InkWell(
                      onTap: () {
                        setState(() {
                          i -= 1;
                        });
                      },
                      child: Icon(
                        Icons.remove,
                        size: 20.sp,
                      )),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(2.h),
                      child: Text(
                        i.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30.sp),
                      ),
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          i += 1;
                        });
                      },
                      child: Icon(
                        Icons.add,
                        size: 20.sp,
                      )),
                ],
              ),
            ),
          ),
          Align(
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
                          child: route.BlocConsumer(
                            bloc: route.BlocProvider.of(context),
                              listener: (context, cartlist) {},
                              builder: (context, cartlist) {
                                for (var product in cartlist.cartList) {
                                  if (product == widget.product) {
                                    return InkWell(
                                      onTap: () {
                                        addToCart(widget.product);
                                        final snackBar = SnackBar(
                                          content: Text(
                                              "${widget.product.name} added to the cart"),
                                          duration: Duration(milliseconds: 550),
                                        );
                                        Scaffold.of(context).showBottomSheet(
                                            (context) => snackBar);

                                        cartlist.addProduct(widget.product);
                                      },
                                      child: Row(
                                        children: [
                                          FloatingActionButton.extended(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.check_circle,
                                                color: Colors.white,
                                              ),
                                              label: Text(
                                                'Add To Cart',
                                                style: TextStyle(
                                                    fontSize: 15.sp,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ))
                                        ],
                                      ),
                                    );
                                  }
                                  ;
                                }
                              }))))
            ])),
          ),
        ]),
      ),
    );
  }
}
