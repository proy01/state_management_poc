import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_poc/classes/screen_selector.dart';


class ScreenOne extends StatelessWidget {
  const ScreenOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Page One"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "This is the First Page",
              style: TextStyle(
                fontSize: 24
              ),
            ),
            Text(
              "${context.watch<ScreenSelector>().screenIndex}",
              key: const Key('screenNumber'),
              style: const TextStyle(
                fontSize: 32
              ),
            )
          ],
        ),
      ),
    );
  }
}
