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
        padding: EdgeInsets.all(5.0),
        height: 300,
        width: 300,
        // color: Colors.red,
        child: CustomPaint(
          painter: _MiProgPainter(80),
        ),
      )),
    );
  }
}

class _MiProgPainter extends CustomPainter {
  //Aqui esta el porcentaje para el arco superior
  num porcentaje;
  _MiProgPainter(this.porcentaje);

  @override
  void paint(Canvas canvas, Size size) {
    final pincel = new Paint()
      ..strokeWidth = 4.0
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    final c = new Offset(size.width * 0.5, size.height * 0.5);
    final radius = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(c, radius, pincel);

    //ARCO
    final arcoPincel = new Paint()
      ..strokeWidth = 10.0
      ..color = Colors.lightBlue
      ..style = PaintingStyle.stroke;

    final arcAngle = 2 * pi * (porcentaje / 100);

    canvas.drawArc(Rect.fromCircle(center: c, radius: radius), -pi / 2,
        arcAngle, false, arcoPincel);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
