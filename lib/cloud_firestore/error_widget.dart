import 'package:flutter/material.dart';

class ErrorWidget extends StatelessWidget {
  const ErrorWidget();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(
        Icons.error_outline,
        color: Colors.redAccent,
        size: 20,
      ),
    );
  }
}
