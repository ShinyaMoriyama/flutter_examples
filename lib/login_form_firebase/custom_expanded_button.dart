import 'package:flutter/material.dart';

class CustomExpandedButton extends StatelessWidget {
  final String label;
  final onPressed;
  CustomExpandedButton({required this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        child: Text(label),
        onPressed: onPressed,
      ),
    );
  }
}
