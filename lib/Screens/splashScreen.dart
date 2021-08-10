import 'dart:async';

import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
String isFirst;
checkIsScreenState()async{
  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
  isFirst=sharedPreferences.getString('firstTime');
}

  @override
  initState() {
    // TODO: implement
    checkIsScreenState();
    super.initState();
    Timer(Duration(seconds: 3),
            (){
Navigator.popAndPushNamed(context, isFirst==null?'IntroScreen':'SigninScreen');
            } );
    print('hello');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child:Image(image: AssetImage('image/logo.webp'),width: .4.sw,height: .9.sh,)


      ),
    );
  }
}

