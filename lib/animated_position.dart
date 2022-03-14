import 'package:flutter/material.dart';

void main() => runApp(AnimatedContainerApp());

class AnimatedContainerApp extends StatefulWidget {
  @override
  State<AnimatedContainerApp> createState() => _AnimatedContainerAppState();
}

class _AnimatedContainerAppState extends State<AnimatedContainerApp> {
  var alignment = Alignment.bottomLeft;

  @override
  void initState() {
    super.initState();
    // Future.delayed(
    //   Duration(milliseconds: 200),
    //   () {
    //     setState(() {
    //       alignment = Alignment.topRight;
    //     });
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('AnimatedContainer Demo'),
        ),
        body: GestureDetector(
          onTap: () => setState(() {
            alignment = Alignment.topLeft;
          }),
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(color: Colors.red),
            child: AnimatedAlign(
              curve: Curves.fastOutSlowIn,
              duration: Duration(milliseconds: 2000),
              alignment: alignment,
              child: Text("aaa"),
            ),
          ),
        ),
      ),
    );
  }
}
