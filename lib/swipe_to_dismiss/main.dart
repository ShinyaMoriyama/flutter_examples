import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './swipelist_provider.dart';
import './swipe_items.dart';

void main() => runApp(DemoApp());

class DemoApp extends StatelessWidget {
  const DemoApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Swipe to delete"),
          ),
          body: Center(
            child: ChangeNotifierProvider(
                create: (_) => SourceList(), child: SwipeItems()),
          )),
    );
  }
}
