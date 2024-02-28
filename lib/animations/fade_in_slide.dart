import 'package:flutter/material.dart';

enum FadeSlideDirection { ttb, btt, ltr, rtl }

class FadeInSlide extends StatefulWidget {
  const FadeInSlide({
    super.key,
    required this.child,
    required this.duration,
    this.curve = Curves.easeInOutBack,
    this.fadeOffset = 40,
    this.direction = FadeSlideDirection.ttb,
  });

  final Widget child;
  final double duration;
  final double fadeOffset;
  final Curve curve;
  final FadeSlideDirection direction;

  @override
  State<FadeInSlide> createState() => _FadeInSlideState();
}

class _FadeInSlideState extends State<FadeInSlide>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> opacityAnimation;
  late Animation<double> inAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        duration: Duration(milliseconds: (1000 * widget.duration).toInt()),
        vsync: this);
    inAnimation = Tween<double>(begin: -widget.fadeOffset, end: 0).animate(
      CurvedAnimation(
        parent: controller,
        curve: widget.curve,
      ),
    )..addListener(() {
        setState(() {});
      });

    opacityAnimation = Tween<double>(begin: 0, end: 1).animate(controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    controller.forward();
    return Transform.translate(
      offset: switch (widget.direction) {
        FadeSlideDirection.ltr => Offset(inAnimation.value, 0),
        FadeSlideDirection.rtl => Offset(size.width - inAnimation.value, 0),
        FadeSlideDirection.ttb => Offset(0, inAnimation.value),
        FadeSlideDirection.btt => Offset(0, 0 - inAnimation.value),
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
