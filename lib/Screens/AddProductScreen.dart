
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:second_project/widgets/customtextfile.dart';
class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key key}) : super(key: key);

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
 String Name='';
 String price='';
 String Description='';
 String size='';

  var adminKey=GlobalKey<FormState>();
  var s=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(  children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.deepPurple),
            ),
              child: Padding(
                padding: const EdgeInsets.all(60.0),
                child: Icon(Icons.add_a_photo_outlined,color: Colors.deepPurple,size: 40,),
              )),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: adminKey,
            child: Column(
              children: [
                CustomTextForm(
                  'Product Name',(v){
                  setState(() {
                    Name=v;
                  });
                },

                ),
                CustomTextForm(
                  'Product Price',(v){
                  setState(() {
                    price=v;
                  });
                },

                ),
                CustomTextForm(
                  'Product Description',(v){
                  setState(() {
                    Description=v;
                  });
                },

                ),
                CustomTextForm(
                  'Product Size',(v){
                  setState(() {
                    size=v;
                  });
                },

                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40,12,40,12),
                  child: InkWell(
                    onTap:()async{
                      adminKey.currentState.save();
                      await FirebaseFirestore.instance.collection('Product').add(
                        {
                         'name':Name,
                         'prise':price,
                          'Description':Description,
                          'size':size,
                        }
                      );
                    } ,
                    child: Container(

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color:  Colors.deepPurple,
                        border: Border.all(color: Colors.black
                        ),

                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Row(
                            children: [
                              Icon(Icons.add_box_rounded,color: Colors.white,),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20,10,10,10),
                                child:
                                Text('Add Product',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )

              ],
            ),
          ),
        )
      ],

      )
    );
  }
  TextFormField CustomTextForm(label,onSaved,){
    return TextFormField(
      decoration: InputDecoration(labelText: label),onSaved: onSaved,
    );
  }
}
