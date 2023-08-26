import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../components/custom_text.dart';
import 'counter_provide.dart';

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  // int number = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: (() {
                    Provider.of<CounterProvide>(context, listen: false)
                        .decrease();
                  }),
                  child: const Text("-")),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Consumer<CounterProvide>(
                  builder: (context, value, child) {
                    return TextWidget(
                      "${value.counter}",
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    );
                  },
                ),
              ),
              ElevatedButton(
                  onPressed: (() {
                    Provider.of<CounterProvide>(context, listen: false)
                        .incres();
                  }),
                  child: const Text("+")),
            ],
          ),
          ElevatedButton(
              onPressed: (() {}), child: const Text("GO TO PAGE TWO")),
        ],
      ),
    );
  }
}
