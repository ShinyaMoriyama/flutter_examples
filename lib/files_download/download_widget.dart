import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './progress.dart';

class DownloadWidget extends StatelessWidget {
  final String url =
      "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf";
  const DownloadWidget();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<DownloadProgress>(
        builder: (context, status, _) {
          var progress = status.progress.toStringAsFixed(1);

          return ElevatedButton(
            child: Text("$progress %"),
            onPressed: () => status.start(url: url, localPath: "file_p2.pdf"),
          );
        },
      ),
    );
  }
}
