import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
 forFirstTime()async{
   SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
   sharedPreferences.setString('firstTime', 'yes');
 }

  @override
  void initState(){
   super.initState();
   forFirstTime();
  }
  Widget build(BuildContext context) {
    return IntroductionScreen(
        skip: Text('Skip'),
        done: Text('Done'),
        next: Icon(Icons.arrow_forward),
        showNextButton: true,
        showSkipButton: true,
        onDone: () {
          Navigator.popAndPushNamed(context, 'SigninScreen');
        },
        pages: [
          PageViewModel(
              image: Image.asset('image/1.jpg'
              ),
              title: 'Welcome to Our App',
              body:
                  'Healthy foods are those that provide you with the nutrients you need to sustain your body’s well-being and retain energy. Water, carbohydrates, fat, protein, vitamins, and minerals are the key nutrients that make up a healthy, balanced die'),
          PageViewModel(
              image: Image.asset('image/2.png'),
              title: 'We Cook Healthy Food',
              body: ' Healthy foods are those that provide you with the nutrients you need to sustain your body’s well-being and retain energy. Water, carbohydrates, fat, protein, vitamins, and minerals are the key nutrients that make up a healthy, balanced die'),
          PageViewModel(
              image: Image.asset('image/3.png'),
              title: 'We Cook Healthy Food ',
              body: ' Healthy foods are those that provide you with the nutrients you need to sustain your body’s well-being and retain energy. Water, carbohydrates, fat, protein, vitamins, and minerals are the key nutrients that make up a healthy, balanced die'),
          PageViewModel(
              image: Image.asset('image/4.png'),
              title: 'We Cook Healthy Food',
              body: 'Healthy foods are those that provide you with the nutrients you need to sustain your body’s well-being and retain energy. Water, carbohydrates, fat, protein, vitamins, and minerals are the key nutrients that make up a healthy, balanced die'),
        ],
        dotsDecorator: const DotsDecorator(
          size: Size(10.0, 10.0),
          color: Color(0xFFBDBDBD),
          activeSize: Size(22.0, 10.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ));
  }
}
