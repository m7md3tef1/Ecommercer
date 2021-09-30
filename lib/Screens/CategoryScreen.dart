import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryScreen extends StatefulWidget {
  static String id = 'CategoryScreen';
  String categoryName;
  String image;
  CategoryScreen({this.categoryName, this.image});
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
      ),
      backgroundColor: Colors.grey[200],
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: .7),
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  Container(
                    height: 160.h,
                    color: Colors.grey[400],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: SizedBox(
                            height: 100.h,
                            width: 100.w,
                            child: CircleAvatar(
                              radius: 60,
                              backgroundImage: AssetImage(widget.image),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.grey[300],
                    child: Padding(
                      padding:  EdgeInsets.only(left: 50.h,bottom: 8.h),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text('Name'),
                            ],
                          ),
                          Row(
                            children: [
                              Text('Discreption'),
                            ],
                          ),
                          Row(
                            children: [
                              Text('price'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ]));
          }),
    );
  }
}
