import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './detection_widget.dart';
import './face_provider.dart';

void main() => runApp(DemoApp());

class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FaceProvider>(
      create: (_) => FaceProvider(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Face detection"),
          ),
          body: const DetectionWidget(),
        ),
      ),
    );
  }
}
