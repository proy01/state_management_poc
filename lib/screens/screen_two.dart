import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_poc/classes/screen_selector.dart';


class ScreenTwo extends StatelessWidget {
  const ScreenTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Page Two"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "This is the Second Page",
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
