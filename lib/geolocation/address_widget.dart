import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

class AddressWidget extends StatefulWidget {
  final double lat;
  final double lon;
  const AddressWidget({required this.lat, required this.lon});

  @override
  _AddressWidgetState createState() => _AddressWidgetState();
}

class _AddressWidgetState extends State<AddressWidget> {
  late final Future<List<Placemark>> placemarks;

  @override
  void initState() {
    super.initState();

    placemarks = placemarkFromCoordinates(widget.lat, widget.lon);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Placemark>>(
      future: placemarks,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data;
          if (data != null) {
            print('data.length: ${data.length}');
            return Text("${data.toString()} ${widget.lat} | ${widget.lon}");
          } else {
            return Text('error occurs');
          }
        }
        if (snapshot.hasError) {
          return Text('error occurs');
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
