import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTransitionWidget extends CustomTransition {
  @override
  Widget buildTransition(
    BuildContext context,
    Curve? curve,
    Alignment? alignment,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final curvedAnimation = CurvedAnimation(
      parent: animation,
      curve: curve ?? Curves.easeInOut,
    );

    // Slide from bottom
    final slide = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(curvedAnimation);

    // Slight zoom effect
    final scale = Tween<double>(begin: 0.98, end: 1.0).animate(curvedAnimation);

    return SlideTransition(
      position: slide,
      child: FadeTransition(
        opacity: curvedAnimation,
        child: ScaleTransition(scale: scale, child: child),
      ),
    );
  }
}

