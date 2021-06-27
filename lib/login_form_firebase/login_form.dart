import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './user.dart';
import 'custom_expanded_button.dart';

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

  void _register() async {
    _processCredential(() async {
      final email = emailController.text;
      final passw = passwController.text;
      final provider = EmailUser(email: email, password: passw);
      final user = await provider.register();
      print(user);
    });
  }

  void _login() async {
    _processCredential(() async {
      final email = emailController.text;
      final passw = passwController.text;
      final provider = EmailUser(email: email, password: passw);
      final user = await provider.signIn();
      print(user);
    });
  }

  void _checkUser() async {
    final user = FirebaseAuth.instance.currentUser;
    final msg = user == null
        ? "User is now signed out!"
        : "${user.email} ${user.emailVerified}";

    _showDialog(msg);
  }

  void _showDialog(String msg) {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              title: new Text("Firebase"),
              content: new Text(msg),
              actions: <Widget>[
                TextButton(
                  child: Text('Close me!'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }

  void _processCredential(Function func) async {
    if (LoginForm._key.currentState?.validate() ?? false) {
      try {
        await func();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('Error: weak password');
        } else if (e.code == 'email-already-in-use') {
          print('Error: email already in use');
        } else {
          print(e.toString());
        }
      } catch (e) {
        print("Whoops, something's gone wrong :(");
        print(e);
      }
      _checkUser();
    } else {
      debugPrint("Error :(");
    }
  }

  void _logout() async {
    _processCredential(() async {
      final email = emailController.text;
      final passw = passwController.text;
      AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: passw);

      await FirebaseAuth.instance.currentUser!
          .reauthenticateWithCredential(credential);

      await FirebaseAuth.instance.currentUser?.delete();
    });
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

      child: SingleChildScrollView(
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
            const SizedBox(
              height: 20,
            ),
            CustomExpandedButton(
              label: "Register!",
              onPressed: _register,
            ),
            CustomExpandedButton(
              label: "Login!",
              onPressed: _login,
            ),
            CustomExpandedButton(
              label: "Check!",
              onPressed: _checkUser,
            ),
            CustomExpandedButton(
              label: "Logout!",
              onPressed: _logout,
            ),
          ],
        ),
      ),
      // ),
    );
  }
}
