import 'dart:math';
import 'package:flutter/material.dart';
import 'package:red_tangerine/constant/app_icons.dart';
import 'package:red_tangerine/widgets/icon_widget.dart';

class AnimatedHeartButton extends StatefulWidget {
  const AnimatedHeartButton({super.key});

  @override
  _AnimatedHeartButtonState createState() => _AnimatedHeartButtonState();
}

class _AnimatedHeartButtonState extends State<AnimatedHeartButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  bool _isTapped = false;
  final int sparkCount = 20; // Number of sparkles
  final Random random = Random();

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    // Heart pulse animation
    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.8), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 1.8, end: 1.0), weight: 50),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reset();
        setState(() {
          _isTapped = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTap() {
    if (!_isTapped) {
      _controller.forward();
      setState(() {
        _isTapped = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final sparkColors = [
      Colors.white,
      Colors.yellow.shade300,
      Colors.orange.shade300,
      Colors.yellow.shade100,
    ];

    return GestureDetector(
      onTap: _onTap,
      child: SizedBox(
        width: 80,
        height: 80,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Sparkle effect
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Stack(
                  children: List.generate(sparkCount, (index) {
                    final angle = 2 * pi * index / sparkCount;
                    final distance = 25 + random.nextDouble() * 20; // spread
                    final progress = _controller.value;
                    final opacity = ((1.0 - progress) + 0.5).clamp(0.0, 1.0);
                    final scale = 0.5 + random.nextDouble(); // random size
                    final color =
                        sparkColors[random.nextInt(sparkColors.length)];

                    return Positioned(
                      left: cos(angle) * distance * progress + 40,
                      top: sin(angle) * distance * progress + 40,
                      child: Transform.scale(
                        scale: scale * progress,
                        child: Opacity(
                          opacity: opacity,
                          child: _Sparkle(color: color),
                        ),
                      ),
                    );
                  }),
                );
              },
            ),
            // Heart icon
            AnimatedBuilder(
              animation: _scaleAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _scaleAnimation.value,
                  child: IconWidget(
                    icon: AppIcons.heartIcon,
                    color: _isTapped ? Colors.pinkAccent : Colors.redAccent,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Sparkle widget
class _Sparkle extends StatelessWidget {
  final Color color;

  const _Sparkle({this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    final random = Random();
    return Container(
      width: 6 + random.nextDouble() * 4, // 6–10 px
      height: 6 + random.nextDouble() * 4,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.9),
            blurRadius: 4 + random.nextDouble() * 4, // 4–8 blur
            spreadRadius: 2 + random.nextDouble() * 2, // 2–4 spread
          ),
        ],
      ),
    );
  }
}
