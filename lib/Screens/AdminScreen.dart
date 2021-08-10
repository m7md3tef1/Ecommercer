import 'package:flutter/material.dart';
class AdminScreen extends StatefulWidget {
  const AdminScreen({Key key}) : super(key: key);

  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image(image: AssetImage('image/download.jpg'),),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(color:Colors.deepPurple , borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, 'AddProductScreen');
                  },
                  child: Row(
                    children: [
                       Container(
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(22),
                           color: Colors.white
                         ),
                           child: Icon(Icons.add,color: Colors.deepPurple,)),

                      Text('   Add Product',style: TextStyle(color: Colors.white,fontSize: 25),),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(color:Colors.deepPurple , borderRadius: BorderRadius.circular(13)),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Row(
                  children: [
                    Icon(Icons.search,color: Colors.white,),
                    Text('   View Orders',style: TextStyle(color: Colors.white,fontSize: 25)),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: InkWell(
              onTap: (){
                Navigator.pushNamed(context,'DeleteScreen' );
              },
              child: Container(
                decoration: BoxDecoration(color:Colors.deepPurple , borderRadius: BorderRadius.circular(13)),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Row(
                    children: [
                      Icon(Icons.delete,color: Colors.white,),

                      Text('   Delete Product',style:TextStyle(color: Colors.white,fontSize: 25),),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(color:Colors.deepPurple , borderRadius: BorderRadius.circular(13)),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Row(
                  children: [

                       Icon(Icons.remove_red_eye,color: Colors.white,),

                    Text('   View Product',style: TextStyle(color: Colors.white,fontSize: 25),),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
