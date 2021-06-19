import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../todo_cache.dart';

class InfoPage extends StatelessWidget {
  const InfoPage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<TodoCache>(builder: (context, cache, _) {
          final item = cache.list[cache.index];
          return Text("${item.description}");
        }),
      ),
    );
  }
}
