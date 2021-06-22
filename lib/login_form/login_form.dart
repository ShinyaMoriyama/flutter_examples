import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  // The keyword static is needed not to avoid disappearing the keyboard immediately starting to edit
  // https://stackoverflow.com/questions/55672971/text-in-the-textfield-disappears-when-keyboard-is-removed
  static final _key = GlobalKey<FormState>();

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final emailController = TextEditingController();
  final passwController = TextEditingController();

  String? _validateEmail(String? value) {
    if (value != null && value.isEmpty) {
      return "Field cannot be empty";
    } else {
      return null;
    }
  }

  String? _validatePassword(String? value) {
    if (value!.length < 8) {
      return "At least 8 chars!";
    } else {
      return null;
    }
  }

  void _login() {
    if (LoginForm._key.currentState?.validate() ?? false) {
      final email = emailController.text;
      final passw = passwController.text;
      debugPrint("Yay! :)$email $passw");
      debugPrint(
          "selection: ${emailController.selection.start} - ${emailController.selection.end}");
    } else {
      debugPrint("Error :(");
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: LoginForm._key,

      // child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          // Email
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
                icon: Icon(Icons.mail), hintText: "Email"),
            validator: _validateEmail,
            // vali
          ),
          // Password
          TextFormField(
            controller: passwController,
            decoration: const InputDecoration(
                icon: Icon(Icons.vpn_key), hintText: "Password"),
            obscureText: true,
            validator: _validatePassword,
          ),

          // Confirm Button
          ElevatedButton(
            child: const Text("Login"),
            onPressed: _login,
          ),
        ],
      ),
      // ),
    );
  }
}
