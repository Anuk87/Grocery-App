import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/controllers/auth_contoller.dart';
import 'package:grocery_app/screens/auth/login.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/utils/assets_constants.dart';
import 'package:grocery_app/utils/util_functions.dart';
import '../../components/custom_text.dart';
import '../auth/signup.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    // Future.delayed(const Duration(seconds: 3), () {
    //   UtilFunctions.navigateTo(context, SignUp());
    // });
    AuthController().initializeUser(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 189),
            child: Center(
              child: FadeInDown(
                child: Image.asset(
                  AssetConstants.logo,
                  height: 225,
                  width: 331,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 72.44,
          ),
          SizedBox(
            width: 258,
            child: FadeInUp(
              child: const TextWidget(
                "Shop Your Daily Necessary",
                fontSize: 30,
                textAlign: TextAlign.center,
                color: AppColorss.primaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
