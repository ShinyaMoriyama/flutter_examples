import 'package:flutter/material.dart';
import './routes/home_page.dart';
import './routes/random_page.dart';

class RouteGenerator {
  static const String homePage = '/';
  static const String randomPage = '/random';
  RouteGenerator._() {}
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
      // return MaterialPageRoute(
      //   builder: (_) => const HomePage(),
      // );
      case randomPage:
        return MaterialPageRoute(
          builder: (_) => const RandomPage(),
        );
      default:
        throw FormatException("Route not found");
    }
  }

  static List<Route> generateInitialRoutes(String name) {
    return <Route>[
      MaterialPageRoute(
        builder: (_) => const HomePage(),
      )
    ];
  }
}

class RouteException implements Exception {
  final String message;
  const RouteException(this.message);
}
