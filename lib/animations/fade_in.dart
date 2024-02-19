import 'package:flutter/material.dart';

enum FadeDirection { ttb, btt, ltr, rtl }

class FadeInAnimation extends StatefulWidget {
  const FadeInAnimation({
    super.key,
    required this.child,
    required this.delay,
    required this.direction,
  });

  final Widget child;
  final double delay;
  final FadeDirection direction;

  @override
  State<FadeInAnimation> createState() => _FadeInAnimationState();
}

class _FadeInAnimationState extends State<FadeInAnimation>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> opacityAnimation;
  late Animation<double> inAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        duration: Duration(milliseconds: (500 * widget.delay).round()),
        vsync: this);
    inAnimation = Tween<double>(begin: -40, end: 0).animate(controller)
      ..addListener(() {
        setState(() {});
      });

    opacityAnimation = Tween<double>(begin: 0, end: 1).animate(controller)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    controller.forward();
    return Transform.translate(
      offset: switch (widget.direction) {
        FadeDirection.ltr => Offset(inAnimation.value, 0),
        FadeDirection.rtl => Offset(size.width - inAnimation.value, 0),
        FadeDirection.ttb => Offset(0, inAnimation.value),
        FadeDirection.btt => Offset(0, 0 - inAnimation.value),
      },
      child: Opacity(
        opacity: opacityAnimation.value,
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
