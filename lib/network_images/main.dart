import 'package:flutter/material.dart';
import './svg_widget.dart';
import './image_widget.dart';

void main() => runApp(DemoApp());

class DemoApp extends StatelessWidget {
  const DemoApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("SVG Download"),
          ),
          body: const Center(
            child: SvgFromWeb(),
            // child: ImageFromWeb(
            //     url:
            //         "https://fluttercompletereference.com/demoimages/firefox.svg"),
          )),
    );
  }
}
