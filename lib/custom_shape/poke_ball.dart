import 'dart:math' as math;

import 'package:flutter/material.dart';

class PokeBallClipper extends CustomClipper<Path> {
  PokeBallClipper({this.width});
  double? width;
  @override
  Path getClip(Size size) {
    final double radius = size.width / 2 + 0.3;
    var width = this.width ?? size.width / 3.5;

    Path path = Path();
    path
      ..moveTo(0, size.height / 2 - 5)
      ..arcToPoint(Offset(size.width, size.height / 2 - 5),
          radius: Radius.circular(radius))
      ..lineTo(size.width - width, size.height / 2 - 5)
      ..arcToPoint(Offset(width, size.height / 2 - 5),
          radius: Radius.circular(radius - width), clockwise: false)
      ..lineTo(0, size.height / 2 - 5)
      ..moveTo(0, size.height / 2 + 5)
      ..arcToPoint(
        Offset(size.width, size.height / 2 + 5),
        radius: Radius.circular(radius),
        clockwise: false,
      )
      ..lineTo(size.width - width, size.height / 2 + 5)
      ..arcToPoint(
        Offset(width, size.height / 2 + 5),
        radius: Radius.circular(radius - width),
        clockwise: true,
      )
      ..lineTo(0, size.height / 2 + 5)
      ..addArc(
          Rect.fromCircle(
              center: Offset(size.height / 2, size.width / 2),
              radius: radius / 4),
          0,
          2 * math.pi)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
