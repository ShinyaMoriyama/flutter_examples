import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Horizontal List';

    return MaterialApp(
        title: title,
        home: Scaffold(
          backgroundColor: Colors.greenAccent,
          appBar: AppBar(
            title: Text(title),
          ),
          body: Container(
              alignment: Alignment.center,
              child: Container(
                height: 240,
                width: 360,
                // color: Colors.blueGrey,
                transform: Matrix4.rotationZ(-0.25),
                alignment: Alignment.center,
                child: const Text(
                  "Containers!",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                color: Colors.pink,
                // decoration: const BoxDecoration(
                //   shape: BoxShape.circle,
                //   boxShadow: [
                //     BoxShadow(
                //       color: Colors.grey,
                //       spreadRadius: 5,
                //       blurRadius: 7,
                //       offset: Offset(1, 3),
                //     ),
                //   ],
                //   gradient: LinearGradient(
                //       begin: Alignment.topCenter,
                //       end: Alignment.bottomCenter,
                //       colors: [
                //         Color.fromARGB(10, 10, 10, 10),
                //         Color.fromARGB(40, 40, 40, 20)
                //       ]),
                // ),
              )),
        ));
  }
}
