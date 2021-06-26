import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './rectangle_painter.dart';
import './face_detector_data.dart';
import './face_detector_model.dart';
import './face_provider.dart';

class DetectFacesFromImage extends StatefulWidget {
  const DetectFacesFromImage();

  @override
  _DetectFacesFromImageState createState() => _DetectFacesFromImageState();
}

class _DetectFacesFromImageState extends State<DetectFacesFromImage> {
  late final Future<FaceDetectorData> _faces;
  final _model = FaceDetectorModel();

  @override
  void initState() {
    super.initState();

    _faces = _model.detectFaces();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FaceDetectorData>(
      future: _faces,
      builder: (context, facesList) {
        if (facesList.hasData) {
          final data = facesList.data;

          if (data != null) {
            return Center(
              child: Wrap(
                spacing: 10,
                crossAxisAlignment: WrapCrossAlignment.center,
                direction: Axis.vertical,
                children: <Widget>[
                  SizedBox(
                    width: 260,
                    height: 250,
                    child: CustomPaint(
                      painter: RectanglePainter(
                          facesPositions: data.faces,
                          selectedImage: data.image),
                    ),
                  ),
                  Consumer<FaceProvider>(
                    builder: (context, detector, _) {
                      return ElevatedButton(
                        child: const Text("New detection"),
                        onPressed: () => detector.setDetectorVisible(false),
                      );
                    },
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: Text("Error while processing data :("),
            );
          }
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
