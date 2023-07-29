import 'package:flutter/material.dart';
import 'package:kwik_mart/controllers/auth_controller.dart';
import 'package:logger/logger.dart';

class SignUpProvider extends ChangeNotifier {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passWordController = TextEditingController();
  final TextEditingController _confirmPassWordController =
      TextEditingController();

  TextEditingController get emailController => _emailController;
  TextEditingController get passWordController => _passWordController;
  TextEditingController get confirmPassWordController =>
      _confirmPassWordController;

  Future<void> signUpUser() async {
    if (_emailController.text.isEmpty) {
      Logger().e("Please Insert Your Email");
    } else if (_passWordController.text.isEmpty) {
      Logger().e("Please Insert Your Password");
    } else if (_passWordController.text != _confirmPassWordController.text) {
      Logger().e("Check Your Password");
    } else {
      AuthController.createUserAccount(
          email: _emailController.text, password: _passWordController.text);
    }
  }
}
