import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:second_project/widgets/customtextfile.dart';
class ForgetPass extends StatefulWidget {
  const ForgetPass({Key key}) : super(key: key);

  @override
  _ForgetPassState createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 10,),
          Image(image: AssetImage('image/logo.webp'),width:.2.sw,height: .5.sh,),
          SizedBox(height: 70,),
          CustomTextFormField(name:'Email' ,hint: 'Enter your mail',icondata: Icons.email,secure: false,),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(

              mainAxisAlignment: MainAxisAlignment.end,

              children: [

                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.green),

                  height: .1.sh,
                  width: .85.sw,

                    child: InkWell(
                      onTap: () {
                        print('sign in');
                      },
                      child: Center(
                        child: Text(
                          'Sign in',
                          style: TextStyle(color: Colors.white, fontSize: 21,fontWeight: FontWeight.bold),
                        ),
                      ),

                    ),
                  ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
