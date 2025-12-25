import 'package:flutter/material.dart';

class FlipCard extends StatefulWidget {
  final Widget front;
  final Widget back;
  final Duration flipDuration;

  const FlipCard({
    super.key,
    required this.front,
    required this.back,
    this.flipDuration = const Duration(seconds: 1),
  });

  @override
  FlipCardState createState() => FlipCardState();
}

class FlipCardState extends State<FlipCard> with TickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> flipAnimation;

  bool isFlipped = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: widget.flipDuration,
      vsync: this,
    );
    flipAnimation = Tween<double>(begin: 0, end: 3.14).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isFlipped) {
            controller.reverse();
          } else {
            controller.forward();
          }
          isFlipped = !isFlipped;
        });
      },
      child: AnimatedBuilder(
        animation: flipAnimation,
        builder: (context, child) {
          return Transform(
            transform: Matrix4.rotationY(flipAnimation.value),
            alignment: Alignment.center,
            child: isFlipped ? widget.back : widget.front,
          );
        },
      ),
    );
  }
}
