import 'package:flutter/material.dart';

class ChipWithIcon extends StatelessWidget {
  final Icon icon;
  final String text;
  const ChipWithIcon({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: icon,
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      labelPadding: const EdgeInsets.only(left: 10),
      label: Text(text),
    );
  }
}
