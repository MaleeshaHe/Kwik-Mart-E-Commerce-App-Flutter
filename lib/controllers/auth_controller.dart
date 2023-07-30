import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kwik_mart/screens/auth/singnin_page.dart';
import 'package:kwik_mart/screens/home/main_screen.dart';
import 'package:kwik_mart/utils/navigator_utils.dart';
import 'package:logger/logger.dart';

class AuthController {
  //Sign Out User
  static Future<void> singOut() async {
    await FirebaseAuth.instance.signOut();
    Logger().i("User Sing Out");
  }

  //Sign In to User Account
  static Future<void> signInToAccount(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Logger().i(credential.user!.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Logger().e('No user found for that email..');
      } else if (e.code == 'wrong-password') {
        Logger().e('Worng password provided for that user...');
      }
    }
  }

  //Sign In to User Account
  static Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  //Create User Account with Email and Password
  static Future<void> createUserAccount(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      Logger().i(credential.user!.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Logger().e('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Logger().e('The account already exists for that email.');
      } else if (e.code == 'invalid-email') {
        Logger().e('Inalid Email');
      } else if (e.code == 'operation-not-allowed') {
        Logger().e('Operation Not Allowed');
      }
    } catch (e) {
      Logger().e(e);
    }
  }
}
