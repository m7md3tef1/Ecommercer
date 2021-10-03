import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:second_project/Screens/AddProductScreen.dart';
import 'package:second_project/Screens/AdminScreen.dart';
import 'package:second_project/Screens/CategoryScreen.dart';
import 'package:second_project/Screens/DeleteScreen.dart';
import 'package:second_project/Screens/HomeScreen.dart';
import 'package:second_project/Screens/cartScreen.dart';
import 'package:second_project/Screens/favScreen.dart';
import 'package:second_project/Screens/forgetpass.dart';
import 'package:second_project/Screens/introScreen.dart';
import 'package:second_project/Screens/productDetails.dart';
import 'package:second_project/Screens/signinScreen.dart';
import 'package:second_project/Screens/signoutScreen.dart';
import 'package:second_project/Screens/splashScreen.dart';
import 'package:second_project/Screens/user%20or%20admin.dart';
import 'package:second_project/providers/cartprovid.dart';
import 'package:second_project/providers/favProvid.dart';
import 'package:second_project/providers/themeproviders.dart';
import 'package:second_project/widgets/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:second_project/providers/modalHud.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(

      MultiProvider(providers: [
        ChangeNotifierProvider(create: (context)=>ModalHud()),
        ChangeNotifierProvider(create: (context)=>Themeprovider()),
        ChangeNotifierProvider(create: (context)=>FavouriteList()),
        ChangeNotifierProvider(create: (context)=>CartList()),
      ],
          child: commecer()));
}
class commecer extends StatefulWidget {
  const commecer({Key key}) : super(key: key);

  @override
  _commecerState createState() => _commecerState();
}

class _commecerState extends State<commecer> {
  @override
  Widget build(BuildContext context) {
    return 
      ScreenUtilInit(
        builder:()=> MaterialApp(
        theme: Provider.of<Themeprovider>(context).islight ==true?lightMode:darkMode,

        debugShowCheckedModeBanner: false,
         initialRoute: 'SplashScreen',
         routes: {
          'SplashScreen':(context)=>SplashScreen(),
           'HomeScreen':(context)=>HomeScreen(),
           'SigninScreen':(context)=>SigninScreen(),
           'SignoutScreen':(context)=>SignoutScreen(),
           CategoryScreen.id:(context)=>CategoryScreen(),
           'ForgetPass':(context)=>ForgetPass(),
           'IntroScreen':(context)=>OnboardingScreen(),
           'CartScreen':(context)=>cartScreen(),
           productDetails.id:(context)=>productDetails(),
           'favScreen':(context)=>FavScreen(),
           'useroradmin':(context)=>useroradminScreen(),
           'AdminScreen':(context)=>AdminScreen(),
           'AddProductScreen':(context)=>AddProductScreen(),
           'DeleteScreen':(context)=>DeleteProduct()
         },
    ),
      );
  }
}