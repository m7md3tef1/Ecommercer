import 'dart:async';

import 'package:flutter/material.dart';
import 'package:second_project/Screens/HomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
bool isFirst=false;
bool Signin=true;
checkIsScreenState()async{
  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
  setState(() {
    isFirst=sharedPreferences.getBool('firstTime');
    Signin=sharedPreferences.getBool('Sign');
  });
}

  @override
  initState() {
    // TODO: implement
    super.initState();
    checkIsScreenState();
    Timer(Duration(seconds: 3),
            (){
Navigator.popAndPushNamed(context,isFirst?'IntroScreen':Signin?'useroradmin':'SigninScreen');
            } );
    print('hello');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      body: Center(
        child:Image(image: AssetImage('image/150.jpg'),width: .4.sw,height: .9.sh,)


      ),
    );
  }
}

