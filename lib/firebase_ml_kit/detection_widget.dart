import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './face_provider.dart';
import './detection_img_picker.dart';
import './face_detector_widget.dart';

class DetectionWidget extends StatelessWidget {
  const DetectionWidget();

  @override
  Widget build(BuildContext context) {
    return Consumer<FaceProvider>(
      builder: (context, faceDetector, _) {
        if (faceDetector.isDetectorVisible) {
          return const DetectFacesFromImage();
        }

        return const DetectionImgPicker();
      },
    );
  }
}
