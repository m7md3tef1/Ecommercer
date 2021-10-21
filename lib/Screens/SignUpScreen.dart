import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:second_project/Services/authFile.dart';
import 'package:second_project/widgets/customtextfile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:second_project/providers/modalHud.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class SignoutScreen extends StatefulWidget {
  const SignoutScreen({Key key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignoutScreen> {
  var auth = AuthClass();
  var signupKey = GlobalKey<FormState>();
  var s = true;
  var email, name, pass, ConfirmPass;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        SingleChildScrollView(
          child: SafeArea(
            child: ModalProgressHUD(
              inAsyncCall: Provider.of<ModalHud>(context,).isLoading,
              progressIndicator: SpinKitFadingCircle(
                itemBuilder: (BuildContext context, int index) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      color: index.isEven ? Colors.deepPurple : Colors.green,
                    ),
                  );
                },
              ),
              child:
              InkWell(
                onTap: (){
                  FocusScope.of(context).unfocus();
                },
                child: Column(children: [
      Image(
                image: AssetImage('image/150.jpg'),
                width: .5.sw,
                height: .3.sh,

      ),
      SizedBox(
                height: 5,
      ),
      Form(
                key: signupKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      name: 'Name',
                      hint: 'Choose Your name',
                      onsaved: (value) {
                        name = value;
                      },
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return 'please Enter Name';
                        }
                      },
                      icondata: Icons.person,
                      secure: false,
                    ),
                    CustomTextFormField(
                      name: 'Email',
                      hint: 'Enter Your email',
                      onsaved: (value) {
                        email = value;
                      },
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return 'please Enter Email';
                        }
                      },
                      icondata: Icons.email,
                      secure: false,
                    ),
                    CustomTextFormField(
                      name: 'password',
                      hint: 'Enter Password',
                      onsaved: (value) {
                        pass = value;
                      },
                      suffix: InkWell(
                          onTap: () {
                            setState(() {
                              s = !s;
                            });
                          },
                          child: Icon(Icons.remove_red_eye, color: Colors.black54)),
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return 'please Enter Pass';
                        }
                      },
                      icondata: Icons.lock,
                      secure: s == true ? true : false,
                    ),
                    CustomTextFormField(
                      name: 'Confirm password',
                      hint: 'Confirm password',
                      onsaved: (value) {
                        ConfirmPass = value;
                      },
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return 'please Enter Confirm Pass';
                        } else if (ConfirmPass != pass) {
                          return 'pass Didn\'t Same Confirm pass';
                        }
                      },
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
                      icondata: Icons.lock,
                      secure: s == true ? true : false,
                    ),
                  ],
                ),
      ),
      Padding(
                padding: const EdgeInsets.fromLTRB(30, 5.0, 30.0, 2.0),
                child: InkWell(
                  onTap: () async {
                    Provider.of<ModalHud>(context,listen: false).changeIsLoading(true);
                    try {
                      signupKey.currentState.save();
                      if (signupKey.currentState.validate()) {
                        await auth.signup(email, pass,name);
                        Provider.of<ModalHud>(context, listen: false)
                            .changeIsLoading(false);
                        Navigator.pushNamedAndRemoveUntil(
                            context, 'HomeScreen', (route) => false);
                      } else {
                        Provider.of<ModalHud>(context, listen: false)
                            .changeIsLoading(false);
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Complete Require Data')));
                      }
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
                        color: Colors.green[400], borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.white, fontSize: 28),
                        ),
                      ),
                    ),
                  ),
                ),
      ),
      TextButton(
                  child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'SigninScreen');
                },
                child: Text('Already have account?',
                    style: TextStyle(color: Colors.black, fontSize: 20)),
      ))
    ]),
              ),
            ),
          ),
        ));
  }
}
