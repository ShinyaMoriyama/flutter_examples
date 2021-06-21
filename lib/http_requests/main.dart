import 'package:flutter/material.dart';
import './item_request.dart';
import './request_page.dart';

void main() => runApp(DemoApp());

class DemoApp extends StatelessWidget {
  final req =
      const RequestItem(url: "https://jsonplaceholder.typicode.com/posts/10");

  const DemoApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text("Request Demo"),
            ),
            body: Center(
              child: HTTPWidget(req),
            )));
  }
}
