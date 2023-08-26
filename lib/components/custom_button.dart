import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../utils/app_colors.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.isLoading = false,
  }) : super(key: key);

  final String text;
  final Function() onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isLoading,
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 50,
          width: 259,
          decoration: BoxDecoration(
            color: AppColorss.primaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: isLoading
                ? const SpinKitRotatingCircle(
                    color: Colors.white,
                    size: 40.0,
                  )
                : TextWidget(
                    text,
                    fontSize: 18,
                    color: AppColorss.kWhite,
                    fontWeight: FontWeight.w500,
                  ),
          ),
        ),
      ),
    );
  }
}
