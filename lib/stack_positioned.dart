import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Horizontal List';

    return MaterialApp(
        title: title,
        home: Scaffold(
            backgroundColor: Colors.greenAccent,
            appBar: AppBar(
              title: Text(title),
            ),
            body: Stack(children: [
              Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(color: Colors.red)),
              Positioned(top: 0, left: 20, child: const Text("Hello")),
            ])));
  }
}
