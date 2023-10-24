import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:studynut/models/users.dart';
import 'package:studynut/services/database.dart';

class CurrentUser extends ChangeNotifier {
  OurUser _currentUser = OurUser();

  OurUser get getCurrentUser => _currentUser;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> onStartUp() async {
    String retVal = "error";

    try {
      User? user = _auth.currentUser;
      if (user != null) {
        _currentUser = await OurDatabase().getUserInfo(user.uid);
        retVal = "success";
      }
      retVal = "success";
    } catch (e) {
      print(e);
    }

    return retVal;
  }

  Future<String> signOut() async {
    String retVal = "error";

    try {
      await _auth.signOut();
      _currentUser = OurUser();

      retVal = "success";
    } catch (e) {
      print(e);
    }

    return retVal;
  }

  Future<String> signUpUser(
      String email, String password, String fullName) async {
    String retval = "error";

    OurUser user = OurUser();
    try {
      UserCredential authresult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      user.uid = authresult.user!.uid;
      user.email = authresult.user!.email;
    user.fullName = fullName;
      String returnString = await OurDatabase().createUser(user);
      if (returnString == 'success') {
        retval = 'success';
      }
    } on PlatformException catch (e) {
      retval = e.toString();
    } catch (e) {
      print(e);
    }
    return retval;
  }

  Future<String> loginUserWithEmail(String email, String password) async {
    String retval = "error";

    try {
      UserCredential authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (authResult.user != null) {
        _currentUser.uid = authResult.user!.uid;
        _currentUser.email = authResult.user?.email;
        retval = "success";
      }
    } catch (e) {
      retval = e.toString();
    }
    return retval;
  }

  Future<String> loginUserWithGoogle() async {
    String retval = "error";
    GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: ['email', 'https://www.googleapis.com/auth/contacts.readonly'],
    );
    OurUser user = OurUser();
    try {
      GoogleSignInAccount? googleuser = await googleSignIn.signIn();
      GoogleSignInAuthentication? googleAuth = await googleuser?.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleAuth?.idToken, accessToken: googleAuth?.accessToken);
      UserCredential authResult = await _auth.signInWithCredential(credential);

      if (authResult.additionalUserInfo!.isNewUser) {
        user.uid = authResult.user!.uid;
        user.email = authResult.user?.email;
        user.fullName = authResult.user?.displayName;
        OurDatabase().createUser(user);
      }
      _currentUser = await OurDatabase().getUserInfo(authResult.user!.uid);
      retval = "success";
      // if (authResult.user != null) {
      //   _currentUser.uid = authResult.user?.uid;
      //   _currentUser.email = authResult.user?.email;
      //   retval = "success";
      // }
    } catch (e) {
      retval = e.toString();
    }
    return retval;
  }
}
