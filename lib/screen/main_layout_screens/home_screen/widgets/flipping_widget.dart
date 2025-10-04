import 'dart:math';

import 'package:flutter/material.dart';

class FlipTextIcon extends StatefulWidget {
  final Widget icon;
  final Widget text;

  const FlipTextIcon({Key? key, required this.icon, required this.text})
    : super(key: key);

  @override
  State<FlipTextIcon> createState() => _FlipTextIconState();
}

class _FlipTextIconState extends State<FlipTextIcon>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: 2 * pi,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
    _controller.repeat(); // keeps flipping
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (_, child) {
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001) // perspective
            ..rotateY(_animation.value),
          child: child,
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [widget.icon, const SizedBox(height: 10), widget.text],
      ),
    );
  }
}

class SwipeUpHint extends StatefulWidget {
  final Widget icon;

  const SwipeUpHint({Key? key, required this.icon}) : super(key: key);

  @override
  State<SwipeUpHint> createState() => _SwipeUpHintState();
}

class _SwipeUpHintState extends State<SwipeUpHint>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    // start from bottom-left (y = 1) to top-left (y = -1)
    _animation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: const Offset(0, -0.2),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(position: _animation, child: widget.icon);
  }
}

class SwipeLeftHint extends StatefulWidget {
  final Widget icon;

  const SwipeLeftHint({Key? key, required this.icon}) : super(key: key);

  @override
  State<SwipeLeftHint> createState() => _SwipeLeftHintState();
}

class _SwipeLeftHintState extends State<SwipeLeftHint>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    // start from bottom-left (y = 1) to top-left (y = -1)
    _animation = Tween<Offset>(
      begin: const Offset(0.5, 0),
      end: const Offset(-0.5, 0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(position: _animation, child: widget.icon);
  }
}
