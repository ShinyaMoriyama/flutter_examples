import 'package:flutter/material.dart';
import './api/json_models/todos.dart';
import './api/http_client.dart';
import './api/json_parsers/todo_parser.dart';
import './error_widget.dart';

class FetchDataPage extends StatefulWidget {
  const FetchDataPage({Key? key}) : super(key: key);

  @override
  _FetchDataPageState createState() => _FetchDataPageState();
}

class _FetchDataPageState extends State<FetchDataPage> {
  late final Future<List<Todo>> todos;
  @override
  void initState() {
    super.initState();
    todos = RequestREST(endpoint: "/todos")
        .executeGet<List<Todo>>(const TodoParser());
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Todo>>(
      future: todos,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data;
          if (data != null) {
            print('data.length: ${data.length}');
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final tmp = "Data to show: ${data[index].id}";
                return Center(child: Text(tmp));
                // return
              },
            );
          } else {
            return const ErrorItemWidget();
          }
        }
        if (snapshot.hasError) {
          return const ErrorItemWidget();
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
