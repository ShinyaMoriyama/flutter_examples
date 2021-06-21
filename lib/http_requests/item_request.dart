import 'dart:convert';
import './item.dart';
import 'base_request.dart';
import 'package:http/http.dart' as http;

class RequestItem implements HTTPRequest<Item> {
  final String url;
  const RequestItem({required this.url});

  Future<Item> execute() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) {
      throw http.ClientException("Oh darn!");
    }

    return _parseJson(response.body);
  }

  Item _parseJson(String response) {
    print("rsponse: ${response.runtimeType}");
    print("rsponse: ${jsonDecode(response).runtimeType}");

    return Item.fromJson(jsonDecode(response));
  }
}
