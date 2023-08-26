import 'package:flutter/cupertino.dart';
import 'package:grocery_app/controllers/auth_contoller.dart';
import 'package:logger/logger.dart';

import '../../models/objects.dart';

class UserProvider extends ChangeNotifier {
  //-------user model
  late UserModel _userModel;

  //-------get user
  UserModel get userModel => _userModel;

  //------fetch single user
  // Future<void> fetchUser(String id) async{
  //   await AuthController().fetchUserData(id).then((value){
  //     if(value != null){
  //       Logger().w(value.email);
  //       _userModel = value;
  //     }
  //   });

  // }
}
