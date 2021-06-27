import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

abstract class UserRepository<T> {
  Future<T> register();
  Future<T> signIn();
  Future<void> signOut();
}

class EmailUser implements UserRepository<UserCredential> {
  final String email;
  final String password;
  const EmailUser({required this.email, required this.password});

  @override
  Future<UserCredential> register() async {
    final auth = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return auth;
  }

  @override
  Future<UserCredential> signIn() async => await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: email, password: password);

  @override
  Future<void> signOut() async => await FirebaseAuth.instance.signOut();
}
