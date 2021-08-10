import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {

  String name;
  String hint;
  var icondata;
  var suffix;
  bool secure;
  Function onsaved;
  Function validator;
  CustomTextFormField({this.name, this.hint,this.icondata,this.secure,this.onsaved,this.validator,this.suffix});
  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: Text(
                widget.name,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)  ),

          TextFormField(
            onSaved: widget.onsaved,
            validator: widget.validator,
            obscureText:widget.secure ,

            decoration: InputDecoration(hintText: widget.hint,
                prefixIcon: Icon(widget.icondata,color: Colors.black26,),
                suffixIcon: widget.suffix

            ),),

        ],
      ),
    )
    ;
  }
}