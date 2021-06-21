import 'package:flutter/material.dart';
import './error_widget.dart';
import './base_request.dart';
import './item.dart';
import './success_widget.dart';

class HTTPWidget extends StatefulWidget {
  final HTTPRequest<Item> _request;
  const HTTPWidget(this._request);

  @override
  _HTTPWidgetState createState() => _HTTPWidgetState();
}

class _HTTPWidgetState extends State<HTTPWidget> {
  late final Future<Item> futureItems;

  @override
  void initState() {
    super.initState();
    futureItems = widget._request.execute();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: futureItems,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const ErrorItemWidget();
          }

          if (snapshot.hasData) {
            print(snapshot.data);
            return SuccessItemWidget(snapshot.data as Item);
          }

          return const Center(child: CircularProgressIndicator());
        });
  }
}
