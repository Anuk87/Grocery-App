import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import '../../controllers/auth_contoller.dart';
import '../../utils/alert_helper.dart';

class LogInProvider extends ChangeNotifier {
  //-----email text controller
  final _emailController = TextEditingController();
  //-----get email controller
  TextEditingController get emailController => _emailController;

  //-----password controller
  final _passwordController = TextEditingController();
  //-----get password controller
  TextEditingController get passwordController => _passwordController;
  //-----loading state
  bool _isLoading = false;

  //-----get loading state
  bool get isLoading => _isLoading;

  void setLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  //----------- validate textfield function
  bool validateFields(BuildContext context) {
    // ------- first checking all the textfield are empty or not

    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      Alerthelper.showAlert(context, DialogType.error, AnimType.rightSlide,
          "Error", "Please fill all the fields");
      return false;
    } else if (!emailController.text.contains('@')) {
      Alerthelper.showAlert(context, DialogType.error, AnimType.rightSlide,
          "Error", "Please enter a valid email !");
      return false;
    } else if (passwordController.text.length < 6) {
      Alerthelper.showAlert(context, DialogType.error, AnimType.rightSlide,
          "Error", "Password must have 6 digits");
      return false;
    } else {
      return true;
    }
  }

  //--------Start login process
  Future<void> startLogIn(BuildContext context) async {
    try {
      if (validateFields(context)) {
        setLoading(true);

        await AuthController()
            .signUser(context, emailController.text, passwordController.text);
        //------ clear text field
        emailController.clear();

        passwordController.clear();

        setLoading(false);
      }
    } catch (e) {
      setLoading(false);
      Logger().e(e);
      Alerthelper.showAlert(context, DialogType.error, AnimType.rightSlide,
          "ERROR", e.toString());
    }
  }
}
