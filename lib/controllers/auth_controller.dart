import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kwik_mart/models/user_model.dart';
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
  Future<void> createUserAccount(
      {required String email,
      required String password,
      required String name}) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then(
        (value) {
          addUser(value.user!.uid, name, value.user!.email);
        },
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

  // Save User data
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  Future<void> addUser(String uid, String name, String? email) {
    return users
        .doc(uid)
        .set({
          'name': name,
          'userImage':
              "https://static-01.daraz.lk/p/825a0d14604528f01b1ff003dc32f33c.jpg",
          'uid': uid,
          'email': email
        })
        .then((value) => Logger().i("User Added"))
        .catchError((error) => Logger().e(error));
  }

  //Fetch User data
  Future<UserModel?> getUserData(String uid) async {
    try {
      DocumentSnapshot userData = await users.doc(uid).get();
      return UserModel.fromMap(userData.data() as Map<String, dynamic>);
    } catch (e) {
      return null;
    }
  }

  //Update profile
  Future<void> updateProfile(uid, name) async {
    users.doc(uid).set({"name": name});
  }
}
