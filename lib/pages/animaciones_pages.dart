import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimacionesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CuadradoAnimado(),
      ),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  @override
  _CuadradoAnimadoState createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> rotacion;
  Animation<double> opacidad;

  @override
  void initState() {
    controller =
        new AnimationController(vsync: this, duration: Duration(seconds: 4));

    opacidad = Tween(begin: 0.1, end: 1.0).animate(controller);

    rotacion = Tween(begin: 0.0, end: 2.0 * Math.pi)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));

    controller.addListener(() {
      //print(controller.status);

      if (controller.status == AnimationStatus.completed) {
        // controller.reverse();
        controller.reset();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();

    return AnimatedBuilder(
      animation: controller,
      child: _Cuadrado(),
      builder: (BuildContext context, Widget child) {
        //print(rotacion.value);
        return Transform.rotate(
            angle: rotacion.value,
            child: Opacity(
              opacity: opacidad.value,
              child: child,
            ));
      },
    );
  }
}

class _Cuadrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
}
