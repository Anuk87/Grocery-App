import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/screens/auth/login.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../components/custom_button.dart';
import '../../components/custom_text.dart';
import '../../components/custom_textfield.dart';
import '../../components/social_button.dart';
import '../../controllers/auth_contoller.dart';
import '../../utils/alert_helper.dart';
import '../../utils/app_colors.dart';
import '../../utils/assets_constants.dart';
import '../../utils/util_functions.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  //-----email text controller
  final emailController = TextEditingController();

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 52),
                const TextWidget(
                  "Forgot Password",
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
                const SizedBox(height: 100),
                const Align(
                  alignment: Alignment.centerRight,
                  child: TextWidget(
                    "Please, enter your email address. You will receive a link to create a new password via email.",
                    fontSize: 14,
                    textAlign: TextAlign.start,
                  ),
                ),
                const SizedBox(height: 16),
                CustomTextfield(
                  hinText: "Email",
                  controller: emailController,
                ),
                const SizedBox(height: 53),
                CustomButton(
                  text: "Send Reset Email",
                  isLoading: isLoading,
                  onTap: () async {
                    if (validateFields()) {
                      setState(() {
                        isLoading = true;
                      });
                      await AuthController()
                          .sendPassResetEmail(context, emailController.text);
                      //------ clear text field
                      emailController.clear();

                      emailController.clear();
                      setState(() {
                        isLoading = false;
                      });
                    }
                  },
                ),
                const SizedBox(height: 23),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool validateFields() {
    // ------- first checking all the textfield are empty or not

    if (emailController.text.isEmpty) {
      Alerthelper.showAlert(context, DialogType.error, AnimType.rightSlide,
          "Error", "Please fill all the fields");
      return false;
    } else {
      return true;
    }
  }
}
