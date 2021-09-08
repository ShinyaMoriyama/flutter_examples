import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final List<String> imageList = [
    "https://upload.wikimedia.org/wikipedia/commons/a/a4/The_Endless_Summer_%281966_limited_release_poster%29.svg",
    // "https://upload.wikimedia.org/wikipedia/commons/3/36/Freedo_On_The_Beach.svg",
    "https://upload.wikimedia.org/wikipedia/commons/6/68/Emojione_1F304.svg",
    "https://upload.wikimedia.org/wikipedia/commons/0/01/Round_Landmark_Icon_Park.svg",
    // "https://upload.wikimedia.org/wikipedia/commons/c/cf/New_age_dolphin_rainbow.svg",
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(" Image Slider App "),
        ),
        backgroundColor: Colors.blue.shade400,
        body: Center(
          child: CarouselSlider(
            options: CarouselOptions(
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayInterval: Duration(milliseconds: 1500),
                onPageChanged: (index, reason) {
                  print("onPageChanged $index $reason");
                },
                aspectRatio: 16 / 16,
                viewportFraction: 0.6),
            items: imageList
                .map(
                  (e) => ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        SvgPicture.network(
                          e,
                          fit: BoxFit.cover,
                          // width: 350,
                          // height: 350,
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
