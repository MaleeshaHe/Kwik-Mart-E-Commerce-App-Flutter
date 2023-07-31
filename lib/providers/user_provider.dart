import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kwik_mart/controllers/auth_controller.dart';
import 'package:kwik_mart/controllers/storeage_controller.dart';
import 'package:kwik_mart/models/user_model.dart';
import 'package:kwik_mart/utils/custom_dialog.dart';
import 'package:logger/logger.dart';

import '../screens/auth/singnin_page.dart';
import '../screens/home/main_screen.dart';
import '../utils/navigator_utils.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _user;
  UserModel? get userData => _user;

  final TextEditingController _nameController = TextEditingController();

  TextEditingController get nameController => _nameController;

  ImagePicker picker = ImagePicker();
  File _image = File("");
  File get image => image;

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

  // Future<void> updateData() async {
  //   AuthController().updateProfile(_user!.uid, name);
  // }

  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  //Update profile
  Future<void> updateProfile(BuildContext context) async {
    CustomDialog.show(context);
    if (_image.path != "") {
      String imageUrl =
          await StorageController().uploadImage(_image, "User Image");

      users.doc(_user!.uid).update(
          {"name": _nameController.text, "userImage": imageUrl}).then((value) {
        CustomDialog.toast(context, "User Updated");
        CustomDialog.dismiss(context);
      });
    } else {
      users.doc(_user!.uid).update({"name": _nameController.text}).then(
        (value) {
          CustomDialog.dismiss(context);
          Logger().i("User Updated");
        },
      );
    }
  }

  void setUserName(String name) {
    _nameController.text = name;
    notifyListeners();
  }

  Future<void> pickImage() async {
    XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      _image = File(pickedImage.path);
      notifyListeners();
      Logger().i(_image.path);
    } else {
      Logger().e("Try Again");
    }
  }
}
