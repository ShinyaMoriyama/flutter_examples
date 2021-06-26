import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:flutter/rendering.dart';

class RectanglePainter extends CustomPainter {
  final List<Face> facesPositions;
  final ui.Image selectedImage;

  static final Paint _painter = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 3.0
    ..color = Colors.redAccent;

  const RectanglePainter(
      {required this.facesPositions, required this.selectedImage});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawImage(selectedImage, Offset.zero, Paint());

    for (final face in facesPositions) {
      final coords = face.boundingBox;
      final rect =
          Rect.fromLTRB(coords.left, coords.top, coords.right, coords.bottom);

      canvas.drawRect(rect, _painter);
    }
  }

  @override
  bool shouldRepaint(RectanglePainter oldDelegate) =>
      selectedImage != oldDelegate.selectedImage ||
      facesPositions != oldDelegate.facesPositions;
}
