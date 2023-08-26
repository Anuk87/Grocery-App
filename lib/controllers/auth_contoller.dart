import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'package:grocery_app/screens/auth/signup.dart';
import 'package:grocery_app/utils/util_functions.dart';
import 'package:logger/logger.dart';

import '../models/objects.dart';
import '../screens/main/main_screen.dart';
import '../utils/alert_helper.dart';

class AuthController {
  final FirebaseAuth auth = FirebaseAuth.instance;

  //---------------creates the user collection refference
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  //---------signup funtion
  Future<void> registerUser(
    BuildContext context,
    String email,
    String password,
    String name,
  ) async {
    try {
      // ---- send email and password to the firebase and create user
      await auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) async {
        // check if the return (User credential) value is not null
        if (value.user != null) {
          //------save other user data in cloud firestore
          await saveUserData(value.user!.uid, name, email);
          // ignore: use_build_context_synchronously
          Alerthelper.showAlert(context, DialogType.success,
              AnimType.rightSlide, "Success", "User created successfully !");
        }
      });
    } on FirebaseAuthException catch (e) {
      Alerthelper.showAlert(
          context, DialogType.error, AnimType.rightSlide, "Error", e.code);
    } catch (e) {
      Alerthelper.showAlert(context, DialogType.error, AnimType.rightSlide,
          "Error", e.toString());
    }
  }

  // --------- save user data in firestore cloud
  Future<void> saveUserData(String uid, String name, String email) async {
    return users
        .doc(uid)
        .set(
          {
            'uid': uid,
            'name': "Mary Jane",
            'email': email,
          },
          SetOptions(merge: true),
        )
        .then((value) => Logger().i("User data saved"))
        .catchError((error) => Logger().e("Failed to merge data: $error"));
  }

  //----------fetch user data saves in cloud firestore
  Future<void> fetchUserData(String uid) async {
    try {
      //Firebase query that fetch use data
      DocumentSnapshot snapshot = await users.doc(uid).get();
      Logger().w(snapshot.data());

      //mapping fetched data to user model
      UserModel model =
          UserModel.fromJson(snapshot.data() as Map<String, dynamic>);
      Logger().w(model.name);
    } catch (e) {
      Logger().e(e);
    }
  }

  //---------sign in funtion

  Future<void> signUser(
    BuildContext context,
    String email,
    String password,
  ) async {
    try {
      // ---- send email and password to the firebase and check if the user exists or not
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      Alerthelper.showAlert(
          context, DialogType.error, AnimType.rightSlide, "Error", e.code);
    } catch (e) {
      Alerthelper.showAlert(context, DialogType.error, AnimType.rightSlide,
          "Error", e.toString());
    }
  }

  // --------- initiak=lize and check wether the user is signed in or not
  Future<void> initializeUser(BuildContext context) async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user == null) {
        Logger().i('User is currently signed out!');
        UtilFunctions.navigateTo(context, const SignUp());
      } else {
        Logger().i('User is signed in!');
        await fetchUserData(user.uid);
        // ignore: use_build_context_synchronously
        UtilFunctions.navigateTo(context, MainScreen(uid: user.uid));
      }
    });
  }

  // ----- signout function
  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  //----- send password reset email
  Future<void> sendPassResetEmail(BuildContext context, String email) async {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: email)
        .then((value) {
      // ---- show a dialog when the email is sent
      Alerthelper.showAlert(context, DialogType.success, AnimType.rightSlide,
          'Email Sent', "Please check your inbox");
    });
  }
}
