import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';

class Alerthelper {
  // ------- function to show alert dialog box
  static Future<dynamic> showAlert(
    BuildContext context,
    DialogType dialogType,
    AnimType animType,
    String title,
    String desc,
  ) async {
    return AwesomeDialog(
      context: context,
      dialogType: dialogType,
      animType: animType,
      title: title,
      desc: desc,
      btnCancelOnPress: () {},
      btnOkOnPress: () {},
    ).show();
  }
}
