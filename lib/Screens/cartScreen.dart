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
    var cartList =Provider.of<CartList>(context).cartList;
    return Scaffold(

      body: ListView.builder(
itemCount:cartList.length ,

          itemBuilder: (context,index)
          {
            return Padding(
              padding:  EdgeInsets.all(7.h),
              child: Container(


                child: Row(
                  children: [
                    SizedBox(
                      height: 100.h,
                      width: 100.w,
                      child: CircleAvatar(radius: 60,
                      backgroundImage: AssetImage(cartList[index].imgurl),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(cartList[index].name,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,
                          fontSize: 20.sp,)),
                        Text(cartList[index].type,style: TextStyle(color: Colors.grey, ),),
                        Text(cartList[index].price,style: TextStyle(color: Colors.deepPurple ),)
                      ],
                    ),
                    Padding(
                      padding:  EdgeInsets.all(8.h),
                      child: Column(
                        children: [

                          Padding(
                            padding:  EdgeInsets.all(8.h),
                            child: Text('عدد القطع المطلوبه',style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 11.sp),),
                          ),
                          Padding(
                            padding:  EdgeInsets.all(6.h),
                            child: Text('50'),
                          )


                        ],
                      ),
                    )
                  ],
                ),


              ),
            );
          }),
    );
  }
}
