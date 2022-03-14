import 'dart:math' as math;

import 'package:flutter/material.dart';

class RotatingLogo extends AnimatedWidget {
  final CurvedAnimation controller;
  const RotatingLogo({required this.controller})
      : super(listenable: controller);

  static const _fullRotation = 2 * math.pi;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: controller.value * _fullRotation,
      child: const FlutterLogo(
        size: 80,
      ),
    );
  }
}
