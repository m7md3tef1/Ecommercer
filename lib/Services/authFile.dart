import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthClass
{
  var fireAuth =FirebaseAuth.instance;
  var googleSignIn=GoogleSignIn(scopes: ['email']);

  signup(email,password)async
  {
    await fireAuth.createUserWithEmailAndPassword(email: email, password: password) ;
    await fireAuth.currentUser.sendEmailVerification();
  }
  signin(email,password)async
  {
    await fireAuth.signInWithEmailAndPassword(email: email, password: password);

  }
  forgetPass(email)async
  {
    await fireAuth.sendPasswordResetEmail(email: email);
  }
  signInWithGoogle()async{
    var googleUser = await googleSignIn.signIn();

    var getIds = await googleUser.authentication;

   AuthCredential googleCredential = GoogleAuthProvider.credential(
      accessToken: getIds.accessToken,
      idToken: getIds.idToken,
    );

     await fireAuth.signInWithCredential(googleCredential);
  }
  }
