
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:second_project/Services/authFile.dart';
import 'package:second_project/widgets/customtextfile.dart';

class ForgetPass extends StatefulWidget {
  const ForgetPass({Key key}) : super(key: key);

  @override
  _ForgetPassState createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  TextEditingController forgetControler=TextEditingController();
  var s=true;
  var auth = AuthClass();
  var ForgetKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: ForgetKey,
      body: SingleChildScrollView(
        child: SafeArea(
          child: InkWell(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Column(

              children: [
                Align(alignment: Alignment.topLeft, child: BackButton()),
                Image(
                  image: AssetImage('image/150.jpg'),
                  width: .9.sw,
                  height: .5.sh,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .05,
                ),
                CustomTextFormField(
                  name: 'Email',
                  hint: 'Enter your email',
                  controller: forgetControler,
                  icondata: Icons.email,
                  suffix: InkWell(
                      onTap: () {
                        setState(() {
                          s = !s;
                        });
                      },
                      child: s?Icon(
                        Icons.remove_red_eye,
                        color: Colors.grey,
                      ):Icon(
                    Icons.remove_red_eye,
                    color: Colors.black,
                  )),
                  secure:  s == true ? true : false,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .05,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 20, 8, 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.green[400]),
                        width: 310.w,
                        child: InkWell(
                          onTap: ()  {
                            if (forgetControler.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text('Please Enter email')));
                            } else {
                             try{
                               auth.forgetPass(forgetControler.text);
                             ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('You Send Reset Email ')));

                             }catch(e){
                               ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
                             }
                                }
                          },
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'Reset Email',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold),
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
          ),
        ),
      ),
    );
  }
}
