import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../todo_cache.dart';
import '../routes.dart';

class TodosPage extends StatelessWidget {
  const TodosPage();
  void _open(BuildContext context) =>
      Navigator.of(context).pushNamed(RouteGenerator.infoPage);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<TodoCache>(builder: (context, cache, _) {
        return ListView.builder(
          itemCount: cache.list.length,
          itemBuilder: (context, index) {
            return ListTile(
                title: Text("${cache.list[index].title}"),
                // title: Text("${cache[index].title}"),
                onTap: () {
                  cache.index = index;
                  _open(context);
                });
          },
        );
      }),
    );
  }
}
