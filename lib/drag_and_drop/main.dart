import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './drag_widget.dart';
import './game_score.dart';

void main() => runApp(DemoApp());

class DemoApp extends StatelessWidget {
  const DemoApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Drag and Drop"),
          ),
          body: Center(
            child: ChangeNotifierProvider<GameScore>(
                create: (_) => GameScore(), child: DragWidget()),
          )),
    );
  }
}
