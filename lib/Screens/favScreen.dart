import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_project/providers/favProvid.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({Key key}) : super(key: key);

  @override
  _FavScreenState createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {

  @override
  Widget build(BuildContext context) {
    var favList =Provider.of<FavouriteList>(context).favList;
    return Scaffold(
      body: GridView.builder(itemCount: favList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
          itemBuilder: (context,index)
      {
        return Padding(
          padding:  EdgeInsets.all(8.0.h),
          child: Container(
            color: Colors.grey[100],
            child: Column(
              children: [
               Image.asset(favList[index].imgurl,width: double.infinity,height: 250.h,),
                Text(favList[index].name,style: TextStyle(color: Colors.black,
                    fontSize: 20.sp, fontWeight: FontWeight.bold)),
                Text(favList[index].type,style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold, fontSize: 15.sp)),
                Text(favList[index].price ,style: TextStyle(color: Colors.deepPurple, fontSize: 20.sp),),
              ],
            ),


          ),
        );
      }),
    );
  }
}
