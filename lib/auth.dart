import 'package:firebase_auth/firebase_auth.dart';


class Authenticationservice {
  FirebaseAuth _authenticationservice;

  Authenticationservice(this._authenticationservice);

  Future<String> firebaseLogin(String userEmail, String userpassword) async {
    try {
      UserCredential user = await _authenticationservice.signInWithEmailAndPassword(
          email: userEmail, password: userpassword);

      return "signed in";
    } on FirebaseAuthException catch (e) {
      return e.message ?? "";
    }
  }

  Future<String> firebaseregister(String userEmail, String userPassword) async {
    try {
      UserCredential user =
          await _authenticationservice.createUserWithEmailAndPassword(
              email: userEmail, password: userPassword);

      return "signed up";
    } on FirebaseAuthException catch (e) {
      return e.message ?? "";
    }
  }
}