import 'package:flutter/material.dart';

class DetailScreenClipper extends CustomClipper<Path> {
  final double height;

  DetailScreenClipper({super.reclip, this.height = 30});
  @override
  Path getClip(Size size) {
    Path path = Path();
    path
      ..moveTo(0, size.height)
      ..quadraticBezierTo(0, size.height - height, height, size.height - height)
      ..lineTo(size.width - height, size.height - height)
      ..quadraticBezierTo(
          size.width, size.height - height, size.width, size.height)
      ..lineTo(size.width, 0)
      ..lineTo(0, 0)
      ..lineTo(0, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
