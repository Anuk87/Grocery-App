import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../components/custom_text.dart';

class PageTwo extends StatefulWidget {
  const PageTwo({super.key});

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (() {}), child: const Text("-")),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: TextWidget(
                  "0",
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
              ElevatedButton(onPressed: (() {}), child: const Text("+")),
            ],
          ),
          ElevatedButton(onPressed: (() {}), child: const Text("GO BACK")),
        ],
      ),
    );
  }
}
