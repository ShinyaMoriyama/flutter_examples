import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(" Image Slider App "),
        ),
        body: Center(
          child: CarouselDemo(),
        ),
      ),
    );
  }
}

class CarouselDemo extends StatefulWidget {
  @override
  _CarouselDemoState createState() => _CarouselDemoState();
}

class _CarouselDemoState extends State<CarouselDemo> {
  final List<String> imageList = [
    "https://upload.wikimedia.org/wikipedia/commons/a/a4/The_Endless_Summer_%281966_limited_release_poster%29.svg",
    "https://upload.wikimedia.org/wikipedia/commons/3/36/Freedo_On_The_Beach.svg",
    "https://upload.wikimedia.org/wikipedia/commons/6/68/Emojione_1F304.svg",
    "https://upload.wikimedia.org/wikipedia/commons/0/01/Round_Landmark_Icon_Park.svg",
    "https://upload.wikimedia.org/wikipedia/commons/c/cf/New_age_dolphin_rainbow.svg",
  ];
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) => Column(children: <Widget>[
        CarouselSlider(
          items: imageList
              .map((e) => ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        SvgPicture.network(
                          e,
                          fit: BoxFit.fitHeight,
                          // width: 1050,
                          // height: 350,
                        ),
                      ],
                    ),
                  ))
              .toList(),
          carouselController: buttonCarouselController,
          options: CarouselOptions(
            autoPlay: false,
            enlargeCenterPage: true,
            viewportFraction: 0.9,
            aspectRatio: 2.0,
            initialPage: 2,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            buttonCarouselController.nextPage(
                duration: Duration(milliseconds: 300), curve: Curves.linear);
          },
          child: Text('→'),
        )
      ]);
}
