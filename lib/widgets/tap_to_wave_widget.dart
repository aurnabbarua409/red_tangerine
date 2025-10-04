import 'dart:math';
import 'package:flutter/material.dart';

class TapToWave extends StatefulWidget {
  final Widget child;
  final Duration singleWaveDuration;
  final double maxAngle;
  final int repeats; // how many back-and-forths per tap

  const TapToWave({
    Key? key,
    required this.child,
    this.singleWaveDuration = const Duration(milliseconds: 600),
    this.maxAngle = 0.5, // slightly larger for emphasis
    this.repeats = 2,
  }) : super(key: key);

  @override
  _TapToWaveState createState() => _TapToWaveState();
}

class _TapToWaveState extends State<TapToWave>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _anim;

  @override
  void initState() {
    super.initState();

    final totalMs = widget.singleWaveDuration.inMilliseconds;

    _ctrl = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: (totalMs * widget.repeats).round()),
    );

    // Build the full sequence dynamically
    final sequence = <TweenSequenceItem<double>>[];

    // Start straight first
    sequence.add(
      TweenSequenceItem(
        tween: Tween(
          begin: 0.0,
          end: widget.maxAngle,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 25,
      ),
    );

    for (var i = 0; i < widget.repeats; i++) {
      sequence.add(
        TweenSequenceItem(
          tween: Tween(
            begin: widget.maxAngle,
            end: -widget.maxAngle,
          ).chain(CurveTween(curve: Curves.easeInOut)),
          weight: 50,
        ),
      );
      sequence.add(
        TweenSequenceItem(
          tween: Tween(
            begin: -widget.maxAngle,
            end: widget.maxAngle,
          ).chain(CurveTween(curve: Curves.easeInOut)),
          weight: 50,
        ),
      );
    }

    // End by returning to straight
    sequence.add(
      TweenSequenceItem(
        tween: Tween(
          begin: widget.maxAngle,
          end: 0.0,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 25,
      ),
    );

    _anim = TweenSequence<double>(sequence).animate(_ctrl);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  void _playWave() {
    if (_ctrl.isAnimating) return;
    _ctrl.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _playWave,
      child: AnimatedBuilder(
        animation: _anim,
        builder: (context, child) {
          return Transform.rotate(
            angle: _anim.value,
            alignment: Alignment(0, 0.8),
            child: child,
          );
        },
        child: widget.child,
      ),
    );
  }
}
