import 'package:flutter/material.dart';
import './sensor_widget.dart';

void main() => runApp(DemoApp());

class DemoApp extends StatelessWidget {
  const DemoApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Using sensors"),
          ),
          body: const Center(
            child: SensorWidget(),
          )),
    );
  }
}
