import 'package:flutter/material.dart';

class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..moveTo(0, size.height * 0.9)
      ..arcToPoint(Offset(size.width, size.height * 0.9),
          radius: Radius.circular(size.height), clockwise: false)
      ..lineTo(size.width, 0)
      ..lineTo(0, 0)
      ..close();

    //..arcToPoint(Offset(size.width, size.height * 0.9),
    // radius: Radius.circular(size.height), clockwise: false)

    // ..conicTo(size.width / 2, size.height, size.width, size.height * 0.9, 2)
    // ..quadraticBezierTo(
    //     size.width / 2, size.height, size.width, size.height * 0.8)
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}
