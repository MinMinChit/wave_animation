library flutter_wave;

import 'package:flutter/material.dart';

class WaveAnimation extends CustomPainter {
  WaveAnimation({
    required this.waveLength,
    required this.waveHeight,
    this.reverse,
    this.color,
    this.stokeWidth,
  });
  final double waveLength;
  final double waveHeight;
  final bool? reverse;
  final Color? color;
  final double? stokeWidth;
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color ?? Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = stokeWidth ?? 4.0;

    Path path = Path();
    path.moveTo(0, 100);
    for (var i = 1; i < 20; i++) {
      if (reverse != true) {
        if (i % 2 != 0) {
          path.quadraticBezierTo((waveLength * i) - (waveLength / 2), 0,
              waveLength * i, waveHeight / 2);
        } else {
          path.quadraticBezierTo((waveLength * i) - (waveLength / 2),
              waveHeight, waveLength * i, waveHeight / 2);
        }
      } else {
        if (i % 2 != 0) {
          path.quadraticBezierTo((waveLength * i) - (waveLength / 2),
              waveHeight, waveLength * i, waveHeight / 2);
        } else {
          path.quadraticBezierTo((waveLength * i) - (waveLength / 2), 0,
              waveLength * i, waveHeight / 2);
        }
      }
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(WaveAnimation oldDelegate) => false;
}
