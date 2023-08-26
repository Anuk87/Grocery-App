import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:logger/logger.dart';

class PlaginImplemetation extends StatefulWidget {
  const PlaginImplemetation({super.key});

  @override
  State<PlaginImplemetation> createState() => _PlaginImplemetationState();
}

class _PlaginImplemetationState extends State<PlaginImplemetation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.warning,
                animType: AnimType.scale,
                title: 'Hello',
                desc: 'How are you?',
                btnCancelOnPress: () {
                  Logger().i("Hello world");
                },
                btnOkOnPress: () {},
                barrierColor: Colors.amber,
              ).show();
            },
            child: const Text("Show me"),
          ),
        ),
      ),
    );
  }
}
