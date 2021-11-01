import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:second_project/Services/authFile.dart';
import 'package:second_project/providers/modalHud.dart';
import 'package:second_project/widgets/customtextfile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key key}) : super(key: key);

  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  var auth = AuthClass();
  var s = true;
  var SignInKey = GlobalKey<FormState>();
  String email, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: Provider.of<ModalHud>(
            context,
          ).isLoading,
          progressIndicator: SpinKitCubeGrid(
            itemBuilder: (BuildContext context, int index) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: index.isEven ? Colors.deepPurple : Colors.deepPurple,
                ),
              );
            },
          ),
          child: SingleChildScrollView(
            child: SafeArea(
              child:
              InkWell(
                onTap: (){
FocusScope.of(context).unfocus();
                },
                child: Column(children: [
                  Image(
                    image: AssetImage('image/150.jpg'),
                    width: .50.sh,
                    height: .30.sw,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Log in with your Email',
                      style: TextStyle(color: Colors.black, fontSize: 22),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Form(
                    key: SignInKey,
                    child: Column(children: [
                      CustomTextFormField(
                        name: 'Email',
                        hint: 'Enter Email',
                        onsaved: (value) {
                          email = value;
                        },
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return 'Please Enter Email';
                          }
                        },
                        icondata: Icons.email,
                        secure: false,
                      ),
                      CustomTextFormField(
                        name: 'Password',
                        hint: 'Enter Password',
                        suffix: InkWell(
                            onTap: () {
                              setState(() {
                                s = !s;
                              });
                            },
                            child: Icon(
                              Icons.remove_red_eye,
                              color: Colors.black54,
                            )),
                        onsaved: (value) {
                          password = value;
                        },
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return 'Please Enter Password';
                          }
                        },
                        icondata: Icons.lock,
                        secure: s == true ? true : false,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 120,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'ForgetPass');
                                },
                                child: Text(
                                  'Forgot your Password?',
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 15),
                                )),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'SignoutScreen');
                                },
                                child: Text(
                                  'Sign up',
                                  style: TextStyle(
                                      color: Colors.black26,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 5.0, 30.0, 5.0),
                        child: InkWell(
                          onTap: () async {
                            Provider.of<ModalHud>(context, listen: false)
                                .changeIsLoading(true);
                            if (SignInKey.currentState.validate()) {
                              SignInKey.currentState.save();
                              try {
                                await auth.signin(email, password);
                                Provider.of<ModalHud>(context, listen: false)
                                    .changeIsLoading(false);
                                Navigator.popAndPushNamed(context, 'useroradmin');
                              } catch (error) {
                                print(error);
                                Provider.of<ModalHud>(context, listen: false)
                                    .changeIsLoading(false);
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(error.toString())));
                              }
                            } else {
                              Provider.of<ModalHud>(context, listen: false)
                                  .changeIsLoading(false);
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text('Complete Require Data')));
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.green[400],
                                borderRadius: BorderRadius.circular(14)),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Sign In ',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 28),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'SignoutScreen');
                            },
                            child: Text(
                              'Don\'t have an account',
                              style:
                                  TextStyle(color: Colors.black26, fontSize: 20),
                            )),
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .03,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30.0, 1, 11.0, 6),
                    child: Row(
                      children: [
                        SizedBox(
                            width: .35.sw,
                            child: Divider(
                              color: Colors.black26,
                              thickness: 3,
                            )),
                        Align(
                            alignment: Alignment.center,
                            child: Text(
                              '  OR  ',
                              style:
                                  TextStyle(color: Colors.black26, fontSize: 20),
                            )),
                        SizedBox(
                            width: .35.sw,
                            child: Divider(
                              color: Colors.black26,
                              thickness: 3,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .03,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(22.h, 5.0.h, 22.0.h, 5.0.h),
                        child: InkWell(
                          onTap: () async {
                            Provider.of<ModalHud>(context, listen: false)
                                .changeIsLoading(true);
                            try {
                              Provider.of<ModalHud>(context, listen: false)
                                  .changeIsLoading(false);
                              await auth.signInWithGoogle();
                              Navigator.popAndPushNamed(context, 'useroradmin');
                            } catch (e) {
                              Provider.of<ModalHud>(context, listen: false)
                                  .changeIsLoading(false);
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(e.toString()),
                                backgroundColor: Colors.red,
                              ));
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(13)),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Icon(
                                    FontAwesomeIcons.google,
                                    color: Colors.red,
                                  ),
                                ),
                                Text(
                                  ' SIGN IN WITH Google',
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(22.h, 5.0.h, 22.0.h, 5.0.h),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(13)),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(12.h),
                                child: Icon(
                                  FontAwesomeIcons.facebook,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                ' SIGN IN WITH Facebook',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
