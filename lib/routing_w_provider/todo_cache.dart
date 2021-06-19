import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './routes/todos_page.dart';
import './todo.dart';
import './routes.dart';

class TodoCache {
  var _index = -1;
  final List<Todo> _todos = [
    Todo("Item 1", "First to-do of the list"),
    Todo("Item 2", "Second to-do of the list"),
    Todo("Item 3", "Third to-do of the list"),
  ];
  void addItem(String title, String descr) {
    _todos.add(Todo(title, descr));
  }

  int get index => _index;
  set index(int value) {
    if ((value >= 0) && (value < _todos.length)) {
      _index = value;
    } else {
      _index = -1;
    }
  }

  UnmodifiableListView<Todo> get list => UnmodifiableListView<Todo>(_todos);
}

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<TodoCache>(
        create: (_) => TodoCache(),
        child: MaterialApp(
          onGenerateTitle: (context) => "Random App",
          // initialRoute: RouteGenerator.homePage,
          // onGenerateInitialRoutes: RouteGenerator.generateInitialRoutes,
          onGenerateRoute: RouteGenerator.generateRoute,
          // Hides the debug stripe on the top-right corner
          // which might be annoying to see!
          debugShowCheckedModeBanner: false,
          home: const TodosPage(),
        ));
  }
}
