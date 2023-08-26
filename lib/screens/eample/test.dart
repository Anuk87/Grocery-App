import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Teat extends StatelessWidget {
  const Teat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          // padding: EdgeInsets.all(20.0),
          height: 200,
          width: 300,
          color: Colors.amber,
          child: Text("Hello"),
        ),
      ),
    );
  }
}
