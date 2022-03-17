import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:second_project/Screens/productDetails.dart';
import 'package:second_project/models/product.dart';
import 'package:second_project/providers/cartprovid.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class cartScreen extends StatefulWidget {
  Product product;
  cartScreen({this.product});

  @override
  _cartScreenState createState() => _cartScreenState();
}

class _cartScreenState extends State<cartScreen> {
  @override
  Widget build(BuildContext context) {
    var cartList = Provider.of<CartList>(context).cartList;
    dynamic count=2;
    return Scaffold(
      body: ListView.builder(
          itemCount: cartList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(7.h),
              child: SingleChildScrollView(
                child: SafeArea(
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            SizedBox(
                              height: 80.h,
                              width: 80.w,
                              child: CircleAvatar(
                                radius: 60,
                                backgroundImage: AssetImage(cartList[index].imgurl),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(cartList[index].name,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.sp,
                                    )),
                                Text(
                                  cartList[index].type,
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  cartList[index].price.toString(),
                                  style: TextStyle(
                                    color: Colors.deepPurple,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(5.h),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(3.h),
                                        child:

                                        Text(cartList[index].counter.toString(),
                                            style: TextStyle(fontWeight: FontWeight.bold),
                                      )
                                    ),
                                      Padding(
                                        padding: EdgeInsets.all(5.h),
                                        child: Text(
                                          ':عدد القطع المطلوبه',
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 11.sp),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5.h),
                                  child: Column(
                                    children: [
                                      Padding(
                                      padding: EdgeInsets.all(4.h),
                                      child: Text(
                                        ':اجمالى المبلغ',
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11.sp),
                                      ),
                                    ),
                                      Padding(
                                          padding: EdgeInsets.only(top:2.h),
                                          child: Text( (cartList[index].price.toString()*count),
                                            style: TextStyle(fontWeight: FontWeight.bold),
                                          )
                                      ),

                                    ],
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                            width: .90.sw,
                            child: Divider(
                              color: Colors.black26,
                              thickness: 4,

                            )),
                      ),
                    ],
                  ),
                ),
              ),

            );
          }),
    );
  }
}
