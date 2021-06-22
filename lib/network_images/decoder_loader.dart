import 'package:flutter/material.dart';

class DecoderLoader extends StatelessWidget {
  const DecoderLoader();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: const [
        CircularProgressIndicator(),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text("Decoding SVG..."),
        )
      ],
    );
  }
}
