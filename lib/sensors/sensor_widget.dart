import 'package:flutter/material.dart';
import './accelerometer.dart';
import './useraccelerometer.dart';
import './gyroscope.dart';

class SensorWidget extends StatelessWidget {
  const SensorWidget();
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 0.9,
      direction: Axis.vertical,
      children: const <Widget>[
        AccelerometerData(),
        UserAccelerometerData(),
        GyroscopeData()
      ],
    );
  }
}
