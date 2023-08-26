import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/providers/auth/login_provider.dart';
import 'package:grocery_app/screens/auth/forgot_password.dart';
import 'package:provider/provider.dart';
import '../../components/custom_button.dart';
import '../../components/custom_text.dart';
import '../../components/custom_textfield.dart';
import '../../components/social_button.dart';
import '../../utils/app_colors.dart';
import '../../utils/assets_constants.dart';
import '../../utils/util_functions.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //-----email text controller
  final emailController = TextEditingController();

  //----- loader state
  bool isLoading = false;
  bool islogin = false;
  //-----password controller
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: BounceInDown(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 52),
                  const TextWidget(
                    "Login",
                    fontSize: 25,
                    textAlign: TextAlign.center,
                    color: AppColorss.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(height: 40),
                  Image.asset(
                    AssetConstants.logo,
                    height: 138,
                    width: 202,
                  ),
                  const SizedBox(height: 39),
                  CustomTextfield(
                    hinText: "Email",
                    controller:
                        Provider.of<LogInProvider>(context).emailController,
                  ),
                  const SizedBox(height: 8),
                  CustomTextfield(
                    hinText: "Password",
                    controller:
                        Provider.of<LogInProvider>(context).passwordController,
                    isObscureText: true,
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () => UtilFunctions.navigateTo(
                          context, const ForgotPassword()),
                      child: const TextWidget(
                        "Forgot your password?",
                        fontSize: 14,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  const SizedBox(height: 29),
                  Consumer<LogInProvider>(
                    builder: (context, value, child) {
                      return CustomButton(
                        isLoading: value.isLoading,
                        text: "Login",
                        onTap: () {
                          value.startLogIn(context);
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 23),
                  const TextWidget(
                    "Or login with social account",
                    fontSize: 14,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialButton(
                        iconPath: AssetConstants.googleIcon,
                        onTap: () {},
                      ),
                      const SizedBox(width: 16),
                      SocialButton(
                        iconPath: AssetConstants.fbIcon,
                        onTap: () {},
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // //----------- validate textfield function
  // bool validateFields() {
  //   // ------- first checking all the textfield are empty or not

  //   if (emailController.text.isEmpty || passwordController.text.isEmpty) {
  //     Alerthelper.showAlert(context, DialogType.error, AnimType.rightSlide,
  //         "Error", "Please fill all the fields");
  //     return false;
  //   } else if (!emailController.text.contains('@')) {
  //     Alerthelper.showAlert(context, DialogType.error, AnimType.rightSlide,
  //         "Error", "Please enter a valid email !");
  //     return false;
  //   } else if (passwordController.text.length < 6) {
  //     Alerthelper.showAlert(context, DialogType.error, AnimType.rightSlide,
  //         "Error", "Password must have 6 digits");
  //     return false;
  //   } else {
  //     return true;
  //   }
  // }
}
