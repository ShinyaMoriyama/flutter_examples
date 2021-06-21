import '../json_models/todos.dart';
import './json_parsers.dart';

class TodoParser extends JsonParser<List<Todo>> with ListDecoder<List<Todo>> {
  const TodoParser();

  @override
  Future<List<Todo>> parseFromJson(String json) async {
    return decodeJsonList(json)
        .map((value) => Todo.fromJson(value as Map<String, dynamic>))
        .toList();
  }
}
