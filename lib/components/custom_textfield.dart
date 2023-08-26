import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    Key? key,
    required this.hinText,
    this.isObscureText = false,
    required this.controller,
  }) : super(key: key);

  final String hinText;
  final bool isObscureText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColorss.kWhite,
        borderRadius: BorderRadius.circular(2),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            blurRadius: 5,
            color: AppColorss.kAsh.withOpacity(.2),
          )
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: isObscureText,
        decoration: InputDecoration(
          hintText: hinText,
          hintStyle: const TextStyle(color: AppColorss.kAsh),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
            borderSide: const BorderSide(color: AppColorss.kWhite),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
            borderSide: const BorderSide(color: AppColorss.kRed),
          ),
        ),
      ),
    );
  }
}
