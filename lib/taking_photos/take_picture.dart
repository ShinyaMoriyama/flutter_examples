import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class TakePicture extends StatefulWidget {
  final CameraDescription camera;
  TakePicture({required this.camera});

  @override
  _TakePictureState createState() => _TakePictureState();
}

class _TakePictureState extends State<TakePicture> {
  late final CameraController _controller;
  late final Future<void> _initController;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.high,
    );

    _initController = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        FutureBuilder<void>(
          future: _initController,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Expanded(
                child: Center(
                  child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: CameraPreview(_controller),
                  ),
                ),
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
        IconButton(
          icon: const Icon(Icons.photo_camera),
          onPressed: () => _takePhoto(context),
        )
      ],
    );
  }

  void _takePhoto(BuildContext context) async {
    await _initController;

    // File name and path
    // final dir = await getTemporaryDirectory();
    // final name = "mypic_${DateTime.now()}.png";

    // Store the picture at the given location
    // final fullPath = path.join(dir.path, name);

    // await _controller.takePicture(fullPath);
    final image = await _controller.takePicture();

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text("Picture taken!"),
      duration: const Duration(milliseconds: 600),
    ));

    // If the picture was taken, display it on a new screen.
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DisplayPictureScreen(
          // Pass the automatically generated path to
          // the DisplayPictureScreen widget.
          imagePath: image.path,
        ),
      ),
    );
  }
}

// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({Key? key, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Image.file(File(imagePath)),
    );
  }
}
