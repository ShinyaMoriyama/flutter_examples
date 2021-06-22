import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './dropdown_button.dart';
import './dropdown_provider.dart';

void main() => runApp(DemoApp());

class DemoApp extends StatelessWidget {
  const DemoApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Dropdown Example"),
        ),
        body: ChangeNotifierProvider<DropdownText>(
          create: (_) => DropdownText(),
          child: Center(
            child: const SizedBox(
              width: 250,
              height: 100,
              child: DropDown(),
            ),
          ),
        ),
      ),
    );
  }
}
