import 'package:flutter/material.dart';
// import '../routes.dart';
import 'dart:math';

class RandomPage extends StatelessWidget {
  const RandomPage();
  @override
  Widget build(BuildContext context) {
    final rand = Random().nextInt(20);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("$rand"),
            ElevatedButton(
              onPressed: () {
                if (Navigator.canPop(context)) {
                  print("Can pop");
                } else {
                  print("Cannot pop");
                }
                Navigator.pop(context);
              },
              child: const Text("Random"),
            )
          ],
        ),
      ),
    );
  }
}
