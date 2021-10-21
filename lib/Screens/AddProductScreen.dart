import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key key}) : super(key: key);

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  String Name = '';
  String price = '';
  String Description = '';
  String size = '';
  String link = '';
  PickedFile c;
  File e;

  var adminKey = GlobalKey<FormState>();
  var s = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child:
          SingleChildScrollView(
            child: SafeArea(
              child: InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return SimpleDialog(
                          children: [
                            SimpleDialogOption(
                              child: Text('Pick Photo'),
                            ),
                            SimpleDialogOption(
                              child: InkWell(
                                  onTap: () async {
                                    Navigator.pop(context);
                                    c = await ImagePicker.platform
                                        .pickImage(source: ImageSource.gallery);
                                    setState(() {
                                      e = File(c.path);
                                    });
                                  },
                                  child: Text('Pick From Gallery')),
                            ),
                            SimpleDialogOption(
                              child: InkWell(
                                  onTap: () async {
                                    Navigator.pop(context);
                                    c = await ImagePicker.platform
                                        .pickImage(source: ImageSource.camera);
                                    setState(() {
                                      e = File(c.path);
                                    });
                                  },
                                  child: Text('Pick From Camera')),
                            ),
                          ],
                        );
                      });
                },
                child: c == null
                    ? Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.deepPurple),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(60.0),
                          child: Icon(
                            Icons.add_a_photo_outlined,
                            color: Colors.deepPurple,
                            size: 40,
                          ),
                        ))
                    : Image.file(
                        File(c.path),
                        fit: BoxFit.contain,
                      ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: adminKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextForm(
                    'Product Name',
                    (v) {
                      setState(() {
                        Name = v;
                      });
                    },
                        (v){
                      if(v.toString().isEmpty){
                        return'Please Enter Name';
                      }
                    },

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextForm(
                    'Product Price',
                    (v) {
                      setState(() {
                        price = v;
                      });
                    },
                        (v){
    if(v.toString().isEmpty){
    return'Please Enter Price';
    }
    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextForm(
                    'Product Description',
                    (v) {
                      setState(() {
                        Description = v;
                      });
                    },
                        (v){
                      if(v.toString().isEmpty){
                        return'Please Enter Description ';
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextForm(
                    'Product Size',
                    (v) {
                      setState(() {
                        size = v;
                      });
                    },
                        (v){
                      if(v.toString().isEmpty){
                        return'Please Enter Size ';
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .06,
                ),
                Padding(
                  padding:  EdgeInsets.fromLTRB(20.h ,12.h, 20.h, 12.h),
                  child: InkWell(
                    onTap: () async {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text( Name+ ' Is Added'),backgroundColor: Colors.deepPurple[300],duration: Duration(milliseconds: 5),));
                      adminKey.currentState.save();
                      adminKey.currentState.validate();
                      await FirebaseStorage.instanceFor(
                              bucket: 'gs://ecommercer-ef073.appspot.com')
                          .ref(c.path)
                          .putFile(e);
                      var url = await FirebaseStorage.instanceFor(
                              bucket: 'gs://ecommercer-ef073.appspot.com')
                          .ref(c.path)
                          .getDownloadURL();
                      print(url);
                      setState(() {
                        link = url;
                      });
                      await FirebaseFirestore.instance
                          .collection('Product')
                          .add({
                        'name': Name,
                        'prise': price,
                        'Description': Description,
                        'size': size,
                        'link': link,
                      });

                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.deepPurple,
                        border: Border.all(color: Colors.black),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Row(
                            children: [
                              Icon(
                                Icons.add_box_rounded,
                                color: Colors.white,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(50, 10, 10, 10),
                                child: Text(
                                  'Add Product',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19),
                                ),
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
    ));
  }

  TextFormField CustomTextForm(
    label,
    onSaved,
      validator
  ) {
    return TextFormField(
      decoration: InputDecoration(labelText: label,
          border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5)),
    focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    ),
      ),
      onSaved: onSaved,validator: validator,

    );
  }
}
