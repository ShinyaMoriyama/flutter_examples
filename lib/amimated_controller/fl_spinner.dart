import 'package:flutter/material.dart';
import './rotating_logo.dart';

void main() {
  return runApp(_AnimatedApp());
}

class _AnimatedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FLSpinner(),
    );
  }
}

class FLSpinner extends StatefulWidget {
  const FLSpinner({Key? key}) : super(key: key);

  @override
  State<FLSpinner> createState() => _FLSpinnerState();
}

class _FLSpinnerState extends State<FLSpinner> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final CurvedAnimation _curved;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3))
          ..repeat();
    _curved = CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceIn,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotatingLogo(controller: _curved);
  }
}
