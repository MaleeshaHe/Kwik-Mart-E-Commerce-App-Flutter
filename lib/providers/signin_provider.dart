import 'package:flutter/material.dart';
import 'package:kwik_mart/controllers/auth_controller.dart';
import 'package:logger/logger.dart';

class SignInProvider extends ChangeNotifier {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passWordController = TextEditingController();

  TextEditingController get emailController => _emailController;
  TextEditingController get passWordController => _passWordController;

  Future<void> signInUser() async {
    if (_emailController.text.isEmpty) {
      Logger().e("Please Insert Your Email");
    } else if (_passWordController.text.isEmpty) {
      Logger().e("Please Insert Your Password");
    } else {
      AuthController.signInToAccount(
              email: _emailController.text, password: _passWordController.text)
          .then((value) => clearTextField());
    }
  }

  void clearTextField() {
    _emailController.text = "";
    _passWordController.text = "";
  }
}
