
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
static String id='CategoryScreen';
  String categoryName;
  CategoryScreen({this.categoryName});
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
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,childAspectRatio:.7
      )
          , itemBuilder: (context,index)
      {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
            Container(
              height: 200,color: Colors.grey,),
               Text('Name'),
               Text('Discreption'),
               Text('price'),
               ],
          ),
        );
      }),
    );
  }
}