import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kwik_mart/screens/auth/singup_page.dart';
import 'package:kwik_mart/screens/home/home_page.dart';
import 'package:kwik_mart/utils/navigator_utils.dart';
import 'package:logger/logger.dart';

class AuthController {
  //Check current User Auth State
  static Future<void> checkAuthState(BuildContext context) async {
    Future.delayed(
      const Duration(seconds: 6),
      () {
        FirebaseAuth.instance.authStateChanges().listen(
          (User? user) {
            if (user == null) {
              CustomNavigator.goTo(context, const SingUpPage());
              Logger().e('User is currently signed out!');
            } else {
              CustomNavigator.goTo(context, const HomePage());
              Logger().e('User is signed in! --- $user');
            }
          },
        );
      },
    );
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
