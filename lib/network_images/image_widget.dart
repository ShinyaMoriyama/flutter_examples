import 'package:flutter/material.dart';

class ImageFromWeb extends StatelessWidget {
  final String url;
  const ImageFromWeb({required this.url});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.network(
        url,
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
