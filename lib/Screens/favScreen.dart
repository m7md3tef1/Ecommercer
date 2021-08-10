import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_project/providers/favProvid.dart';

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
          padding: const EdgeInsets.all(10.0),
          child: Container(
            color: Colors.grey[300],
            child: Column(
              children: [
               Image.asset(favList[index].imgurl,width: 400,height: 300,),
                Text(favList[index].name,style: TextStyle(color: Colors.black,
                    fontSize: 20, fontWeight: FontWeight.bold)),
                Text(favList[index].type,style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold, fontSize: 15)),
                Text(favList[index].price ,style: TextStyle(color: Colors.deepPurple, fontSize: 20),),
              ],
            ),


          ),
        );
      }),
    );
  }
}
