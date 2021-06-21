// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can
// be found in the LICENSE file.

// Demonstrates a basic shared element (Hero) animation.

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'routes_transitions.dart';

class PhotoHero extends StatelessWidget {
  const PhotoHero(
      {required this.photo, required this.onTap, required this.width});

  final String photo;
  final VoidCallback onTap;
  final double width;

  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Image.asset(
              photo,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}

class HeroAnimation extends StatelessWidget {
  Widget build(BuildContext context) {
    timeDilation = 2.0; // 1.0 means normal animation speed.

    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        title: const Text('Basic Hero Animation'),
      ),
      body: Center(
        child: PhotoHero(
          photo: 'images/flippers-alpha.png',
          width: 300.0,
          onTap: () {
            Navigator.of(context).push(SlidingPageRoute(
                navigateTo: Scaffold(
              appBar: AppBar(
                title: const Text('Flippers Page'),
              ),
              body: Container(
                // Set background to blue to emphasize that it's a new route.
                color: Colors.lightBlueAccent,
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.topLeft,
                child: PhotoHero(
                  photo: 'images/flippers-alpha.png',
                  width: 100.0,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            )));
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: HeroAnimation()));
}
