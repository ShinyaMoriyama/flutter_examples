import 'package:flutter/material.dart';
import './routes/todos_page.dart';
import './routes/info_page.dart';

class RouteGenerator {
  static const String homePage = '/';
  static const String infoPage = '/random';
  RouteGenerator._() {}
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
      // return MaterialPageRoute(
      //   builder: (_) => const HomePage(),
      // );
      case infoPage:
        return MaterialPageRoute(
          builder: (_) => const InfoPage(),
        );
      default:
        throw FormatException("Route not found");
    }
  }

  // static List<Route> generateInitialRoutes(String name) {
  //   return <Route>[
  //     MaterialPageRoute(
  //       builder: (_) => const TodosPage(),
  //     )
  //   ];
  // }
}

class RouteException implements Exception {
  final String message;
  const RouteException(this.message);
}
