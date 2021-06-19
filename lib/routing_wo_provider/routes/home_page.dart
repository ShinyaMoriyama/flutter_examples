import 'package:flutter/material.dart';
import '../routes.dart';

class HomePage extends StatelessWidget {
  const HomePage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () =>
              Navigator.of(context).pushNamed(RouteGenerator.randomPage),
          child: const Text("Random"),
        ),
      ),
    );
  }
}
