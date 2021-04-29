import 'package:flutter/material.dart';

class ShadowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    final paint = Paint()..color = Colors.black12;

    path.lineTo(size.width, 15);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(ShadowPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(ShadowPainter oldDelegate) => false;
}
