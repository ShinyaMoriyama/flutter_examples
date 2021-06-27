import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import './login_form.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(DemoApp());
}

class DemoApp extends StatelessWidget {
  const DemoApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.orangeAccent,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          primary: Colors.deepPurple.shade300,
        )),
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Login form"),
        ),
        body: LayoutBuilder(
          builder: (context, dimensions) {
            final width = dimensions.maxWidth / 1.5;
            final height = dimensions.maxHeight / 2;

            return Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: width,
                      height: height,
                      child: LoginForm(),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
