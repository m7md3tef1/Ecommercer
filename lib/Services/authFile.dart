import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthClass {
  var fireAuth = FirebaseAuth.instance;
  var fireStore = FirebaseFirestore.instance;
  var googleSignIn = GoogleSignIn(scopes: ['email']);

  signup(email, password, name) async {
    var u = await fireAuth.createUserWithEmailAndPassword(
        email: email, password: password,);
    await fireAuth.currentUser.sendEmailVerification();
    await fireStore.collection('Users').doc(u.user.uid).set(
        {
          'email':email,
          'id':u.user.uid,
          'name':name
        });
  }

  signin(email, password) async {
    await fireAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  forgetPass(email) async {
    await fireAuth.sendPasswordResetEmail(email: email);
  }

  Signout() async {
    await fireAuth.signOut();
  }

  signInWithGoogle() async {
    var googleUser = await googleSignIn.signIn();

    var getIds = await googleUser.authentication;

    AuthCredential googleCredential = GoogleAuthProvider.credential(
      accessToken: getIds.accessToken,
      idToken: getIds.idToken,
    );
    await fireAuth.signInWithCredential(googleCredential);
  }
}
