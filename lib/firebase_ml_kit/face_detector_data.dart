import 'dart:ui' as ui;
import 'package:google_ml_kit/google_ml_kit.dart';

class FaceDetectorData {
  final List<Face> faces;
  final ui.Image image;
  const FaceDetectorData(this.faces, this.image);
}
