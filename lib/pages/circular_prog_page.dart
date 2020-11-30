import 'dart:math';

import 'package:flutter/material.dart';

class CircularProgPage extends StatefulWidget {
  @override
  _CircularProgPageState createState() => _CircularProgPageState();
}

class _CircularProgPageState extends State<CircularProgPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        height: 300,
        width: 300,
        color: Colors.red,
        child: CustomPaint(
          painter: _MiProgPainter(),
        ),
      )),
    );
  }
}

class _MiProgPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pincel = new Paint()
      ..strokeWidth = 10.0
      ..color = Colors.green
      ..style = PaintingStyle.stroke;

    Offset c = new Offset(size.width * 0.5, size.height * 0.5);
    double radius = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(c, radius, pincel);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
