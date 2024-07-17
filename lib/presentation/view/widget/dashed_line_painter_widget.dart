import 'package:flutter/material.dart';

class DashedLinePainter extends CustomPainter {
  final double dashWidth;
  final double dashSpace;
  final Paint dashPaint;

  DashedLinePainter({this.dashWidth = 5.0, this.dashSpace = 3.0, Color color = Colors.black38})
      : dashPaint = Paint()
    ..color = color
    ..strokeWidth = 1;

  @override
  void paint(Canvas canvas, Size size) {
    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), dashPaint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
