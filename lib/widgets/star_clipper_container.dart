import 'dart:math' as math;

import 'package:flutter/widgets.dart';

class StarClipper extends CustomClipper<Path> {
  StarClipper(this.numberOfPoints);

  final int numberOfPoints;

  late int counter = 0;

  @override
  Path getClip(Size size) {
    double width = size.width;

    double halfWidth = width / 2;

    double radius = halfWidth / 1.11;

    double degreesPerStep = _degToRad(360 / numberOfPoints) as double;

    double halfDegreesPerStep = degreesPerStep / 2;
    double outerCurveRadius = width / 2;
    double innerCurveRadius = width / 2.6;
    var path = Path();

    double max = 2 * math.pi;

    path.moveTo(width, halfWidth);

    path.moveTo(
      halfWidth + radius * math.cos(0 + halfDegreesPerStep),
      halfWidth + radius * math.sin(0 + halfDegreesPerStep),
    );

    for (double step = 0; step < max + 1; step += degreesPerStep) {
      if (counter % 2 == 0) {
        path.quadraticBezierTo(
          halfWidth + outerCurveRadius * math.cos(step),
          halfWidth + outerCurveRadius * math.sin(step),
          halfWidth + radius * math.cos(step + halfDegreesPerStep),
          halfWidth + radius * math.sin(step + halfDegreesPerStep),
        );
      } else {
        path.quadraticBezierTo(
          halfWidth + innerCurveRadius * math.cos(step),
          halfWidth + innerCurveRadius * math.sin(step),
          halfWidth + radius * math.cos(step + halfDegreesPerStep),
          halfWidth + radius * math.sin(step + halfDegreesPerStep),
        );
      }

      counter++;
    }
    path.close();
    return path;
  }

  num _degToRad(num deg) => deg * (math.pi / 180.0);

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    StarClipper oldie = oldClipper as StarClipper;
    return numberOfPoints != oldie.numberOfPoints;
  }
}
