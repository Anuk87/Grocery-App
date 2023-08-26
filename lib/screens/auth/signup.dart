import 'package:animate_do/animate_do.dart';

import 'package:flutter/material.dart';

import 'package:grocery_app/providers/auth/signup_provider.dart';
import 'package:grocery_app/screens/auth/login.dart';

import 'package:provider/provider.dart';

import '../../components/custom_button.dart';
import '../../components/custom_text.dart';
import '../../components/custom_textfield.dart';

import '../../utils/app_colors.dart';
import '../../utils/assets_constants.dart';
import '../../utils/util_functions.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // //-----email text controller
  // final emailController = TextEditingController();

  // //-----password controller
  // final passwordController = TextEditingController();

  // //-----name controller
  // final nameContrller = TextEditingController();

  //----- loader state
  // bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: BounceInDown(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 52),
                  const TextWidget(
                    "SignUp",
                    fontSize: 25,
                    textAlign: TextAlign.center,
                    color: AppColorss.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(height: 40),
                  SlideInDown(
                    duration: Duration(milliseconds: 2000),
                    child: Image.asset(
                      AssetConstants.logo,
                      height: 138,
                      width: 202,
                    ),
                  ),
                  const SizedBox(height: 39),
                  CustomTextfield(
                    hinText: "Name",
                    controller:
                        Provider.of<SignUpProvider>(context).nameController,
                  ),
                  const SizedBox(height: 8),
                  CustomTextfield(
                    hinText: "Email",
                    controller:
                        Provider.of<SignUpProvider>(context).emailController,
                  ),
                  const SizedBox(height: 8),
                  CustomTextfield(
                    hinText: "Password",
                    controller:
                        Provider.of<SignUpProvider>(context).passwordController,
                    isObscureText: true,
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () => UtilFunctions.navigateTo(context, Login()),
                      child: const TextWidget(
                        "Already have an account?",
                        fontSize: 14,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  const SizedBox(height: 29),
                  Consumer<SignUpProvider>(
                    builder: (context, value, child) {
                      return CustomButton(
                        isLoading: value.isLoading,
                        text: "SignUp",
                        onTap: () {
                          value.startSignup(context);
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 23),
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

  //   if (emailController.text.isEmpty ||
  //       passwordController.text.isEmpty ||
  //       nameContrller.text.isEmpty) {
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
