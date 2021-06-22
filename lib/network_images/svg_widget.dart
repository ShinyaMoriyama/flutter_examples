import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';
import './downloader.dart';
import './error_widget.dart' as NetWorkErrorWidget;
import './decoder_loader.dart';
import './network_loader.dart';

class SvgFromWeb extends StatefulWidget {
  const SvgFromWeb();

  @override
  _SvgFromWebState createState() => _SvgFromWebState();
}

class _SvgFromWebState extends State<SvgFromWeb> {
  late final Downloader downloader;
  late final Future<List<int>> svgImage;

  @override
  void initState() {
    super.initState();
    downloader = const Downloader(url: "/demoimages/firefox.svg");
    svgImage = downloader.start();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<int>>(
      future: svgImage,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const NetWorkErrorWidget.ErrorWidget();
        }

        if (snapshot.hasData) {
          if (snapshot.data != null) {
            return SvgPicture.memory(
              Uint8List.fromList(snapshot.data!),
              placeholderBuilder: (_) => const DecoderLoader(),
            );
          } else {
            return const NetWorkErrorWidget.ErrorWidget();
          }
        }

        return const NetworkLoader();
      },
    );
  }
}
