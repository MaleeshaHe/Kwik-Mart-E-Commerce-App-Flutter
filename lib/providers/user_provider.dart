import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kwik_mart/models/user_model.dart';
import 'package:logger/logger.dart';

import '../screens/auth/singnin_page.dart';
import '../screens/home/main_screen.dart';
import '../utils/navigator_utils.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _user;
  UserModel? get userData => _user;

  //Check current User Auth State
  Future<void> checkAuthState(BuildContext context) async {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        FirebaseAuth.instance.authStateChanges().listen(
          (User? user) {
            if (user == null) {
              CustomNavigator.goTo(context, const SingInPage());
              Logger().e('User is currently signed out!');
            } else {
              _user = UserModel(
                name: "",
                userImage: "",
                email: user.email.toString(),
                uid: user.uid,
              );
              CustomNavigator.goTo(context, const MainScreen());
              Logger().e('User is signed in! --- $user');
            }
          },
        );
      },
    );
  }
}
