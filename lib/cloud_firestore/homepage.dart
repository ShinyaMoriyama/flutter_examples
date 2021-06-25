import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import './favorite_list_widget.dart';
import './error_widget.dart' as MyAppErrorWidget;

class HomePage extends StatefulWidget {
  const HomePage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final Future<FirebaseApp> _initialization;

  @override
  void initState() {
    super.initState();
    _initialization = Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseApp>(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const MyAppErrorWidget.ErrorWidget();
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return const FavoriteList();
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
