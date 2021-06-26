import 'dart:ui' as ui;
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import './face_detector_data.dart';

class FaceDetectorModel {
  const FaceDetectorModel();

  Future<FaceDetectorData> detectFaces() async {
    // Choose the image
    final picker = ImagePicker();
    final imageFile = await picker.getImage(
      source: ImageSource.gallery,
      maxWidth: 260,
      maxHeight: 250,
    );

    // Detect faces
    String filePath;
    if (imageFile != null) {
      filePath = imageFile.path;
    } else {
      filePath = '';
    }
    final file = File(filePath);
    final image = InputImage.fromFile(file);
    final detector = GoogleMlKit.vision.faceDetector();

    // Process data
    final faces = await detector.processImage(image);
    final canvasImage = await _decodeImage(file);
    return FaceDetectorData(faces, canvasImage);
  }

  Future<ui.Image> _decodeImage(File file) async {
    final rawFile = await file.readAsBytes();
    final codec = await ui.instantiateImageCodec(rawFile);
    final frameInfo = await codec.getNextFrame();
    return frameInfo.image;
  }
}
