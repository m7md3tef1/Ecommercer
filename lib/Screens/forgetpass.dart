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

          Image(image: AssetImage('image/150.jpg'),width:.2.sw,height: .5.sh,),

          CustomTextFormField(name:'Email' ,hint: 'Enter your mail',icondata: Icons.email,secure: false,),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0,20,8,8),
            child: Column(

              mainAxisAlignment: MainAxisAlignment.end,

              children: [

                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.green[400]),

                  width: 310.w,

                    child: InkWell(
                      onTap: () {
                        print('sign in');
                      },
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            'Sign in',
                            style: TextStyle(color: Colors.white, fontSize: 21,fontWeight: FontWeight.bold),
                          ),
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
