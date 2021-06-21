import 'package:flutter/material.dart';

class SlidingPageRoute extends PageRouteBuilder {
  final Widget navigateTo;
  SlidingPageRoute({required this.navigateTo})
      : super(
          pageBuilder: (context, _, __) => navigateTo,
          // transitionsBuilder: (context, animation, _, child) => SlideTransition(
          transitionsBuilder: (context, animation, _, child) =>
              makeSlide(animation, child),
        );

  static SlideTransition makeSlide(Animation<double> animation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, 1),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }

  // static ScaleTransition makeSlide(Animation<double> animation, Widget child) {
  //   return ScaleTransition(
  //     scale: Tween<double>(
  //       begin: 0,
  //       end: 1,
  //     ).animate(animation),
  //     child: child,
  //   );
  // }

  // static RotationTransition makeSlide(
  //     Animation<double> animation, Widget child) {
  //   return RotationTransition(
  //     turns: Tween<double>(
  //       begin: 0,
  //       end: 1,
  //     ).animate(animation),
  //     child: child,
  //   );
  // }

  // static FadeTransition makeSlide(Animation<double> animation, Widget child) {
  //   return FadeTransition(
  //     opacity: Tween<double>(
  //       begin: 0,
  //       end: 1,
  //     ).animate(animation),
  //     child: child,
  //   );
  // }
}
