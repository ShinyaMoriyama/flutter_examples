import 'package:flutter/material.dart';

class ErrorWidget extends StatelessWidget {
  const ErrorWidget();

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.error,
      size: 25,
      color: Colors.red,
    );
  }
}
