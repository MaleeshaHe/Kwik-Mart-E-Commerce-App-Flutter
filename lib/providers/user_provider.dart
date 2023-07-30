import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kwik_mart/controllers/auth_controller.dart';
import 'package:kwik_mart/models/user_model.dart';
import 'package:kwik_mart/screens/home/profile_page/profile_page.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

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
          (User? user) async {
            if (user == null) {
              CustomNavigator.goTo(context, const SingInPage());
              Logger().e('User is currently signed out!');
            } else {
              fetchData(user.uid, context).then(
                (value) {
                  CustomNavigator.goTo(context, const MainScreen());
                  Logger().i('User is signed in! --- $user');
                },
              );
            }
          },
        );
      },
    );
  }

  Future<void> fetchData(uid, context) async {
    _user = await AuthController().getUserData(uid);
    setUserName(_user!.name.toString());
    notifyListeners();
  }

  Future<void> updateData(String name) async {
    AuthController().updateProfile(_user!.uid, name);
  }

  final TextEditingController _nameController = TextEditingController();

  TextEditingController get nameController => _nameController;

  void setUserName(String name) {
    _nameController.text = name;
    notifyListeners();
  }
}
