import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import './address_widget.dart';

class GPSWidget extends StatelessWidget {
  static final _stream = Geolocator.getPositionStream();
  const GPSWidget();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      direction: Axis.vertical,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: <Widget>[
        SvgPicture.asset(
          "assets/geolocate.svg",
          height: 70,
        ),
        StreamBuilder<Position>(
          stream: _stream,
          builder: (context, positionData) {
            if (positionData.hasData) {
              final data = positionData.data;

              if (data != null) {
                final latDouble = data.latitude.toStringAsFixed(5);
                final lonDouble = data.longitude.toStringAsFixed(5);
                final lat = double.parse(latDouble);
                final lon = double.parse(lonDouble);

                return AddressWidget(lat: lat, lon: lon);
              } else {
                return const Text("No data available.");
              }
            }

            return const CircularProgressIndicator();
          },
        )
      ],
    );
  }
}
